// Optimizes the locations of nodes using a genetic algorithm. After
// optimization, ideally all neighboring nodes have a distance of 1,
// and the angles between the connecting vectors match those on the
// spheres.

/*jslint browser: true, maxlen: 80 */

import visibleNodes from "./visible-nodes.mjs";
import settings from "./settings.mjs";
import vector from "./vector.mjs";
import {
    Vector3
} from "../../node_modules/three/build/three.module.js";
import jsga from "jsga-feklee";

var loSettings = settings.locationOptimizer;

var updateExpectedNeighborLocation = function (connection) {
    connection.expectedNeighborLocation =
        connection.fromPort.node.testLocation.clone().add(
            connection.expectedVector
        );
};

var setExpectedNeighborLocation1 = function (connection) {
    connection.expectedVector = vector.normalizedConnectingVector(
        connection.fromPort.node.testLocation,
        connection.toPort.node.testLocation
    );
    updateExpectedNeighborLocation(connection);
};

var setExpectedNeighborLocation2 = function (connection2) {
    var node = connection2.fromPort.node;
    var connection1 = node.visibleConnections[0];

    var a = connection1.expectedVector;
    var b = vector.normalizedConnectingVector(
        node.testLocation,
        connection2.toPort.node.testLocation
    );
    vector.normalizeOrRandomize(b);
    vector.rotateToTetrahedralAngle(a, b);

    connection2.expectedVector = b;

    updateExpectedNeighborLocation(connection2);
};

var setExpectedNeighborLocation3 = function (connection3) {
    var node = connection3.fromPort.node;
    var connection1 = node.visibleConnections[0];
    var connection2 = node.visibleConnections[1];

    var a = connection1.expectedVector;
    var b = connection2.expectedVector;
    var cw = b.clone().applyAxisAngle(a, vector.tetrahedralAngle);
    var ccw = b.clone().applyAxisAngle(a, -vector.tetrahedralAngle);

    switch (connection1.fromPort.portNumber) {
    case 1:
        switch (connection2.fromPort.portNumber) {
        case 2:
            switch (connection3.fromPort.portNumber) {
            case 3:
                connection3.expectedVector = cw;
                break;
            case 4:
                connection3.expectedVector = ccw;
                break;
            }
            break;
        case 3:
            connection3.expectedVector = cw;
            break;
        }
        break;
    case 2:
        connection3.expectedVector = ccw;
        break;
    }

    updateExpectedNeighborLocation(connection3);
};

var setExpectedNeighborLocation4 = function (connection4) {
    var node = connection4.fromPort.node;
    var connection1 = node.visibleConnections[0];
    var connection2 = node.visibleConnections[1];

    var a = connection1.expectedVector;
    var b = connection2.expectedVector;

    connection4.expectedVector =
        b.clone().applyAxisAngle(a, -vector.tetrahedralAngle);

    updateExpectedNeighborLocation(connection4);
};

var setExpectedNeighborLocation = function (connection, i) {
    switch (i) {
    case 0:
        setExpectedNeighborLocation1(connection);
        break;
    case 1:
        setExpectedNeighborLocation2(connection);
        break;
    case 2:
        setExpectedNeighborLocation3(connection);
        break;
    case 3:
        setExpectedNeighborLocation4(connection);
        break;
    }
};

var addDeviation = function (deviations, connection) {
    var deviation =
        connection.toPort.node.testLocation.distanceToSquared(
            connection.expectedNeighborLocation
        );

    deviations.push(deviation);
};

var addDeviationsForNode = function (deviations, node) {
    node.visibleConnections.forEach(function (connection, i) {
        setExpectedNeighborLocation(connection, i);
        addDeviation(deviations, connection);
    });
};

var findDeviations = function () {
    var deviations = [];
    visibleNodes.forEach(function (node) {
        addDeviationsForNode(deviations, node);
    });
    return deviations;
};

var sumOfDeviations = function () {
    return findDeviations().reduce((a, b) => a + b, 0);
};

var coordinateFromIndividual = function (individual, nodeIndex,
                                         coordinateIndex) {
    return individual[nodeIndex * 3 + coordinateIndex] / loSettings.resolution;
};

var coordinateToIndividual = function (individual, nodeIndex,
                                       coordinateIndex,
                                       coordinate) {
    individual[nodeIndex * 3 + coordinateIndex] =
        Math.round(coordinate * loSettings.resolution);
};

var assignLocationsToNodes = function (locationType, individual) {
    visibleNodes.forEach(function (node, i) {
        if (node[locationType] === undefined) {
            node[locationType] = new Vector3();
        }
        var location = node[locationType];
        location.x = coordinateFromIndividual(individual, i, 0);
        location.y = coordinateFromIndividual(individual, i, 1);
        location.z = coordinateFromIndividual(individual, i, 2);
    });
};

var fitness = function (individual) {
    assignLocationsToNodes("testLocation", individual);
    return -sumOfDeviations();
};

var findCenter = function () {
    var center = new Vector3();

    visibleNodes.forEach(function (node) {
        center.add(node.location);
    });

    center.divideScalar(visibleNodes.length);

    return center;
};

var moveCenterToOrigin = function () {
    var center = findCenter();

    visibleNodes.forEach(function (node) {
        node.location.sub(center);
    });
};

var iterator;

var createSeedFromNodeLocations = function (seedSize) {
    var individual = [];

    visibleNodes.forEach(function (node, i) {
        var location = node.location;
        coordinateToIndividual(individual, i, 0, location.x);
        coordinateToIndividual(individual, i, 1, location.y);
        coordinateToIndividual(individual, i, 2, location.z);
    });

    var a = Array;
    return a(seedSize).fill(individual);
};

var update = function () {
    var numberOfVisibleNodes = visibleNodes.length;
    var nothingToBeDone = numberOfVisibleNodes <= 1;
    if (nothingToBeDone) {
        return;
    }

    var length = (3 * // number of coordinates per 3D point
                  numberOfVisibleNodes);
    var algorithm = jsga({
        length: length,
        radix: loSettings.sideLength * loSettings.resolution,
        fitness: fitness,
        size: loSettings.populationSize,
        seed: createSeedFromNodeLocations(loSettings.seedSize),
        mutationRate: loSettings.mutationRate,
        crossovers: loSettings.crossovers
    });
    var iterable = algorithm.run(-1);
    iterator = iterable[Symbol.iterator]();
};

var deviation = function (population) {
    var fitnessList = [];
    population.forEach(function (individual) {
        fitnessList.push(fitness(individual));
    });
    var mean = fitnessList.reduce((a, b) => a + b, 0) / fitnessList.length;
    var sigma = 0; // standard deviation
    fitnessList.forEach(function (x) {
        var delta = x - mean;
        sigma += delta * delta;
    });
    sigma /= fitnessList.length;
    sigma = Math.sqrt(sigma);
    return [mean, sigma];
};

var startTime;

var updateNodeLocations = function (generation) {
    var now = Date.now();
    if (startTime === undefined) {
        startTime = now;
    }
    var elapsedTime = now - startTime;
    if (elapsedTime > 10000) {
        startTime = now;
        console.log(
            elapsedTime,
            generation.generation,
            fitness(generation.best.params),
            deviation(generation.population)
        );
    }
    assignLocationsToNodes("location", generation.best.params);
    moveCenterToOrigin();
};

var run = function () {
    var item;
    var iterate;
    iterate = function () {
        if (iterator === undefined) {
            setTimeout(iterate, 0);
            return;
        }
        item = iterator.next();
        var generation = item.value;
        updateNodeLocations(generation);
        setTimeout(iterate, 0);
    };
    iterate();
};

run();

export default {
    update: update
};
