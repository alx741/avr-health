# INTERRUPTS test

This test uses external INTERRUPTS only.


## How-to

For this test the `interrupt.pdf` circuit is required.

* The `yellow` LED should blink when the circuit is powered.
* The `green` LED should blink 3 times when SW1 is pressed.
* The `red` LED should blink 3 times when SW2 is pressed.


1. Mount the circuit

2. Build the firmware by running:

    $ make

    That will generate a `test.hex` file.

3. Write the `HEX` file to the chip using avrdude:

    $ avrdude -p \<CHIP> -c \<PROGRAMMER> -U flash:w:test.hex:i

4. Connect the chip to the power supply.
