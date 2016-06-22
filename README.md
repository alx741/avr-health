# Fake AVR microcontrollers

Recently Fake Atmel AVR microcontrollers have been found, see
[here](http://andybrown.me.uk/2015/05/31/cheap-atmega8/),
[here](https://www.sparkfun.com/news/364) and
[here](https://www.sparkfun.com/news/395).

Fake AVR chips don't usually contain all the hardware the original one has. Some
lack EEPROM, some lack timers and so on.

This code attempts to use and test as much of the microcontroller hardware as
possible, in order to test both health and authenticity (the chip has the
hardware is supposed).
