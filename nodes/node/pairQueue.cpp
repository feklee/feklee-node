#include "pairQueue.h"
#include "settings.h"

static uint8_t first = 0;
static uint8_t last = 0;
static uint8_t length = 0;
static Pair buffer[pairBufferSize];

static void incrementPosition(uint8_t &position) {
  position = (position + 1) % pairBufferSize;
}

static void decrementLength() {
  length = (length > 0) ? length - 1 : 0;
}

void enqueuePair(Pair pair) {
  buffer[last] = pair;
  incrementPosition(last);

  if (length < pairBufferSize) {
    length ++;
  } else {
    incrementPosition(first);
  }
}

Pair dequeuePair() {
  if (length == 0) {
    return emptyPair;
  }

  Pair pair = buffer[first];
  incrementPosition(first);
  decrementLength();
  return pair;
}
