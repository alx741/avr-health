#define F_CPU 1000000

#include <avr/io.h>
#include <stdlib.h>
#include <util/delay.h>

#define traverse_memory() for(pointer = (uintptr_t*)RAMSTART;\
        pointer <= (uintptr_t*)RAMEND; pointer++)


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

inline void test_pattern(uint8_t pattern)
{
    volatile uintptr_t* pointer = 0;

    traverse_memory()
    {
        *pointer = pattern;
    }

    _delay_ms(1000);
    traverse_memory()
    {
        if (*pointer != pattern){ fail(); }
    }
}

int main(void)
{
    DDRB = 0xFF;
    PORTB = 0b00000100;

    test_pattern(0x00);
    test_pattern(0xFF);
    test_pattern(0x55);
    test_pattern(0xAA);
    success();
    exit(0);
}

