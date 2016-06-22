# FLASH code memory test

This test fills the FLASH memory of the device with a program large enough; then
reads it back later to see if it's the same.


## How-to

For this test only the AVR programmer is required.

Replace the **\<CHIP>** and **\<PROGRAMMER>** parameters with your part model
and programmer respectively.


1. Run the **generate.sh** script giving it the amount of flash memory of the
    target device in KB as parameter.

    $ ./generate.sh 32

    That will generate a `program.c` file.


2. Compile the `program.c` file by running:

    $ make

    That will generate a `program.hex` file.


3. Write the `HEX` file to the chip using avrdude:

    $ avrdude -p \<CHIP> -c \<PROGRAMMER> -U flash:w:program.hex:i


4. Disconnect your chip completely, remove any big capacitor and turn off any
    power source. Leave it like that for at least 1 minute.


5. Finally connect the chip and verify the flash memory using avrdude:

    $ avrdude -p \<CHIP> -c \<PROGRAMMER> -U flash`:v:`program_read.hex:i

    Arvdude should report a successful verification.
