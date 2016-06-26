#include <avr/io.h>
#include <util/delay.h>

#define F_CPU 1000000
#define BAUD 4800
#define BAUD_PRESCALE ((((F_CPU/16) + (BAUD/2)) / (BAUD)) - 1)

char getchar(void);
void putchar(char c);
void puts(const char *s);

int main(void)
{
    UBRRH = (BAUD_PRESCALE >> 8);
    UBRRL = BAUD_PRESCALE;
    UCSRB = (1 << RXEN) | (1 << TXEN);
    UCSRC = (1 << URSEL) | (1 << UCSZ0) | (1 << UCSZ1) | (0 << UCSZ2)
            | (0 << UMSEL) | (0 << UPM0) | (0 << UPM1);

    char character;
    char string[100];

    while (1)
    {
        for (int i = 0; i < 100; i++)
        {
            character = getchar();
            if (character == ' ' || i == 98)
            {
                string[i] = ' ';
                string[i+1] = '\0';
                break;
            }
            else
            {
                string[i] = character;
            }
        }
        puts(" >> ");
        puts(string);
    }
}

void putchar(char c)
{
    while ((UCSRA & (1 << UDRE)) == 0) {}
    UDR = c;
}

char getchar(void)
{
    while ((UCSRA & (1 << RXC)) == 0) {}
    return UDR;
}

void puts(const char *s)
{
    while (*s != '\0')
    {
        putchar(*s);
        s++;
    }
}
