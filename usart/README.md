# USART test

This test uses a USART connection running at 4800bps using the internal 1Mhz
clock.

A USB to UART adapter is required.

The microcontroller will echo back space terminated words that the user send
from the host computer.


## How-to

For this test the `uart.pdf` circuit is required.


1. Mount the circuit

2. Build the firmware by running:

    $ make

    That will generate a `test.hex` file.

3. Write the `HEX` file to the chip using avrdude:

    $ avrdude -p \<CHIP> -c \<PROGRAMMER> -U flash:w:test.hex:i

4. Connect the USB adapter to the host computer.

5. Start a terminal emulator like `minicom` or `picocom`.

6. If using **picocom** start it with:

    $ sudo picocom -b 4800 -c /dev/ttyUSB0

7. Start typing words. The device should echo them back like this:

> hello >> hello >> world >> world
