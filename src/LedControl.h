#ifndef _LED_CONTROL_H_
#define _LED_CONTROL_H_

#include <avr/io.h>

#define LED_PIN PB5

namespace LED {
inline void begin() {
    DDRB |= (1 << LED_PIN);
}
inline void turnOn() {
    PORTB |= (1 << LED_PIN);
}
inline void turnOff() {
    PORTB &= ~(1 << LED_PIN);
}
};  // namespace LED

#endif