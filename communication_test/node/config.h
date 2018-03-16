#ifndef config_h
#define config_h

#include "Arduino.h"

#define DEBUG

const uint8_t ledPin = 13;
const uint8_t portsCount = 4;
const uint8_t portPins[portsCount] = {2, 3, 4, 5};
const unsigned long graceTime = 100; // time for other node to switch to receive
const unsigned long timeSlotDuration = 500; // ms
const uint8_t pairBufferSize = 10;

#ifdef DEBUG
const boolean flashLedIsEnabled = true; // takes time
#else
const boolean flashLedIsEnabled = false;
#endif

#endif
