# SRAM test

This test fills up the SRAM memory with a pattern, waits 1 second so the
data rests on SRAM for a while and then reads it to verify is correct. The
process is repeated a couple times with multiple different patterns.


## How-to

For this test the `basic.pdf` circuit is required.

* The `yellow` LED means **working**. Don't touch anything, the test is on
  progress.
* The `green` LED means **success**. Test has finished successfully. Hurray!
* The `red` LED means **failure**. The test has finished with failure. Bummer.
* If the `yellow` LED never turns off it also means **failure**.


1. Mount the circuit

2. Build the firmware by running:

    $ make

    That will generate a `test.hex` file.

3. Write the `HEX` file to the chip using avrdude:

    $ avrdude -p \<CHIP> -c \<PROGRAMMER> -U flash:w:test.hex:i

4. Connect the chip to the power supply so the `yellow` LED is on.

5. Wait until either the `green` or `red` LED turns on
