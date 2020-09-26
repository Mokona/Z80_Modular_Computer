EESchema Schematic File Version 4
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
P 2200 2500
F 0 "J2" H 2250 2917 50  0000 C CNN
F 1 "Power Bus" H 2250 2826 50  0000 C CNN
F 2 "" H 2200 2500 50  0001 C CNN
F 3 "~" H 2200 2500 50  0001 C CNN
	1    2200 2500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J3
U 1 1 5DE11A6D
P 4950 2100
F 0 "J3" H 5000 3217 50  0000 C CNN
F 1 "Signal Bus" H 5000 3126 50  0000 C CNN
F 2 "" H 4950 2100 50  0001 C CNN
F 3 "~" H 4950 2100 50  0001 C CNN
	1    4950 2100
	1    0    0    -1  
$EndComp
Text Label 2500 2300 0    50   ~ 0
gnd
Text Label 2500 2400 0    50   ~ 0
+5V
Text Label 2500 2500 0    50   ~ 0
+12V
Text Label 2500 2600 0    50   ~ 0
v1
Text Label 2500 2700 0    50   ~ 0
gnd
Text Label 2000 2300 2    50   ~ 0
gnd
Text Label 2000 2400 2    50   ~ 0
+5V
Text Label 2000 2500 2    50   ~ 0
+12V
Text Label 2000 2600 2    50   ~ 0
v1
Text Label 2000 2700 2    50   ~ 0
gnd
Text Label 4750 1200 2    50   ~ 0
a01
Text Label 4750 1300 2    50   ~ 0
a03
Text Label 4750 1400 2    50   ~ 0
a05
Text Label 4750 1500 2    50   ~ 0
a07
Text Label 4750 1600 2    50   ~ 0
a09
Text Label 4750 1700 2    50   ~ 0
a11
Text Label 4750 1800 2    50   ~ 0
a13
Text Label 4750 1900 2    50   ~ 0
a15
Text Label 4750 2000 2    50   ~ 0
d01
Text Label 4750 2100 2    50   ~ 0
d03
Text Label 4750 2200 2    50   ~ 0
d05
Text Label 4750 2300 2    50   ~ 0
d07
Text Label 4750 2400 2    50   ~ 0
wr
Text Label 4750 2500 2    50   ~ 0
rd
Text Label 4750 2600 2    50   ~ 0
busack
Text Label 4750 2700 2    50   ~ 0
halt
Text Label 4750 2800 2    50   ~ 0
int
Text Label 4750 2900 2    50   ~ 0
s1
Text Label 4750 3000 2    50   ~ 0
m1
Text Label 4750 3100 2    50   ~ 0
clk
Text Label 5250 1200 0    50   ~ 0
a00
Text Label 5250 1300 0    50   ~ 0
a02
Text Label 5250 1400 0    50   ~ 0
a04
Text Label 5250 1500 0    50   ~ 0
a06
Text Label 5250 1600 0    50   ~ 0
a08
Text Label 5250 1700 0    50   ~ 0
a10
Text Label 5250 1800 0    50   ~ 0
a12
Text Label 5250 1900 0    50   ~ 0
a14
Text Label 5250 2000 0    50   ~ 0
d00
Text Label 5250 2100 0    50   ~ 0
d02
Text Label 5250 2200 0    50   ~ 0
d04
Text Label 5250 2300 0    50   ~ 0
d06
Text Label 5250 2400 0    50   ~ 0
mreq
Text Label 5250 2500 0    50   ~ 0
iorq
Text Label 5250 2600 0    50   ~ 0
busrq
Text Label 5250 2700 0    50   ~ 0
wait
Text Label 5250 2800 0    50   ~ 0
nmi
Text Label 5250 2900 0    50   ~ 0
s0
Text Label 5250 3000 0    50   ~ 0
s2
$Comp
L power:+5V #PWR07
U 1 1 5E34AA96
P 3000 2100
F 0 "#PWR07" H 3000 1950 50  0001 C CNN
F 1 "+5V" H 3015 2273 50  0000 C CNN
F 2 "" H 3000 2100 50  0001 C CNN
F 3 "" H 3000 2100 50  0001 C CNN
	1    3000 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5E34BF5A
P 3000 2800
F 0 "#PWR08" H 3000 2550 50  0001 C CNN
F 1 "GND" H 3005 2627 50  0000 C CNN
F 2 "" H 3000 2800 50  0001 C CNN
F 3 "" H 3000 2800 50  0001 C CNN
	1    3000 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 2800 3000 2700
Wire Wire Line
	3000 2700 2500 2700
Wire Wire Line
	3000 2100 3000 2400
Wire Wire Line
	3000 2400 2500 2400
NoConn ~ 4750 3100
NoConn ~ 4750 3000
NoConn ~ 4750 2900
NoConn ~ 5250 2900
NoConn ~ 5250 3000
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5E3C8BDE
P 2050 1250
F 0 "#FLG01" H 2050 1325 50  0001 C CNN
F 1 "PWR_FLAG" H 2050 1423 50  0000 C CNN
F 2 "" H 2050 1250 50  0001 C CNN
F 3 "~" H 2050 1250 50  0001 C CNN
	1    2050 1250
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5E3C9F2A
P 3000 1250
F 0 "#FLG02" H 3000 1325 50  0001 C CNN
F 1 "PWR_FLAG" H 3000 1423 50  0000 C CNN
F 2 "" H 3000 1250 50  0001 C CNN
F 3 "~" H 3000 1250 50  0001 C CNN
	1    3000 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5E3CA8BD
P 3000 1350
F 0 "#PWR06" H 3000 1100 50  0001 C CNN
F 1 "GND" H 3005 1177 50  0000 C CNN
F 2 "" H 3000 1350 50  0001 C CNN
F 3 "" H 3000 1350 50  0001 C CNN
	1    3000 1350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 5E3CB5D9
P 2350 1250
F 0 "#PWR03" H 2350 1100 50  0001 C CNN
F 1 "+5V" H 2365 1423 50  0000 C CNN
F 2 "" H 2350 1250 50  0001 C CNN
F 3 "" H 2350 1250 50  0001 C CNN
	1    2350 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 1250 2050 1400
Wire Wire Line
	2050 1400 2350 1400
Wire Wire Line
	2350 1400 2350 1250
Wire Wire Line
	3000 1250 3000 1350
NoConn ~ 4750 2700
NoConn ~ 4750 2800
NoConn ~ 5250 2800
NoConn ~ 5250 2700
NoConn ~ 5250 2600
$Comp
L power:GND #PWR05
U 1 1 5E67707E
P 1550 6700
F 0 "#PWR05" H 1550 6450 50  0001 C CNN
F 1 "GND" H 1555 6527 50  0000 C CNN
F 2 "" H 1550 6700 50  0001 C CNN
F 3 "" H 1550 6700 50  0001 C CNN
	1    1550 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 5E677E2E
P 1550 5700
F 0 "#PWR04" H 1550 5550 50  0001 C CNN
F 1 "+5V" H 1565 5873 50  0000 C CNN
F 2 "" H 1550 5700 50  0001 C CNN
F 3 "" H 1550 5700 50  0001 C CNN
	1    1550 5700
	1    0    0    -1  
$EndComp
NoConn ~ 4750 2600
$Comp
L 74xx:74LS85 U2
U 1 1 5E8AE503
P 4550 5000
F 0 "U2" H 4300 5800 50  0000 C CNN
F 1 "74LS85" H 4300 5700 50  0000 C CNN
F 2 "" H 4550 5000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS85" H 4550 5000 50  0001 C CNN
	1    4550 5000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J1
U 1 1 5E8D5E71
P 2850 4700
F 0 "J1" H 2900 5017 50  0000 C CNN
F 1 "card addr" H 2900 4926 50  0000 C CNN
F 2 "" H 2850 4700 50  0001 C CNN
F 3 "~" H 2850 4700 50  0001 C CNN
	1    2850 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4600 3250 4600
Wire Wire Line
	3150 4700 3450 4700
Wire Wire Line
	4050 4800 3650 4800
Wire Wire Line
	3150 4900 3850 4900
Wire Wire Line
	2650 4600 2650 4700
Wire Wire Line
	2650 4700 2650 4800
Connection ~ 2650 4700
Wire Wire Line
	2650 4800 2650 4900
Connection ~ 2650 4800
$Comp
L power:+5V #PWR09
U 1 1 5E8E97E6
P 4550 4300
F 0 "#PWR09" H 4550 4150 50  0001 C CNN
F 1 "+5V" H 4565 4473 50  0000 C CNN
F 2 "" H 4550 4300 50  0001 C CNN
F 3 "" H 4550 4300 50  0001 C CNN
	1    4550 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5E8EA827
P 4550 5700
F 0 "#PWR010" H 4550 5450 50  0001 C CNN
F 1 "GND" H 4555 5527 50  0000 C CNN
F 2 "" H 4550 5700 50  0001 C CNN
F 3 "" H 4550 5700 50  0001 C CNN
	1    4550 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5E8EB844
P 5450 4600
F 0 "#PWR012" H 5450 4350 50  0001 C CNN
F 1 "GND" H 5455 4427 50  0000 C CNN
F 2 "" H 5450 4600 50  0001 C CNN
F 3 "" H 5450 4600 50  0001 C CNN
	1    5450 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 4600 5050 4600
Wire Wire Line
	5050 4600 5050 4700
Connection ~ 5050 4600
$Comp
L Device:R R1
U 1 1 5E8F1A02
P 3250 4300
F 0 "R1" V 3350 4400 50  0000 C CNN
F 1 "10k" V 3350 4250 50  0000 C CNN
F 2 "" V 3180 4300 50  0001 C CNN
F 3 "~" H 3250 4300 50  0001 C CNN
	1    3250 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5E8F954C
P 3450 4300
F 0 "R2" V 3550 4400 50  0000 C CNN
F 1 "10k" V 3550 4250 50  0000 C CNN
F 2 "" V 3380 4300 50  0001 C CNN
F 3 "~" H 3450 4300 50  0001 C CNN
	1    3450 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5E8FB1E6
P 3650 4300
F 0 "R3" V 3750 4400 50  0000 C CNN
F 1 "10k" V 3750 4250 50  0000 C CNN
F 2 "" V 3580 4300 50  0001 C CNN
F 3 "~" H 3650 4300 50  0001 C CNN
	1    3650 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5E8FCDB9
P 3850 4300
F 0 "R4" V 3950 4400 50  0000 C CNN
F 1 "10k" V 3950 4250 50  0000 C CNN
F 2 "" V 3780 4300 50  0001 C CNN
F 3 "~" H 3850 4300 50  0001 C CNN
	1    3850 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 4450 3250 4600
Connection ~ 3250 4600
Wire Wire Line
	3250 4600 3150 4600
Wire Wire Line
	3450 4450 3450 4700
Connection ~ 3450 4700
Wire Wire Line
	3450 4700 4050 4700
Wire Wire Line
	3650 4450 3650 4800
Connection ~ 3650 4800
Wire Wire Line
	3650 4800 3150 4800
Wire Wire Line
	3850 4450 3850 4900
Connection ~ 3850 4900
Wire Wire Line
	3850 4900 4050 4900
Wire Wire Line
	3250 4150 3250 4050
Wire Wire Line
	3250 4050 3450 4050
Wire Wire Line
	3850 4050 3850 4150
Wire Wire Line
	3650 4150 3650 4050
Connection ~ 3650 4050
Wire Wire Line
	3650 4050 3850 4050
Wire Wire Line
	3450 4150 3450 4050
Connection ~ 3450 4050
$Comp
L power:+5V #PWR02
U 1 1 5E914060
P 3450 3900
F 0 "#PWR02" H 3450 3750 50  0001 C CNN
F 1 "+5V" H 3465 4073 50  0000 C CNN
F 2 "" H 3450 3900 50  0001 C CNN
F 3 "" H 3450 3900 50  0001 C CNN
	1    3450 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3900 3450 4050
$Comp
L power:GND #PWR01
U 1 1 5E917E68
P 2650 5050
F 0 "#PWR01" H 2650 4800 50  0001 C CNN
F 1 "GND" H 2655 4877 50  0000 C CNN
F 2 "" H 2650 5050 50  0001 C CNN
F 3 "" H 2650 5050 50  0001 C CNN
	1    2650 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 5050 2650 4900
Connection ~ 2650 4900
Text Label 4050 5100 2    50   ~ 0
a07
Text Label 4050 5200 2    50   ~ 0
a06
Text Label 4050 5300 2    50   ~ 0
a05
Text Label 4050 5400 2    50   ~ 0
a04
Text Label 5250 3100 0    50   ~ 0
reset
NoConn ~ 5050 5200
NoConn ~ 5050 5300
Wire Wire Line
	3450 4050 3650 4050
Wire Wire Line
	6300 4950 6500 4950
Text Notes 2400 4600 0    50   ~ 0
msb
Text Notes 2450 4900 0    50   ~ 0
lsb
Text Label 8750 2450 2    50   ~ 0
mr
Text Label 8750 2550 2    50   ~ 0
d07
Text Label 8750 2650 2    50   ~ 0
d06
Text Label 8750 2750 2    50   ~ 0
d05
Text Label 8750 2850 2    50   ~ 0
d04
Text Label 8750 2950 2    50   ~ 0
d03
Text Label 8750 3050 2    50   ~ 0
d02
Text Label 8750 3150 2    50   ~ 0
d01
Text Label 8750 3250 2    50   ~ 0
d00
NoConn ~ 8750 3450
NoConn ~ 8750 3750
NoConn ~ 8750 3850
NoConn ~ 8750 3950
Text Label 8750 4050 2    50   ~ 0
a01
Text Label 8750 4150 2    50   ~ 0
a00
Text Label 8750 4250 2    50   ~ 0
cf_sel
NoConn ~ 9250 3250
NoConn ~ 9250 2550
NoConn ~ 9250 2650
NoConn ~ 9250 2750
NoConn ~ 9250 2850
NoConn ~ 9250 2950
NoConn ~ 9250 3050
NoConn ~ 9250 3150
$Comp
L power:GND #PWR017
U 1 1 5EDFD85C
P 9500 5000
F 0 "#PWR017" H 9500 4750 50  0001 C CNN
F 1 "GND" H 9505 4827 50  0000 C CNN
F 2 "" H 9500 5000 50  0001 C CNN
F 3 "" H 9500 5000 50  0001 C CNN
	1    9500 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 4350 9500 4350
NoConn ~ 9250 3750
NoConn ~ 9250 3950
NoConn ~ 9250 4050
Wire Wire Line
	9250 3850 9500 3850
Wire Wire Line
	9500 3850 9500 4350
Wire Wire Line
	9250 3450 9500 3450
Wire Wire Line
	9500 3450 9500 3550
Connection ~ 9500 3850
Wire Wire Line
	9250 3550 9500 3550
Connection ~ 9500 3550
Wire Wire Line
	9500 3550 9500 3650
Wire Wire Line
	9250 3650 9500 3650
Connection ~ 9500 3650
Wire Wire Line
	9500 3650 9500 3850
Text Label 9250 4150 0    50   ~ 0
a02
$Comp
L Device:R R6
U 1 1 5EE0C0A9
P 9800 4250
F 0 "R6" V 9900 4350 50  0000 C CNN
F 1 "1k" V 9900 4200 50  0000 C CNN
F 2 "" V 9730 4250 50  0001 C CNN
F 3 "~" H 9800 4250 50  0001 C CNN
	1    9800 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9250 4250 9650 4250
NoConn ~ 8750 4350
Wire Wire Line
	5700 4950 5050 4950
Wire Wire Line
	5050 4950 5050 4800
NoConn ~ 4750 1600
NoConn ~ 4750 1700
NoConn ~ 4750 1800
NoConn ~ 4750 1900
NoConn ~ 5250 1900
NoConn ~ 5250 1800
NoConn ~ 5250 1700
NoConn ~ 5250 1600
NoConn ~ 5250 2400
$Comp
L Device:CP C1
U 1 1 5F592784
P 3000 2550
F 0 "C1" H 3118 2596 50  0000 L CNN
F 1 "10uF" H 3118 2505 50  0000 L CNN
F 2 "" H 3038 2400 50  0001 C CNN
F 3 "~" H 3000 2550 50  0001 C CNN
	1    3000 2550
	1    0    0    -1  
$EndComp
Connection ~ 3000 2400
Connection ~ 3000 2700
NoConn ~ 4750 1300
$Comp
L Device:C C2
U 1 1 5F59C5F0
P 9900 3500
F 0 "C2" V 9648 3500 50  0000 C CNN
F 1 "10nF" V 9739 3500 50  0000 C CNN
F 2 "" H 9938 3350 50  0001 C CNN
F 3 "~" H 9900 3500 50  0001 C CNN
	1    9900 3500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x22_Odd_Even J4
U 1 1 5F5B7653
P 8950 3450
F 0 "J4" H 9000 4667 50  0000 C CNN
F 1 "IDE connector" H 9000 4576 50  0000 C CNN
F 2 "" H 8950 3450 50  0001 C CNN
F 3 "~" H 8950 3450 50  0001 C CNN
	1    8950 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 4550 9500 4550
Wire Wire Line
	9500 4550 9500 4350
Connection ~ 9500 4350
$Comp
L power:+5V #PWR016
U 1 1 5F5CC642
P 9250 4450
F 0 "#PWR016" H 9250 4300 50  0001 C CNN
F 1 "+5V" V 9265 4578 50  0000 L CNN
F 2 "" H 9250 4450 50  0001 C CNN
F 3 "" H 9250 4450 50  0001 C CNN
	1    9250 4450
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR018
U 1 1 5F5DBA05
P 9950 4250
F 0 "#PWR018" H 9950 4100 50  0001 C CNN
F 1 "+5V" V 9965 4378 50  0000 L CNN
F 2 "" H 9950 4250 50  0001 C CNN
F 3 "" H 9950 4250 50  0001 C CNN
	1    9950 4250
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 5F5E3373
P 9900 3200
F 0 "#PWR013" H 9900 3050 50  0001 C CNN
F 1 "+5V" V 9915 3328 50  0000 L CNN
F 2 "" H 9900 3200 50  0001 C CNN
F 3 "" H 9900 3200 50  0001 C CNN
	1    9900 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 4550 9500 4850
Connection ~ 9500 4550
Text Label 8750 3650 2    50   ~ 0
rd
Text Label 8750 3550 2    50   ~ 0
wr
$Comp
L 74xx:74LS04 U1
U 1 1 5F69F3D5
P 5650 5400
F 0 "U1" H 5650 5717 50  0000 C CNN
F 1 "74LS04" H 5650 5626 50  0000 C CNN
F 2 "" H 5650 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5650 5400 50  0001 C CNN
	1    5650 5400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 2 1 5F6A0CC1
P 6000 4950
F 0 "U1" H 6000 5267 50  0000 C CNN
F 1 "74LS04" H 6000 5176 50  0000 C CNN
F 2 "" H 6000 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 6000 4950 50  0001 C CNN
	2    6000 4950
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 7 1 5F6A1F31
P 1550 6200
F 0 "U1" H 1780 6246 50  0000 L CNN
F 1 "74LS04" H 1780 6155 50  0000 L CNN
F 2 "" H 1550 6200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1550 6200 50  0001 C CNN
	7    1550 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 5400 5050 5400
Wire Wire Line
	7200 2450 7200 3100
Wire Wire Line
	7200 3100 5250 3100
Wire Wire Line
	5250 2500 6500 2500
Wire Wire Line
	6500 2500 6500 4950
Wire Wire Line
	6800 4250 6800 5400
Wire Wire Line
	6800 5400 5950 5400
Wire Wire Line
	6800 4250 8750 4250
Wire Wire Line
	8750 3350 8450 3350
Wire Wire Line
	8450 3350 8450 4550
Wire Wire Line
	9250 3350 9900 3350
Wire Wire Line
	9900 3200 9900 3350
Connection ~ 9900 3350
$Comp
L power:GND #PWR014
U 1 1 5F6B4BAE
P 9900 3650
F 0 "#PWR014" H 9900 3400 50  0001 C CNN
F 1 "GND" H 9905 3477 50  0000 C CNN
F 2 "" H 9900 3650 50  0001 C CNN
F 3 "" H 9900 3650 50  0001 C CNN
	1    9900 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 5F6B634B
P 8750 4450
F 0 "#PWR011" H 8750 4300 50  0001 C CNN
F 1 "+5V" V 8765 4578 50  0000 L CNN
F 2 "" H 8750 4450 50  0001 C CNN
F 3 "" H 8750 4450 50  0001 C CNN
	1    8750 4450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9500 3450 9500 2450
Wire Wire Line
	9500 2450 9250 2450
Connection ~ 9500 3450
Wire Wire Line
	8750 4550 8450 4550
Connection ~ 8450 4550
Wire Wire Line
	8450 4550 8450 4850
Wire Wire Line
	8450 4850 9500 4850
Wire Wire Line
	9500 5000 9500 4850
Connection ~ 9500 4850
Wire Wire Line
	7200 2450 8750 2450
$EndSCHEMATC
