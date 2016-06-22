// Using internal 1Mhz clock
#define F_CPU 1000000

#include <avr/io.h>
#include <stdlib.h>
#include <util/delay.h>

void fail()
{
    PORTB = 0b00000010;
    exit(1);
}

void success()
{
    PORTB = 0b00000001;
    exit(0);
}

int main(void)
{
    DDRB = 0xFF;
    PORTB = 0b00000000;
    volatile uintptr_t* pointer = (uintptr_t*)RAMSTART;

    while (pointer <= (uintptr_t*)RAMEND)
    {
        *pointer = 0x00;
        _delay_ms(100);
        if (*pointer != 0x00){ fail(); }
        *pointer = 0xFF;
        _delay_ms(100);
        if (*pointer != 0xFF){ fail(); }
        *pointer = 0x55;
        _delay_ms(100);
        if (*pointer != 0x55){ fail(); }

        pointer++;
    }

    success();
}

