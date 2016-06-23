#include <avr/io.h>

void run_timer1();
void run_timer2();
void run_timer3();

int main(void)
{
    DDRB = 0xFF;
    PORTB = 0x00;

    while(1)
    {
        // Remove Timers as necessary
        run_timer1();
        run_timer2();
        run_timer3();
    }
}



void run_timer1()
{
    TCCR1B |= (1 << WGM12);
    OCR1A = 50000;
    TCCR1B |= (1 << CS11);

    while (1)
    {
        if (TIFR & (1 << OCF1A))
        {
            PORTB ^= (1 << PORTB0);
            TIFR = (1 << OCF1A);
            TCCR1B = 0x00;
            return;
        }
    }
}

void run_timer2()
{
    TCCR2 |= (1 << WGM20) | (1 << WGM21);
    OCR2 = 200;
    TCCR2 |= (1 << CS22) | (1 << CS21) | (0 << CS20);

    while (1)
    {
        if (TIFR & (1 << OCF2))
        {
            PORTB ^= (1 << PORTB1);
            TIFR = (1 << OCF2);
            TCCR2 = 0;
            return;
        }
    }
}

void run_timer3()
{
    TCCR0 |= (1 << WGM01) | (0 << WGM00);
    OCR0 = 200;
    TCCR0 |= (1 << CS02) | (0 << CS01) | (0 << CS00);

    while (1)
    {
        if (TIFR & (1 << OCF0))
        {
            PORTB ^= (1 << PORTB2);
            TIFR = (1 << OCF0);
            TCCR0 = 0;
            return;
        }
    }
}
