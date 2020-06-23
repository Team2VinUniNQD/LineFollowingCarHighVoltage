#include <PID_v1.h>
#include <avr/interrupt.h>
extern PID pid;
ISR(TIMER1_COMPA_vect) {
    PID::ComputeISR(&pid);
}

void initTimerInterrupt() {
    uint8_t oldSREG = SREG;
    cli();
    TCCR1A = 0;
    TCCR1B = (1 << CS11) | (1 << WGM12);
    OCR1A = 10000;
    TIMSK1 = (1 << OCIE1A);
    TIFR1 = 0;
    TCNT1 = 0;
    sei();
    SREG = oldSREG;
}