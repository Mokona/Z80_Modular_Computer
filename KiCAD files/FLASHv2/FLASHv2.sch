EESchema Schematic File Version 4
LIBS:FLASHv2-cache
EELAYER 30 0
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
L Connector_Generic:Conn_02x05_Odd_Even J2
U 1 1 5DE110BD
P 1600 2650
F 0 "J2" H 1650 3067 50  0000 C CNN
F 1 "Power Bus" H 1650 2976 50  0000 C CNN
F 2 "" H 1600 2650 50  0001 C CNN
F 3 "~" H 1600 2650 50  0001 C CNN
	1    1600 2650
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J3
U 1 1 5DE11A6D
P 3950 2050
F 0 "J3" H 4000 3167 50  0000 C CNN
F 1 "Signal Bus" H 4000 3076 50  0000 C CNN
F 2 "" H 3950 2050 50  0001 C CNN
F 3 "~" H 3950 2050 50  0001 C CNN
	1    3950 2050
	1    0    0    -1  
$EndComp
Text Label 1900 2450 0    50   ~ 0
gnd
Text Label 1900 2550 0    50   ~ 0
+5V
Text Label 1900 2650 0    50   ~ 0
+12V
Text Label 1900 2750 0    50   ~ 0
v1
Text Label 1900 2850 0    50   ~ 0
gnd
Text Label 1400 2450 2    50   ~ 0
gnd
Text Label 1400 2550 2    50   ~ 0
+5V
Text Label 1400 2650 2    50   ~ 0
+12V
Text Label 1400 2750 2    50   ~ 0
v1
Text Label 1400 2850 2    50   ~ 0
gnd
Text Label 3750 1150 2    50   ~ 0
a01
Text Label 3750 1250 2    50   ~ 0
a03
Text Label 3750 1350 2    50   ~ 0
a05
Text Label 3750 1450 2    50   ~ 0
a07
Text Label 3750 1550 2    50   ~ 0
a09
Text Label 3750 1650 2    50   ~ 0
a11
Text Label 3750 1750 2    50   ~ 0
a13
Text Label 3750 1850 2    50   ~ 0
a15
Text Label 3750 1950 2    50   ~ 0
d01
Text Label 3750 2050 2    50   ~ 0
d03
Text Label 3750 2150 2    50   ~ 0
d05
Text Label 3750 2250 2    50   ~ 0
d07
Text Label 3750 2350 2    50   ~ 0
wr
Text Label 3750 2450 2    50   ~ 0
rd
Text Label 3750 2550 2    50   ~ 0
busack
Text Label 3750 2650 2    50   ~ 0
halt
Text Label 3750 2750 2    50   ~ 0
int
Text Label 3750 2850 2    50   ~ 0
s1
Text Label 3750 2950 2    50   ~ 0
m1
Text Label 3750 3050 2    50   ~ 0
clk
Text Label 4250 1150 0    50   ~ 0
a00
Text Label 4250 1250 0    50   ~ 0
a02
Text Label 4250 1350 0    50   ~ 0
a04
Text Label 4250 1450 0    50   ~ 0
a06
Text Label 4250 1550 0    50   ~ 0
a08
Text Label 4250 1650 0    50   ~ 0
a10
Text Label 4250 1750 0    50   ~ 0
a12
Text Label 4250 1850 0    50   ~ 0
a14
Text Label 4250 1950 0    50   ~ 0
d00
Text Label 4250 2050 0    50   ~ 0
d02
Text Label 4250 2150 0    50   ~ 0
d04
Text Label 4250 2250 0    50   ~ 0
d06
Text Label 4250 2350 0    50   ~ 0
mreq
Text Label 4250 2450 0    50   ~ 0
iorq
Text Label 4250 2550 0    50   ~ 0
busrq
Text Label 4250 2650 0    50   ~ 0
wait
Text Label 4250 2750 0    50   ~ 0
nmi
Text Label 4250 2850 0    50   ~ 0
s0
Text Label 4250 2950 0    50   ~ 0
s2
$Comp
L power:+5V #PWR07
U 1 1 5E34AA96
P 2400 2250
F 0 "#PWR07" H 2400 2100 50  0001 C CNN
F 1 "+5V" H 2415 2423 50  0000 C CNN
F 2 "" H 2400 2250 50  0001 C CNN
F 3 "" H 2400 2250 50  0001 C CNN
	1    2400 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5E34BF5A
P 2400 2950
F 0 "#PWR08" H 2400 2700 50  0001 C CNN
F 1 "GND" H 2405 2777 50  0000 C CNN
F 2 "" H 2400 2950 50  0001 C CNN
F 3 "" H 2400 2950 50  0001 C CNN
	1    2400 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2950 2400 2850
Wire Wire Line
	2400 2850 1900 2850
Wire Wire Line
	2400 2250 2400 2550
Wire Wire Line
	2400 2550 1900 2550
NoConn ~ 3750 3050
NoConn ~ 3750 2950
NoConn ~ 3750 2850
NoConn ~ 4250 2850
NoConn ~ 4250 2950
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5E3C8BDE
P 1400 1500
F 0 "#FLG01" H 1400 1575 50  0001 C CNN
F 1 "PWR_FLAG" H 1400 1673 50  0000 C CNN
F 2 "" H 1400 1500 50  0001 C CNN
F 3 "~" H 1400 1500 50  0001 C CNN
	1    1400 1500
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5E3C9F2A
P 2350 1500
F 0 "#FLG02" H 2350 1575 50  0001 C CNN
F 1 "PWR_FLAG" H 2350 1673 50  0000 C CNN
F 2 "" H 2350 1500 50  0001 C CNN
F 3 "~" H 2350 1500 50  0001 C CNN
	1    2350 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5E3CA8BD
P 2350 1600
F 0 "#PWR06" H 2350 1350 50  0001 C CNN
F 1 "GND" H 2355 1427 50  0000 C CNN
F 2 "" H 2350 1600 50  0001 C CNN
F 3 "" H 2350 1600 50  0001 C CNN
	1    2350 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 5E3CB5D9
P 1700 1500
F 0 "#PWR03" H 1700 1350 50  0001 C CNN
F 1 "+5V" H 1715 1673 50  0000 C CNN
F 2 "" H 1700 1500 50  0001 C CNN
F 3 "" H 1700 1500 50  0001 C CNN
	1    1700 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1500 1400 1650
Wire Wire Line
	1400 1650 1700 1650
Wire Wire Line
	1700 1650 1700 1500
Wire Wire Line
	2350 1500 2350 1600
NoConn ~ 3750 2650
NoConn ~ 3750 2750
NoConn ~ 4250 2750
NoConn ~ 4250 2650
NoConn ~ 4250 2550
$Comp
L power:GND #PWR05
U 1 1 5E67707E
P 1800 7300
F 0 "#PWR05" H 1800 7050 50  0001 C CNN
F 1 "GND" H 1805 7127 50  0000 C CNN
F 2 "" H 1800 7300 50  0001 C CNN
F 3 "" H 1800 7300 50  0001 C CNN
	1    1800 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 5E677E2E
P 1800 6300
F 0 "#PWR04" H 1800 6150 50  0001 C CNN
F 1 "+5V" H 1815 6473 50  0000 C CNN
F 2 "" H 1800 6300 50  0001 C CNN
F 3 "" H 1800 6300 50  0001 C CNN
	1    1800 6300
	1    0    0    -1  
$EndComp
NoConn ~ 3750 2550
$Comp
L 74xx:74LS85 U2
U 1 1 5E8AE503
P 3150 5200
F 0 "U2" H 2900 6000 50  0000 C CNN
F 1 "74LS85" H 2900 5900 50  0000 C CNN
F 2 "" H 3150 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS85" H 3150 5200 50  0001 C CNN
	1    3150 5200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J1
U 1 1 5E8D5E71
P 1450 4900
F 0 "J1" H 1500 5217 50  0000 C CNN
F 1 "card addr" H 1500 5126 50  0000 C CNN
F 2 "" H 1450 4900 50  0001 C CNN
F 3 "~" H 1450 4900 50  0001 C CNN
	1    1450 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4800 1850 4800
Wire Wire Line
	1750 4900 2050 4900
Wire Wire Line
	2650 5000 2250 5000
Wire Wire Line
	1750 5100 2450 5100
Wire Wire Line
	1250 4800 1250 4900
Wire Wire Line
	1250 4900 1250 5000
Connection ~ 1250 4900
Wire Wire Line
	1250 5000 1250 5100
Connection ~ 1250 5000
$Comp
L power:+5V #PWR09
U 1 1 5E8E97E6
P 3150 4500
F 0 "#PWR09" H 3150 4350 50  0001 C CNN
F 1 "+5V" H 3165 4673 50  0000 C CNN
F 2 "" H 3150 4500 50  0001 C CNN
F 3 "" H 3150 4500 50  0001 C CNN
	1    3150 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5E8EA827
P 3150 5900
F 0 "#PWR010" H 3150 5650 50  0001 C CNN
F 1 "GND" H 3155 5727 50  0000 C CNN
F 2 "" H 3150 5900 50  0001 C CNN
F 3 "" H 3150 5900 50  0001 C CNN
	1    3150 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5E8EB844
P 4050 4800
F 0 "#PWR012" H 4050 4550 50  0001 C CNN
F 1 "GND" H 4055 4627 50  0000 C CNN
F 2 "" H 4050 4800 50  0001 C CNN
F 3 "" H 4050 4800 50  0001 C CNN
	1    4050 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4800 3650 4800
Wire Wire Line
	3650 4800 3650 4900
Connection ~ 3650 4800
$Comp
L Device:R R1
U 1 1 5E8F1A02
P 1850 4500
F 0 "R1" V 1950 4600 50  0000 C CNN
F 1 "10k" V 1950 4450 50  0000 C CNN
F 2 "" V 1780 4500 50  0001 C CNN
F 3 "~" H 1850 4500 50  0001 C CNN
	1    1850 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5E8F954C
P 2050 4500
F 0 "R2" V 2150 4600 50  0000 C CNN
F 1 "10k" V 2150 4450 50  0000 C CNN
F 2 "" V 1980 4500 50  0001 C CNN
F 3 "~" H 2050 4500 50  0001 C CNN
	1    2050 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5E8FB1E6
P 2250 4500
F 0 "R3" V 2350 4600 50  0000 C CNN
F 1 "10k" V 2350 4450 50  0000 C CNN
F 2 "" V 2180 4500 50  0001 C CNN
F 3 "~" H 2250 4500 50  0001 C CNN
	1    2250 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5E8FCDB9
P 2450 4500
F 0 "R4" V 2550 4600 50  0000 C CNN
F 1 "10k" V 2550 4450 50  0000 C CNN
F 2 "" V 2380 4500 50  0001 C CNN
F 3 "~" H 2450 4500 50  0001 C CNN
	1    2450 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 4650 1850 4800
Connection ~ 1850 4800
Wire Wire Line
	1850 4800 1750 4800
Wire Wire Line
	2050 4650 2050 4900
Connection ~ 2050 4900
Wire Wire Line
	2050 4900 2650 4900
Wire Wire Line
	2250 4650 2250 5000
Connection ~ 2250 5000
Wire Wire Line
	2250 5000 1750 5000
Wire Wire Line
	2450 4650 2450 5100
Connection ~ 2450 5100
Wire Wire Line
	2450 5100 2650 5100
Wire Wire Line
	1850 4350 1850 4250
Wire Wire Line
	1850 4250 2050 4250
Wire Wire Line
	2450 4250 2450 4350
Wire Wire Line
	2250 4350 2250 4250
Connection ~ 2250 4250
Wire Wire Line
	2250 4250 2450 4250
Wire Wire Line
	2050 4350 2050 4250
Connection ~ 2050 4250
$Comp
L power:+5V #PWR02
U 1 1 5E914060
P 2050 4100
F 0 "#PWR02" H 2050 3950 50  0001 C CNN
F 1 "+5V" H 2065 4273 50  0000 C CNN
F 2 "" H 2050 4100 50  0001 C CNN
F 3 "" H 2050 4100 50  0001 C CNN
	1    2050 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 4100 2050 4250
$Comp
L power:GND #PWR01
U 1 1 5E917E68
P 1250 5250
F 0 "#PWR01" H 1250 5000 50  0001 C CNN
F 1 "GND" H 1255 5077 50  0000 C CNN
F 2 "" H 1250 5250 50  0001 C CNN
F 3 "" H 1250 5250 50  0001 C CNN
	1    1250 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 5250 1250 5100
Connection ~ 1250 5100
Text Label 2650 5300 2    50   ~ 0
a07
Text Label 2650 5400 2    50   ~ 0
a06
Text Label 2650 5500 2    50   ~ 0
a05
Text Label 2650 5600 2    50   ~ 0
a04
Text Label 4250 3050 0    50   ~ 0
reset
NoConn ~ 3650 5400
NoConn ~ 3650 5500
Wire Wire Line
	2050 4250 2250 4250
Wire Wire Line
	4900 5150 5100 5150
Text Notes 1000 4800 0    50   ~ 0
msb
Text Notes 1050 5100 0    50   ~ 0
lsb
Text Label 9450 2650 2    50   ~ 0
reset
NoConn ~ 9450 3650
NoConn ~ 9450 3950
NoConn ~ 9450 4050
NoConn ~ 9450 4150
Text Label 9450 4250 2    50   ~ 0
fa01
Text Label 9450 4350 2    50   ~ 0
fa00
Text Label 9450 4450 2    50   ~ 0
cf_sel
NoConn ~ 9950 3450
NoConn ~ 9950 2750
NoConn ~ 9950 2850
NoConn ~ 9950 2950
NoConn ~ 9950 3050
NoConn ~ 9950 3150
NoConn ~ 9950 3250
NoConn ~ 9950 3350
$Comp
L power:GND #PWR017
U 1 1 5EDFD85C
P 10200 2750
F 0 "#PWR017" H 10200 2500 50  0001 C CNN
F 1 "GND" H 10205 2577 50  0000 C CNN
F 2 "" H 10200 2750 50  0001 C CNN
F 3 "" H 10200 2750 50  0001 C CNN
	1    10200 2750
	1    0    0    -1  
$EndComp
NoConn ~ 9950 3950
NoConn ~ 9950 4150
NoConn ~ 9950 4250
Text Label 9950 4350 0    50   ~ 0
fa02
$Comp
L Device:R R6
U 1 1 5EE0C0A9
P 10500 4450
F 0 "R6" V 10600 4550 50  0000 C CNN
F 1 "1k" V 10600 4400 50  0000 C CNN
F 2 "" V 10430 4450 50  0001 C CNN
F 3 "~" H 10500 4450 50  0001 C CNN
	1    10500 4450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9950 4450 10350 4450
NoConn ~ 9450 4550
Wire Wire Line
	4300 5150 3650 5150
Wire Wire Line
	3650 5150 3650 5000
NoConn ~ 3750 1550
NoConn ~ 3750 1650
NoConn ~ 3750 1750
NoConn ~ 3750 1850
NoConn ~ 4250 1850
NoConn ~ 4250 1750
NoConn ~ 4250 1650
NoConn ~ 4250 1550
NoConn ~ 4250 2350
$Comp
L Device:CP C1
U 1 1 5F592784
P 2400 2700
F 0 "C1" H 2518 2746 50  0000 L CNN
F 1 "10uF" H 2518 2655 50  0000 L CNN
F 2 "" H 2438 2550 50  0001 C CNN
F 3 "~" H 2400 2700 50  0001 C CNN
	1    2400 2700
	1    0    0    -1  
$EndComp
Connection ~ 2400 2550
Connection ~ 2400 2850
NoConn ~ 3750 1250
$Comp
L Device:C C2
U 1 1 5F59C5F0
P 9300 4950
F 0 "C2" H 9100 5000 50  0000 C CNN
F 1 "10nF" H 9100 4900 50  0000 C CNN
F 2 "" H 9338 4800 50  0001 C CNN
F 3 "~" H 9300 4950 50  0001 C CNN
	1    9300 4950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x22_Odd_Even J4
U 1 1 5F5B7653
P 9650 3650
F 0 "J4" H 9700 4867 50  0000 C CNN
F 1 "IDE connector" H 9700 4776 50  0000 C CNN
F 2 "" H 9650 3650 50  0001 C CNN
F 3 "~" H 9650 3650 50  0001 C CNN
	1    9650 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR018
U 1 1 5F5DBA05
P 10650 4450
F 0 "#PWR018" H 10650 4300 50  0001 C CNN
F 1 "+5V" V 10665 4578 50  0000 L CNN
F 2 "" H 10650 4450 50  0001 C CNN
F 3 "" H 10650 4450 50  0001 C CNN
	1    10650 4450
	0    1    1    0   
$EndComp
Text Label 9450 3850 2    50   ~ 0
frd
Text Label 9450 3750 2    50   ~ 0
fwr
$Comp
L 74xx:74LS04 U1
U 1 1 5F69F3D5
P 4250 5600
F 0 "U1" H 4250 5917 50  0000 C CNN
F 1 "74LS04" H 4250 5826 50  0000 C CNN
F 2 "" H 4250 5600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4250 5600 50  0001 C CNN
	1    4250 5600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 2 1 5F6A0CC1
P 4600 5150
F 0 "U1" H 4600 5467 50  0000 C CNN
F 1 "74LS04" H 4600 5376 50  0000 C CNN
F 2 "" H 4600 5150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4600 5150 50  0001 C CNN
	2    4600 5150
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 7 1 5F6A1F31
P 1800 6800
F 0 "U1" H 2030 6846 50  0000 L CNN
F 1 "74LS04" H 2030 6755 50  0000 L CNN
F 2 "" H 1800 6800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1800 6800 50  0001 C CNN
	7    1800 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 5600 3650 5600
Wire Wire Line
	9300 4650 9300 4800
$Comp
L power:GND #PWR014
U 1 1 5F6B4BAE
P 9300 5100
F 0 "#PWR014" H 9300 4850 50  0001 C CNN
F 1 "GND" H 9305 4927 50  0000 C CNN
F 2 "" H 9300 5100 50  0001 C CNN
F 3 "" H 9300 5100 50  0001 C CNN
	1    9300 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 5F6B634B
P 9150 4650
F 0 "#PWR011" H 9150 4500 50  0001 C CNN
F 1 "+5V" V 9165 4778 50  0000 L CNN
F 2 "" H 9150 4650 50  0001 C CNN
F 3 "" H 9150 4650 50  0001 C CNN
	1    9150 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10200 2650 9950 2650
$Comp
L 74xx:74LS245 U3
U 1 1 5FE0A572
P 6350 4350
F 0 "U3" H 6850 3700 50  0000 C CNN
F 1 "74LS245" H 6850 3600 50  0000 C CNN
F 2 "" H 6350 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 6350 4350 50  0001 C CNN
	1    6350 4350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS245 U4
U 1 1 5FE0BC7B
P 7600 2950
F 0 "U4" H 8050 2100 50  0000 C CNN
F 1 "74LS245" H 8050 2200 50  0000 C CNN
F 2 "" H 7600 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 7600 2950 50  0001 C CNN
	1    7600 2950
	1    0    0    1   
$EndComp
Text Label 7100 3450 2    50   ~ 0
d00
Text Label 7100 3350 2    50   ~ 0
d01
Text Label 7100 3250 2    50   ~ 0
d02
Text Label 7100 3150 2    50   ~ 0
d03
Text Label 7100 3050 2    50   ~ 0
d04
Text Label 7100 2950 2    50   ~ 0
d05
Text Label 7100 2850 2    50   ~ 0
d06
Text Label 7100 2750 2    50   ~ 0
d07
Text Label 5100 5150 0    50   ~ 0
iorq
$Comp
L power:+5V #PWR019
U 1 1 5FE76D8B
P 6350 3550
F 0 "#PWR019" H 6350 3400 50  0001 C CNN
F 1 "+5V" V 6365 3678 50  0000 L CNN
F 2 "" H 6350 3550 50  0001 C CNN
F 3 "" H 6350 3550 50  0001 C CNN
	1    6350 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR022
U 1 1 5FE78EAD
P 7600 3750
F 0 "#PWR022" H 7600 3600 50  0001 C CNN
F 1 "+5V" H 7615 3878 50  0000 L CNN
F 2 "" H 7600 3750 50  0001 C CNN
F 3 "" H 7600 3750 50  0001 C CNN
	1    7600 3750
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5FE815FA
P 6350 5150
F 0 "#PWR020" H 6350 4900 50  0001 C CNN
F 1 "GND" H 6355 4977 50  0000 C CNN
F 2 "" H 6350 5150 50  0001 C CNN
F 3 "" H 6350 5150 50  0001 C CNN
	1    6350 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 5FE83500
P 7600 2150
F 0 "#PWR021" H 7600 1900 50  0001 C CNN
F 1 "GND" H 7605 1977 50  0000 C CNN
F 2 "" H 7600 2150 50  0001 C CNN
F 3 "" H 7600 2150 50  0001 C CNN
	1    7600 2150
	1    0    0    1   
$EndComp
Text Label 5850 4550 2    50   ~ 0
a00
Text Label 5850 4450 2    50   ~ 0
a01
Text Label 5850 4350 2    50   ~ 0
a02
Text Label 5850 4250 2    50   ~ 0
rd
Text Label 5850 4150 2    50   ~ 0
wr
NoConn ~ 5850 3850
NoConn ~ 5850 3950
NoConn ~ 5850 4050
NoConn ~ 6850 3850
NoConn ~ 6850 3950
NoConn ~ 6850 4050
Wire Wire Line
	7100 2450 5550 2450
Wire Wire Line
	5550 2450 5550 4850
Wire Wire Line
	5550 4850 5850 4850
$Comp
L power:+5V #PWR015
U 1 1 5FEC2512
P 5850 4750
F 0 "#PWR015" H 5850 4600 50  0001 C CNN
F 1 "+5V" V 5865 4878 50  0000 L CNN
F 2 "" H 5850 4750 50  0001 C CNN
F 3 "" H 5850 4750 50  0001 C CNN
	1    5850 4750
	0    -1   -1   0   
$EndComp
Text Label 9450 3450 2    50   ~ 0
fd00
Text Label 9450 3350 2    50   ~ 0
fd01
Text Label 9450 3250 2    50   ~ 0
fd02
Text Label 9450 3150 2    50   ~ 0
fd03
Text Label 9450 3050 2    50   ~ 0
fd04
Text Label 9450 2950 2    50   ~ 0
fd05
Text Label 7100 2550 2    50   ~ 0
rd
Wire Wire Line
	4550 5600 5550 5600
Connection ~ 5550 4850
$Comp
L Device:C C3
U 1 1 5FE1CE6E
P 6100 3550
F 0 "C3" V 5850 3400 50  0000 C CNN
F 1 "10nF" V 5950 3400 50  0000 C CNN
F 2 "" H 6138 3400 50  0001 C CNN
F 3 "~" H 6100 3550 50  0001 C CNN
	1    6100 3550
	0    1    1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 5FE22C80
P 7350 3750
F 0 "C4" V 7500 3850 50  0000 C CNN
F 1 "10nF" V 7600 3850 50  0000 C CNN
F 2 "" H 7388 3600 50  0001 C CNN
F 3 "~" H 7350 3750 50  0001 C CNN
	1    7350 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	6250 3550 6350 3550
Connection ~ 6350 3550
$Comp
L power:GND #PWR025
U 1 1 5FE2A96F
P 5950 3550
F 0 "#PWR025" H 5950 3300 50  0001 C CNN
F 1 "GND" V 5955 3377 50  0000 C CNN
F 2 "" H 5950 3550 50  0001 C CNN
F 3 "" H 5950 3550 50  0001 C CNN
	1    5950 3550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5FE324FA
P 7200 3750
F 0 "#PWR026" H 7200 3500 50  0001 C CNN
F 1 "GND" V 7300 3700 50  0000 C CNN
F 2 "" H 7200 3750 50  0001 C CNN
F 3 "" H 7200 3750 50  0001 C CNN
	1    7200 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	7500 3750 7600 3750
Connection ~ 7600 3750
Wire Wire Line
	5550 4850 5550 5600
Wire Wire Line
	8100 2750 9450 2750
Wire Wire Line
	8100 2850 9450 2850
Wire Wire Line
	8100 2950 9450 2950
Wire Wire Line
	8100 3050 9450 3050
Wire Wire Line
	8100 3450 9450 3450
Wire Wire Line
	8100 3350 9450 3350
Wire Wire Line
	8100 3250 9450 3250
Wire Wire Line
	8100 3150 9450 3150
Wire Wire Line
	9450 3750 8150 3750
Wire Wire Line
	8150 3750 8150 4150
Wire Wire Line
	6850 4150 8150 4150
Wire Wire Line
	9450 3850 8250 3850
Wire Wire Line
	8250 3850 8250 4250
Wire Wire Line
	6850 4250 8250 4250
Wire Wire Line
	9450 4250 8350 4250
Wire Wire Line
	8350 4250 8350 4450
Wire Wire Line
	6850 4450 8350 4450
Wire Wire Line
	9450 4350 8450 4350
Wire Wire Line
	8450 4350 8450 4550
Wire Wire Line
	6850 4550 8450 4550
Text Label 6850 4350 0    50   ~ 0
fa02
Wire Wire Line
	9450 4450 8550 4450
Wire Wire Line
	8550 4450 8550 5600
Wire Wire Line
	8550 5600 5550 5600
Connection ~ 5550 5600
Wire Wire Line
	10200 2650 10200 2750
NoConn ~ 9950 3550
NoConn ~ 9950 3650
NoConn ~ 9950 3750
NoConn ~ 9950 3850
NoConn ~ 9950 4050
NoConn ~ 9950 4550
NoConn ~ 9950 4650
NoConn ~ 9950 4750
NoConn ~ 9450 4750
NoConn ~ 9450 3550
Wire Wire Line
	9150 4650 9300 4650
Wire Wire Line
	9450 4650 9300 4650
Connection ~ 9300 4650
Text Label 9450 2850 2    50   ~ 0
fd06
Text Label 9450 2750 2    50   ~ 0
fd07
$EndSCHEMATC