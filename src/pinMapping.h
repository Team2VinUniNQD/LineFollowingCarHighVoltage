#ifndef PIN_MAPPING
#define PIN_MAPPING

#include <Arduino.h>

#define SONAR_TRIG_PIN A0
#define SONAR_ECHO_PIN A1
#define SENSOR_7_PIN A2
#define SENSOR_6_PIN A3
#define SENSOR_5_PIN A4
#define SENSOR_4_PIN A5
#define _UNUSED_1 A6
#define _UNUSED_2 A7

#define SERIAL_RX_PIN 0
#define SERIAL_TX_PIN 1
#define SENSOR_EMITTER_PIN 2
#define LEFT_PWM_PIN 3
#define SENSOR_3_PIN 4
#define SENSOR_2_PIN 5
#define _NOT_USE_PIN_1 6  // actually connect to RIGHT_PWM_PIN
#define RIGHT_DIR_PIN 7

#define LEFT_DIR_PIN 8
#define SENSOR_1_PIN 9
#define _UNUSED_3 10
#define RIGHT_PWM_PIN 11
#define SENSOR_0_PIN 12
#define LED_PIN 13

#endif /* PIN_MAPPING */