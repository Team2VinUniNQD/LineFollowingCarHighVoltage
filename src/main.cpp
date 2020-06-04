#include <Arduino.h>
#include <PID_v1.h>
#include <QTRSensors.h>

#include "MotorControl.h"

// ! Tunr off _DEBUG to avoid oscillation
#define _DEBUG false

#define SONAR_TRIG_PIN A0
#define SONAR_ECHO_PIN A1

#define START_BUTTON_PIN 10

const uint8_t sensorCount = 8;
const uint8_t sensorPins[sensorCount] = {12, 9, 5, 4, A5, A4, A3, A2};
uint16_t sensorValues[sensorCount];

double setPoint = 3500.0;
double pos = 0;
double adjust = 0;

double initialBaseSpeed = 150;

// Line follow base speed
double baseSpeed = 255.0;

// use these with baseSpeed = 170
double Kp = 0.065;
double Ki = 0.0;
double Kd = 0.0009;

uint64_t looopStartMillis = 0;

QTRSensors qtr;
PID pid(&pos, &adjust, &setPoint, Kp, Ki, Kd, DIRECT);

bool lineFollowInitialized = false;
bool inRamUp = true;

uint8_t status = 0;
bool tunelPassed = false;

uint64_t switchMillis = 0;

uint32_t checkDistance() {
    digitalWrite(SONAR_TRIG_PIN, 1);
    delayMicroseconds(5);
    digitalWrite(SONAR_TRIG_PIN, 0);
    uint64_t dur = pulseIn(A1, HIGH);
    uint32_t dis = dur / 2 / 29.412;
    return dis;
}

void adjustCarTunnel() {
    Motor::setSpeed(255, 10);
}

void calibrateSensor() {
    digitalWrite(LED_BUILTIN, HIGH);  // turn on Arduino's LED to indicate we are in calibration mode

    Motor::setSpeed(60, 60);
    for (uint16_t i = 0; i < 400; i++) {
        qtr.calibrate();
        if (i < 50) {
            Motor::setDir(Motor::motorDir::forward, Motor::motorDir::reverse);
        } else if (i > 50 && i < 100) {
            Motor::setDir(Motor::motorDir::reverse, Motor::motorDir::forward);
        } else if (i > 100 && i < 150) {
            Motor::setDir(Motor::motorDir::forward, Motor::motorDir::reverse);
        } else if (i > 150 && i < 200) {
            Motor::setDir(Motor::motorDir::reverse, Motor::motorDir::forward);
        } else if (i > 200 && i < 250) {
            Motor::setDir(Motor::motorDir::forward, Motor::motorDir::reverse);
        } else if (i > 250 && i < 300) {
            Motor::setDir(Motor::motorDir::reverse, Motor::motorDir::forward);
        } else if (i > 300 && i < 350) {
            Motor::setDir(Motor::motorDir::forward, Motor::motorDir::reverse);
        } else if (i > 350 && i < 400) {
            Motor::setDir(Motor::motorDir::reverse, Motor::motorDir::forward);
        }
    }
    Motor::setSpeed(0, 0);
    Motor::setDir(Motor::motorDir::forward, Motor::motorDir::forward);
    digitalWrite(LED_BUILTIN, LOW);  // turn off Arduino's LED to indicate we are through with calibration
}

void initLineFollowMode() {
    pid.SetTunings(Kp, Ki, Kd);
    pid.SetMode(AUTOMATIC);
    pid.SetSampleTime(5);
    pid.SetOutputLimits(-initialBaseSpeed, initialBaseSpeed);
    lineFollowInitialized = true;
}
void setup() {
    // config sonar pin
    pinMode(SONAR_TRIG_PIN, OUTPUT);
    pinMode(SONAR_ECHO_PIN, INPUT);
    pinMode(START_BUTTON_PIN, INPUT_PULLUP);

    // config indicator led
    pinMode(LED_BUILTIN, OUTPUT);

    // configure the line sensors
    qtr.setTypeRC();
    qtr.setSensorPins(sensorPins, sensorCount);
    qtr.setEmitterPin(2);
    qtr.setNonDimmable();
    delay(500);

    // Init motor (timer,...)
    Motor::begin();
    calibrateSensor();

#if _DEBUG
    Serial.begin(115200);
#endif

    delay(2000);
    initLineFollowMode();
    while (digitalRead(START_BUTTON_PIN)) {
    };
    looopStartMillis = millis();
}

bool ramUp = true;
double speed = initialBaseSpeed;
uint64_t lastCountMillis = 0;

void loop() {
    if (status == 0) {  // if status = 0 aka following line
        if (ramUp) {
            if (millis() - looopStartMillis > 750) {
                pid.SetOutputLimits((double)-baseSpeed, (double)baseSpeed);
                speed = baseSpeed;
                ramUp = false;
            }
        }

        uint16_t position = qtr.readLineBlack(sensorValues);
        // if detect line
        if ((sensorValues[4] > 800 && sensorValues[3] > 800 && (sensorValues[2] > 800 || sensorValues[5] > 800))) {
            if (millis() - switchMillis > 500) {
                // doesn't switch when ram up to avoid the START arrow
                if (!ramUp) {
                    if (!tunelPassed)
                        status = 1;
                    else  // jump to stop
                        status = 100;
                    switchMillis = millis();
                }
            }
        }

// ! Turn off debug to avoid oscillation
#if (_DEBUG)
        for (auto values : sensorValues) {
            Serial.print(values);
            Serial.print(' ');
        }

        Serial.println();
        Serial.print(position);
        Serial.print(" ");
        Serial.println(adjust);
        delay(50);
#endif
        pos = position;
        pid.Compute();
        if (adjust > 0) {
            Motor::setSpeed(speed - adjust, speed);
        } else {
            Motor::setSpeed(speed, speed + adjust);
        }

    } else if (status == 1) {  // aka tunnel mode
        qtr.readCalibrated(sensorValues);
        if (millis() - switchMillis > 500 && (sensorValues[0] > 700 || sensorValues[1] > 700 || sensorValues[2] > 700 || sensorValues[3] > 700 || sensorValues[4] > 700 || sensorValues[5] > 700 || sensorValues[6] > 700 || sensorValues[7] > 700)) {
            status = 0;
            tunelPassed = true;
            switchMillis = millis();
        }
        Motor::setSpeed(200, 200);
        if (checkDistance() <= 10) {
            adjustCarTunnel();
        }

    } else if (status == 100) {
        Motor::setSpeed(200, 0);
        delay(300);
        Motor::setSpeed(0, 0);
        while (1) {
        };
    }
}
