# EEPROM test

This test fills up the EEPROM memory with a pattern, waits 1 second so the
data rests on EEPROM for a while and then reads it to verify is correct. The
process is repeated a couple times with multiple different patterns. This test
leaves the EEPROM cleared when finished.


## How-to

For this test the following circuit is required:

![](schematic.png)

* The `yellow` LED means **working**. Don't touch anything, the test is on
  progress.
* The `green` LED means **success**. Test has finished successfully. Hurray!
* The `red` LED means **failure**. The test has finished with failure. Bummer.


1. Mount the circuit

2. Modify `test.c` to define **EEPROM_KB** to the amount (in KB) of the target
    chip

3. Build the firmware by running:

    $ make

    That will generate a `test.hex` file.

4. Write the `HEX` file to the chip using avrdude:

    $ avrdude -p \<CHIP> -c \<PROGRAMMER> -U flash:w:test.hex:i

5. Connect the chip to the power supply so the `yellow` LED is on.

6. Wait until either the `green` or `red` LED turns on
