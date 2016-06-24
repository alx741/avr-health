#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

int main(void)
{
    DDRB = 0xFF;
    PORTB = 0x00;
    DDRD = 0x00;
    PORTD = (1 << PD2) | (1 << PD3);
    GICR = (1 << INT0) | (1 << INT1);
    MCUCR = (1 << ISC00) | (1 << ISC01) | (1 << ISC10) | (1 << ISC11);
    sei();

    while (1)
    {
        _delay_ms(500);
        PORTB ^= (1 << PORTB2);
    }
}

void blink(int pin)
{
    for (int i=0; i<3; i++)
    {
        PORTB ^= (1 << pin);
        _delay_ms(300);
    }
}

ISR(INT0_vect)
{
    blink(0);
}

ISR(INT1_vect)
{
    blink(1);
}
