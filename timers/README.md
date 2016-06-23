# TIMERS test

This test uses TIMERS (CTC mode) to toggle LEDs one after another.


## How-to

For this test the `basic.pdf` circuit is required.

The LEDs should turn on and off in sequence, if they do so, the timers are
working correctly.


1. Mount the circuit

2. Build the firmware by running:

    $ make

    That will generate a `test.hex` file.

3. Write the `HEX` file to the chip using avrdude:

    $ avrdude -p \<CHIP> -c \<PROGRAMMER> -U flash:w:test.hex:i

4. Connect the chip to the power supply.
