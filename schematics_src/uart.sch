EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATMEGA32-A IC?
U 1 1 577041C1
P 5750 3750
F 0 "IC?" H 4900 5630 50  0000 L BNN
F 1 "ATMEGA32-A" H 6200 1800 50  0000 L BNN
F 2 "TQFP44" H 5750 3750 50  0000 C CIN
F 3 "" H 5750 3750 50  0000 C CNN
	1    5750 3750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5770424C
P 5450 5750
F 0 "#PWR?" H 5450 5500 50  0001 C CNN
F 1 "GND" H 5450 5600 50  0000 C CNN
F 2 "" H 5450 5750 50  0000 C CNN
F 3 "" H 5450 5750 50  0000 C CNN
	1    5450 5750
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5770429D
P 5350 1700
F 0 "#PWR?" H 5350 1550 50  0001 C CNN
F 1 "+5V" H 5350 1840 50  0000 C CNN
F 2 "" H 5350 1700 50  0000 C CNN
F 3 "" H 5350 1700 50  0000 C CNN
	1    5350 1700
	1    0    0    -1  
$EndComp
Text GLabel 7500 4500 1    60   Input ~ 0
Tx
Text GLabel 7800 4500 1    60   Input ~ 0
Rx
Text GLabel 8100 4500 1    60   Input ~ 0
GND
$Comp
L USB_B P?
U 1 1 577045E9
P 7850 3400
F 0 "P?" H 8050 3200 50  0000 C CNN
F 1 "USB_B" H 7800 3600 50  0000 C CNN
F 2 "" V 7800 3300 50  0000 C CNN
F 3 "" V 7800 3300 50  0000 C CNN
	1    7850 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 5750 8100 5750
Wire Wire Line
	5350 1700 5350 1750
Wire Wire Line
	5350 1750 5650 1750
Wire Wire Line
	6750 5250 7500 5250
Wire Wire Line
	7500 5250 7500 4500
Wire Wire Line
	6750 5350 7800 5350
Wire Wire Line
	7800 5350 7800 4500
Wire Wire Line
	8100 5750 8100 4500
Connection ~ 5900 5750
Wire Notes Line
	7250 3300 7250 4650
Wire Notes Line
	7250 4650 8350 4650
Wire Notes Line
	8350 4650 8350 3300
Wire Notes Line
	8350 3300 7250 3300
Text Label 7300 4150 0    60   ~ 0
USB_to_UART_converter
$EndSCHEMATC
