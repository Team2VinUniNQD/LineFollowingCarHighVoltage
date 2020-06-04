#include <avr/interrupt.h>
#include <avr/io.h>
#include <avr/portpins.h>

#define LEFT_DIR_PIN PD7   // pin 8
#define RIGHT_DIR_PIN PB0  // pin 7

#define LEFT_PWM_PIN PD3   // pin 3
#define RIGHT_PWM_PIN PB3  // pin 11

namespace Motor {
enum class motorDir {
    forward,
    reverse
};
inline void begin() {
    cli();
    DDRD |= (1 << LEFT_PWM_PIN) | (1 << LEFT_DIR_PIN);
    DDRB |= (1 << RIGHT_PWM_PIN) | (1 << RIGHT_DIR_PIN);

    PORTD |= (1 << LEFT_DIR_PIN);
    PORTB |= (1 << RIGHT_DIR_PIN);

    TCCR2A = (1 << COM2A1) | (1 << COM2B1) | (1 << WGM20);
    TCCR2B = (1 << CS20);

    OCR2A = 0;
    OCR2B = 0;

    sei();
};
inline void setLeftSpeed(uint8_t speed) {
    OCR2A = speed;
}
inline void setRightSpeed(uint8_t speed) {
    OCR2B = speed;
}
inline void setSpeed(uint8_t speedLeft, uint8_t speedRight) {
    OCR2A = speedLeft;
    OCR2B = speedRight;
}

inline void setLeftDir(motorDir dir) {
    PORTD = dir == motorDir::forward ? PORTD | (1 << LEFT_DIR_PIN)
                                     : PORTD & ~(1 << LEFT_DIR_PIN);
}
inline void setRightDir(motorDir dir) {
    PORTB = dir == motorDir::forward ? PORTB | (1 << RIGHT_DIR_PIN)
                                     : PORTB & ~(1 << RIGHT_DIR_PIN);
}
inline void setDir(motorDir leftDir, motorDir rightDir) {
    setLeftDir(leftDir);
    setRightDir(rightDir);
}
}  // namespace Motor