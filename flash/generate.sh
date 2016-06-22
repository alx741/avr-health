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

# Each 'i++' line takes ~144Bytes in the final HEX file, so ~6 'i++' lines is ~1KB
NUM_INSTRUCTIONS=$(($1*6))
ACTUAL_SIZE=$(($NUM_INSTRUCTIONS*144))

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
echo "* Disconnect your chip completly and turn off any power source."
echo "  Leave it like that for at least 5 minutes."
echo
echo "* Now connect the chip and read the flash using avrdude like this:"
echo -e "\t$ avrdude -p <chip> -c <programmer> -U flash:r:program_read.hex:i"
echo
echo "* Finally use diff to verify the source HEX and the read HEX files are \
identical"
echo -e "\t$ diff -s program.hex program_read.hex"
echo
