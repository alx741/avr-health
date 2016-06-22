#!/bin/sh

# This script will generate a C program that will be the size (in KB) given as
# the argument.
#
# Example: Generate a 32KB program
#   $ ./generate.sh 32


# Verify arguments
if [[ "$#" < 1 ]] || [[ $1 -le 0 ]];
then
    echo
    echo "USAGE:"
    echo -e "\t ./generate.sh <program size in KB>"
    echo
    echo -e "Example:\n  Generate a 32KB program:"
    echo -e "\t ./generate.sh 32"
    echo
    exit 1
fi


# Generate C program
if [[ -f 'program.c' ]]; then
    rm 'program.c'
fi

# Each 'i++' line takes ~48Bytes in the final HEX file, so ~19 'i++' lines is ~1KB
NUM_INSTRUCTIONS=$(($1*19))
ACTUAL_SIZE=$(($NUM_INSTRUCTIONS*48))

echo "#include <avr/io.h>" >> program.c
echo "double i=0;" >> program.c
echo "int main(void){" >> program.c
for i in `seq 1 $NUM_INSTRUCTIONS`
do
    echo "i++;" >> program.c
done
echo "return 0;}" >> program.c

# Finalize
echo
echo "Done!"
echo
echo "* Now compile your program with:"
echo -e "\t$ make"
echo
echo "* Write it to the target chip using avrdude like this:"
echo -e "\t$ avrdude -p <chip> -c <programmer> -U flash:w:program.hex:i"
echo
echo "* Disconnect your chip completely, remove any big capacitor and turn \
off any power source."
echo "  Leave it like that for at least 1 minute."
echo
echo "* Finally connect the chip and verify the flash memory using avrdude:"
echo -e "\t$ avrdude -p <chip> -c <programmer> -U flash:v:program_read.hex:i"
