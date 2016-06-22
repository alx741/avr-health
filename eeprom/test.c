// How much EEPROM in KB
#define EEPROM_KB 1

#define F_CPU 1000000

#include <avr/io.h>
#include <avr/eeprom.h>
#include <stdlib.h>
#include <util/delay.h>

#define traverse_eeprom() for(pointer = (uint16_t*)0x0000;\
        pointer <= (uint16_t*)(EEPROM_KB*512); pointer+=2)


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

inline void test_pattern(uint16_t pattern)
{
    volatile uint16_t* pointer = 0;

    traverse_eeprom()
    {
        eeprom_busy_wait();
        eeprom_write_word(pointer, pattern);
    }

    _delay_ms(1000);
    traverse_eeprom()
    {
        eeprom_busy_wait();
        if (eeprom_read_word(pointer) != pattern){ fail(); }
    }
}

int main(void)
{
    DDRB = 0xFF;
    PORTB = 0b00000100;

    test_pattern(0xFFFF);
    test_pattern(0x5555);
    test_pattern(0xAAAA);
    test_pattern(0x0000);
    success();
    exit(0);
}
