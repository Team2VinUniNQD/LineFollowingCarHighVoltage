#include <Arduino.h>
#include <PID_v1.h>
#include <QTRSensors.h>

#include "LedControl.h"
#include "MotorControl.h"
// * Flag to toggle feature
// ! Tunr off FLAG_DEBUG to avoid oscillation
#define FLAG_DEBUG false

#define FLAG_USE_NEW_CALIBRATE_PROCEDURE true

#define SONAR_TRIG_PIN A0
#define SONAR_ECHO_PIN A1

#define START_BUTTON_PIN 10

const uint8_t sensorCount = 8;
const uint8_t sensorPins[sensorCount] = {12, 9, 5, 4, A5, A4, A3, A2};
uint16_t sensorValues[sensorCount];

double setPoint = 3500.0;
double pos = 0.0;
double adjust = 0.0;

const double initialBaseSpeed = 150;

// Line follow base speed
const double baseSpeed = 170.0;

// use these with baseSpeed = 170
double Kp = 0.065;
double Ki = 0.0;
double Kd = 0.0013;

uint64_t looopStartMillis = 0;
bool lineFollowInitialized = false;
uint8_t status = 0;
bool tunelPassed = false;
bool ramUp = true;
double speed = initialBaseSpeed;
uint64_t switchMillis = 0;
uint64_t currentMillis = 0;

QTRSensors qtr;
PID pid(&pos, &adjust, &setPoint, Kp, Ki, Kd, DIRECT);

uint32_t checkDistance() {
    PORTC |= (1 << PC0);
    delayMicroseconds(5);
    PORTC &= ~(1 << PC0);
    uint8_t oldSREG = SREG;
    cli();
    uint64_t dur = pulseIn(A1, HIGH, 1000000UL);
    sei();
    SREG = oldSREG;
    return dur / 2 / 29.412;
}

inline void adjustCarTunnel() {
    Motor::setSpeed(255, 10);
}
void calibrateSensor() {
    LED::turnOn();
    Motor::setDir(Motor::motorDir::forward, Motor::motorDir::reverse);
    Motor::setSpeed(50, 50);
    for (uint16_t i = 0; i < 400; i++)
        qtr.calibrate();
    Motor::setSpeed(0, 0);
    Motor::setDir(Motor::motorDir::forward, Motor::motorDir::forward);
    LED::turnOff();
}

void initLineFollowMode() {
    pid.SetTunings(Kp, Ki, Kd);
    pid.SetMode(AUTOMATIC);
    pid.SetSampleTime(5);
    pid.SetOutputLimits(-initialBaseSpeed, initialBaseSpeed);
    lineFollowInitialized = true;
}

int main() {
    // Arduino stuff, don't touch
    init();

    // Prog stuff, can be touched
    pinMode(SONAR_TRIG_PIN, OUTPUT);
    pinMode(SONAR_ECHO_PIN, INPUT);
    pinMode(START_BUTTON_PIN, INPUT_PULLUP);

    // status indicator led
    pinMode(LED_BUILTIN, OUTPUT);

    // configure the line sensors
    qtr.setTypeRC();
    qtr.setSensorPins(sensorPins, sensorCount);
    qtr.setEmitterPin(2);
    qtr.setNonDimmable();
    qtr.setTimeout(2000);
    delay(500);

    // Init motor (timer,...)
    Motor::begin();
    LED::begin();
    calibrateSensor();

#if FLAG_DEBUG
    Serial.begin(115200);
#endif

    delay(2000);
    initLineFollowMode();
    while (digitalRead(START_BUTTON_PIN)) {
        // empty waiting loop
    };
    looopStartMillis = millis();
    for (;;) {
        currentMillis = millis();
        if (status == 0) { // if status = 0 aka following line
            if (ramUp) {
                if (currentMillis - looopStartMillis > 750) {
                    pid.SetOutputLimits((double)-baseSpeed, (double)baseSpeed);
                    speed = baseSpeed;
                    ramUp = false;
                }
            }

            pos = qtr.readLineBlack(sensorValues);
            currentMillis = millis();
            // if detect line
            if ((sensorValues[4] > 800 && sensorValues[3] > 800 && (sensorValues[2] > 800 || sensorValues[5] > 800))) {
                if (currentMillis - switchMillis > 500) {
                    // doesn't switch when ram up to avoid the START arrow
                    if (currentMillis - looopStartMillis >= 7000) {
                        if (!tunelPassed)
                            status = 1;
                        else // jump to stop
                            status = 100;
                        switchMillis = currentMillis;
                    }
                }
            }

// ! Turn off debug to avoid oscillation
#if (FLAG_DEBUG)
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

            pid.Compute();
            if (adjust > 0) {
                Motor::setSpeed(speed - adjust, speed);
            } else {
                Motor::setSpeed(speed, speed + adjust);
            }
        } else if (status == 1) { // aka tunnel mode
            qtr.readCalibrated(sensorValues);
            if (currentMillis - switchMillis > 500 && (sensorValues[0] > 700 || sensorValues[1] > 700 || sensorValues[2] > 700 || sensorValues[3] > 700 || sensorValues[4] > 700 || sensorValues[5] > 700 || sensorValues[6] > 700 || sensorValues[7] > 700)) {
                status = 0;
                tunelPassed = true;
                switchMillis = millis();
            }
            Motor::setSpeed(200, 200);
            if (checkDistance() <= 10) {
                adjustCarTunnel();
            }
        } else if (status == 100) {
            Motor::setSpeed(200, 100);
            delay(100);
            Motor::setSpeed(0, 0);
            status = 200;
        } else if (status == 200) {
            // wait for the button to be pressed
            if (!digitalRead(START_BUTTON_PIN)) {
                status = 0;
                tunelPassed = false;
                ramUp = true;
                looopStartMillis = currentMillis;
            };
        }
    }
    return 0;
}
