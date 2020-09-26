EESchema Schematic File Version 4
LIBS:LCD-cache
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
P 3800 2600
F 0 "J2" H 3850 3017 50  0000 C CNN
F 1 "Power Bus" H 3850 2926 50  0000 C CNN
F 2 "" H 3800 2600 50  0001 C CNN
F 3 "~" H 3800 2600 50  0001 C CNN
	1    3800 2600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J3
U 1 1 5DE11A6D
P 5850 2100
F 0 "J3" H 5900 3217 50  0000 C CNN
F 1 "Signal Bus" H 5900 3126 50  0000 C CNN
F 2 "" H 5850 2100 50  0001 C CNN
F 3 "~" H 5850 2100 50  0001 C CNN
	1    5850 2100
	1    0    0    -1  
$EndComp
Text Label 4100 2400 0    50   ~ 0
gnd
Text Label 4100 2500 0    50   ~ 0
+5V
Text Label 4100 2600 0    50   ~ 0
+12V
Text Label 4100 2700 0    50   ~ 0
v1
Text Label 4100 2800 0    50   ~ 0
gnd
Text Label 3600 2400 2    50   ~ 0
gnd
Text Label 3600 2500 2    50   ~ 0
+5V
Text Label 3600 2600 2    50   ~ 0
+12V
Text Label 3600 2700 2    50   ~ 0
v1
Text Label 3600 2800 2    50   ~ 0
gnd
Text Label 5650 1200 2    50   ~ 0
a01
Text Label 5650 1300 2    50   ~ 0
a03
Text Label 5650 1400 2    50   ~ 0
a05
Text Label 5650 1500 2    50   ~ 0
a07
Text Label 5650 1600 2    50   ~ 0
a09
Text Label 5650 1700 2    50   ~ 0
a11
Text Label 5650 1800 2    50   ~ 0
a13
Text Label 5650 1900 2    50   ~ 0
a15
Text Label 5650 2000 2    50   ~ 0
d01
Text Label 5650 2100 2    50   ~ 0
d03
Text Label 5650 2200 2    50   ~ 0
d05
Text Label 5650 2300 2    50   ~ 0
d07
Text Label 5650 2400 2    50   ~ 0
wr
Text Label 5650 2500 2    50   ~ 0
rd
Text Label 5650 2600 2    50   ~ 0
busack
Text Label 5650 2700 2    50   ~ 0
halt
Text Label 5650 2800 2    50   ~ 0
int
Text Label 5650 2900 2    50   ~ 0
s1
Text Label 5650 3000 2    50   ~ 0
m1
Text Label 5650 3100 2    50   ~ 0
clk
Text Label 6150 1200 0    50   ~ 0
a00
Text Label 6150 1300 0    50   ~ 0
a02
Text Label 6150 1400 0    50   ~ 0
a04
Text Label 6150 1500 0    50   ~ 0
a06
Text Label 6150 1600 0    50   ~ 0
a08
Text Label 6150 1700 0    50   ~ 0
a10
Text Label 6150 1800 0    50   ~ 0
a12
Text Label 6150 1900 0    50   ~ 0
a14
Text Label 6150 2000 0    50   ~ 0
d00
Text Label 6150 2100 0    50   ~ 0
d02
Text Label 6150 2200 0    50   ~ 0
d04
Text Label 6150 2300 0    50   ~ 0
d06
Text Label 6150 2400 0    50   ~ 0
mreq
Text Label 6150 2500 0    50   ~ 0
iorq
Text Label 6150 2600 0    50   ~ 0
busrq
Text Label 6150 2700 0    50   ~ 0
wait
Text Label 6150 2800 0    50   ~ 0
nmi
Text Label 6150 2900 0    50   ~ 0
s0
Text Label 6150 3000 0    50   ~ 0
s2
$Comp
L power:+5V #PWR07
U 1 1 5E34AA96
P 4600 2200
F 0 "#PWR07" H 4600 2050 50  0001 C CNN
F 1 "+5V" H 4615 2373 50  0000 C CNN
F 2 "" H 4600 2200 50  0001 C CNN
F 3 "" H 4600 2200 50  0001 C CNN
	1    4600 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5E34BF5A
P 4600 2900
F 0 "#PWR08" H 4600 2650 50  0001 C CNN
F 1 "GND" H 4605 2727 50  0000 C CNN
F 2 "" H 4600 2900 50  0001 C CNN
F 3 "" H 4600 2900 50  0001 C CNN
	1    4600 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 2900 4600 2800
Wire Wire Line
	4600 2800 4100 2800
Wire Wire Line
	4600 2200 4600 2500
Wire Wire Line
	4600 2500 4100 2500
NoConn ~ 5650 3000
NoConn ~ 5650 2900
NoConn ~ 6150 2900
NoConn ~ 6150 3000
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5E3C8BDE
P 3650 1350
F 0 "#FLG01" H 3650 1425 50  0001 C CNN
F 1 "PWR_FLAG" H 3650 1523 50  0000 C CNN
F 2 "" H 3650 1350 50  0001 C CNN
F 3 "~" H 3650 1350 50  0001 C CNN
	1    3650 1350
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5E3C9F2A
P 4600 1350
F 0 "#FLG02" H 4600 1425 50  0001 C CNN
F 1 "PWR_FLAG" H 4600 1523 50  0000 C CNN
F 2 "" H 4600 1350 50  0001 C CNN
F 3 "~" H 4600 1350 50  0001 C CNN
	1    4600 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5E3CA8BD
P 4600 1450
F 0 "#PWR06" H 4600 1200 50  0001 C CNN
F 1 "GND" H 4605 1277 50  0000 C CNN
F 2 "" H 4600 1450 50  0001 C CNN
F 3 "" H 4600 1450 50  0001 C CNN
	1    4600 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 5E3CB5D9
P 3950 1350
F 0 "#PWR02" H 3950 1200 50  0001 C CNN
F 1 "+5V" H 3965 1523 50  0000 C CNN
F 2 "" H 3950 1350 50  0001 C CNN
F 3 "" H 3950 1350 50  0001 C CNN
	1    3950 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1350 3650 1500
Wire Wire Line
	3650 1500 3950 1500
Wire Wire Line
	3950 1500 3950 1350
Wire Wire Line
	4600 1350 4600 1450
NoConn ~ 5650 2700
NoConn ~ 6150 2800
NoConn ~ 6150 2700
NoConn ~ 6150 2600
$Comp
L power:GND #PWR05
U 1 1 5E67707E
P 3950 6800
F 0 "#PWR05" H 3950 6550 50  0001 C CNN
F 1 "GND" H 3955 6627 50  0000 C CNN
F 2 "" H 3950 6800 50  0001 C CNN
F 3 "" H 3950 6800 50  0001 C CNN
	1    3950 6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 5E677E2E
P 3950 5800
F 0 "#PWR04" H 3950 5650 50  0001 C CNN
F 1 "+5V" H 3965 5973 50  0000 C CNN
F 2 "" H 3950 5800 50  0001 C CNN
F 3 "" H 3950 5800 50  0001 C CNN
	1    3950 5800
	1    0    0    -1  
$EndComp
NoConn ~ 5650 2600
$Comp
L 74xx:74LS85 U2
U 1 1 5E8AE503
P 5150 4600
F 0 "U2" H 4900 5400 50  0000 C CNN
F 1 "74LS85" H 4900 5300 50  0000 C CNN
F 2 "" H 5150 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS85" H 5150 4600 50  0001 C CNN
	1    5150 4600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J1
U 1 1 5E8D5E71
P 3450 4300
F 0 "J1" H 3500 4617 50  0000 C CNN
F 1 "card addr" H 3500 4526 50  0000 C CNN
F 2 "" H 3450 4300 50  0001 C CNN
F 3 "~" H 3450 4300 50  0001 C CNN
	1    3450 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 4200 3850 4200
Wire Wire Line
	3750 4300 4050 4300
Wire Wire Line
	4650 4400 4250 4400
Wire Wire Line
	3750 4500 4450 4500
Wire Wire Line
	3250 4200 3250 4300
Wire Wire Line
	3250 4300 3250 4400
Connection ~ 3250 4300
Wire Wire Line
	3250 4400 3250 4500
Connection ~ 3250 4400
$Comp
L power:+5V #PWR09
U 1 1 5E8E97E6
P 5150 3900
F 0 "#PWR09" H 5150 3750 50  0001 C CNN
F 1 "+5V" H 5165 4073 50  0000 C CNN
F 2 "" H 5150 3900 50  0001 C CNN
F 3 "" H 5150 3900 50  0001 C CNN
	1    5150 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5E8EA827
P 5150 5300
F 0 "#PWR010" H 5150 5050 50  0001 C CNN
F 1 "GND" H 5155 5127 50  0000 C CNN
F 2 "" H 5150 5300 50  0001 C CNN
F 3 "" H 5150 5300 50  0001 C CNN
	1    5150 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5E8EB844
P 5650 4200
F 0 "#PWR012" H 5650 3950 50  0001 C CNN
F 1 "GND" H 5655 4027 50  0000 C CNN
F 2 "" H 5650 4200 50  0001 C CNN
F 3 "" H 5650 4200 50  0001 C CNN
	1    5650 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5650 4200 5650 4300
$Comp
L Device:R R1
U 1 1 5E8F1A02
P 3850 3900
F 0 "R1" V 3950 4000 50  0000 C CNN
F 1 "10k" V 3950 3850 50  0000 C CNN
F 2 "" V 3780 3900 50  0001 C CNN
F 3 "~" H 3850 3900 50  0001 C CNN
	1    3850 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5E8F954C
P 4050 3900
F 0 "R2" V 4150 4000 50  0000 C CNN
F 1 "10k" V 4150 3850 50  0000 C CNN
F 2 "" V 3980 3900 50  0001 C CNN
F 3 "~" H 4050 3900 50  0001 C CNN
	1    4050 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5E8FB1E6
P 4250 3900
F 0 "R3" V 4350 4000 50  0000 C CNN
F 1 "10k" V 4350 3850 50  0000 C CNN
F 2 "" V 4180 3900 50  0001 C CNN
F 3 "~" H 4250 3900 50  0001 C CNN
	1    4250 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5E8FCDB9
P 4450 3900
F 0 "R4" V 4550 4000 50  0000 C CNN
F 1 "10k" V 4550 3850 50  0000 C CNN
F 2 "" V 4380 3900 50  0001 C CNN
F 3 "~" H 4450 3900 50  0001 C CNN
	1    4450 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 4050 3850 4200
Connection ~ 3850 4200
Wire Wire Line
	3850 4200 3750 4200
Wire Wire Line
	4050 4050 4050 4300
Connection ~ 4050 4300
Wire Wire Line
	4050 4300 4650 4300
Wire Wire Line
	4250 4050 4250 4400
Connection ~ 4250 4400
Wire Wire Line
	4250 4400 3750 4400
Wire Wire Line
	4450 4050 4450 4500
Connection ~ 4450 4500
Wire Wire Line
	4450 4500 4650 4500
Wire Wire Line
	3850 3750 3850 3650
Wire Wire Line
	3850 3650 4050 3650
Wire Wire Line
	4450 3650 4450 3750
Wire Wire Line
	4250 3750 4250 3650
Connection ~ 4250 3650
Wire Wire Line
	4250 3650 4450 3650
Wire Wire Line
	4050 3750 4050 3650
Connection ~ 4050 3650
$Comp
L power:+5V #PWR03
U 1 1 5E914060
P 4050 3500
F 0 "#PWR03" H 4050 3350 50  0001 C CNN
F 1 "+5V" H 4065 3673 50  0000 C CNN
F 2 "" H 4050 3500 50  0001 C CNN
F 3 "" H 4050 3500 50  0001 C CNN
	1    4050 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 3500 4050 3650
$Comp
L power:GND #PWR01
U 1 1 5E917E68
P 3250 4650
F 0 "#PWR01" H 3250 4400 50  0001 C CNN
F 1 "GND" H 3255 4477 50  0000 C CNN
F 2 "" H 3250 4650 50  0001 C CNN
F 3 "" H 3250 4650 50  0001 C CNN
	1    3250 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 4650 3250 4500
Connection ~ 3250 4500
Text Label 4650 4700 2    50   ~ 0
a07
Text Label 4650 4800 2    50   ~ 0
a06
Text Label 4650 4900 2    50   ~ 0
a05
Text Label 4650 5000 2    50   ~ 0
a04
Text Label 6150 3100 0    50   ~ 0
reset
NoConn ~ 5650 4800
NoConn ~ 5650 4900
Wire Wire Line
	4050 3650 4250 3650
Text Notes 3000 4200 0    50   ~ 0
msb
Text Notes 3050 4500 0    50   ~ 0
lsb
NoConn ~ 6150 1600
NoConn ~ 6150 1700
NoConn ~ 6150 1800
NoConn ~ 6150 1900
NoConn ~ 5650 1900
NoConn ~ 5650 1800
NoConn ~ 5650 1700
NoConn ~ 5650 1600
NoConn ~ 5650 1300
NoConn ~ 6150 1300
NoConn ~ 6150 2400
Connection ~ 5650 4200
NoConn ~ 13250 1100
Wire Wire Line
	5950 4400 5650 4400
Wire Wire Line
	6550 4400 6700 4400
$Comp
L 74xx:74LS04 U1
U 7 1 5F3A989B
P 3950 6300
F 0 "U1" H 4180 6346 50  0000 L CNN
F 1 "74LS04" H 4180 6255 50  0000 L CNN
F 2 "" H 3950 6300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3950 6300 50  0001 C CNN
	7    3950 6300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 2 1 5F3AC87F
P 6250 4400
F 0 "U1" H 6250 4717 50  0000 C CNN
F 1 "74LS04" H 6250 4626 50  0000 C CNN
F 2 "" H 6250 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 6250 4400 50  0001 C CNN
	2    6250 4400
	-1   0    0    -1  
$EndComp
NoConn ~ 5650 2400
NoConn ~ 5650 2500
NoConn ~ 5650 2800
NoConn ~ 6150 3100
NoConn ~ 5650 3100
$Comp
L Device:CP C1
U 1 1 5F461468
P 4600 2650
F 0 "C1" H 4718 2696 50  0000 L CNN
F 1 "10uF" H 4718 2605 50  0000 L CNN
F 2 "" H 4638 2500 50  0001 C CNN
F 3 "~" H 4600 2650 50  0001 C CNN
	1    4600 2650
	1    0    0    -1  
$EndComp
Connection ~ 4600 2500
Connection ~ 4600 2800
Wire Wire Line
	6700 4400 6700 2500
Wire Wire Line
	6700 2500 6150 2500
Text Notes 9000 3950 0    50   ~ 0
Vss (GND)
Text Notes 9000 4050 0    50   ~ 0
Vdd (Vcc)
Text Notes 9000 4250 0    50   ~ 0
RS
Text Notes 9000 4350 0    50   ~ 0
R/W
Text Notes 9000 4450 0    50   ~ 0
E
Text Notes 9000 4550 0    50   ~ 0
DB0
Text Notes 9000 4750 0    50   ~ 0
DB2
Text Notes 9000 4850 0    50   ~ 0
DB3
Text Notes 9000 4950 0    50   ~ 0
DB4
Text Notes 9000 5050 0    50   ~ 0
DB5
Text Notes 9000 5150 0    50   ~ 0
DB6
Text Notes 9000 5250 0    50   ~ 0
DB7
Text Notes 9000 5350 0    50   ~ 0
LED A
Text Notes 9000 5450 0    50   ~ 0
LED K
Text Label 8750 4500 2    50   ~ 0
d00
Text Label 8750 4600 2    50   ~ 0
d01
Text Label 8750 4700 2    50   ~ 0
d02
Text Label 8750 4800 2    50   ~ 0
d03
Text Label 8750 4900 2    50   ~ 0
d04
Text Label 8750 5000 2    50   ~ 0
d05
Text Label 8750 5100 2    50   ~ 0
d06
Text Label 8750 5200 2    50   ~ 0
d07
Text Label 8750 4200 2    50   ~ 0
a00
Text Label 8750 4300 2    50   ~ 0
a01
Wire Wire Line
	8750 5400 8600 5400
$Comp
L power:GND #PWR015
U 1 1 5F4781A2
P 8600 5400
F 0 "#PWR015" H 8600 5150 50  0001 C CNN
F 1 "GND" H 8605 5227 50  0000 C CNN
F 2 "" H 8600 5400 50  0001 C CNN
F 3 "" H 8600 5400 50  0001 C CNN
	1    8600 5400
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR014
U 1 1 5F47921D
P 8300 5300
F 0 "#PWR014" H 8300 5150 50  0001 C CNN
F 1 "+5V" H 8315 5473 50  0000 C CNN
F 2 "" H 8300 5300 50  0001 C CNN
F 3 "" H 8300 5300 50  0001 C CNN
	1    8300 5300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8300 5300 8750 5300
$Comp
L Device:R_POT_TRIM RV1
U 1 1 5F479F8D
P 7500 4100
F 0 "RV1" H 7430 4146 50  0000 R CNN
F 1 "10k" H 7430 4055 50  0000 R CNN
F 2 "" H 7500 4100 50  0001 C CNN
F 3 "~" H 7500 4100 50  0001 C CNN
	1    7500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 4100 7650 4100
$Comp
L power:GND #PWR013
U 1 1 5F47CA48
P 7500 4350
F 0 "#PWR013" H 7500 4100 50  0001 C CNN
F 1 "GND" H 7505 4177 50  0000 C CNN
F 2 "" H 7500 4350 50  0001 C CNN
F 3 "" H 7500 4350 50  0001 C CNN
	1    7500 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 5F47D1E9
P 7500 3850
F 0 "#PWR011" H 7500 3700 50  0001 C CNN
F 1 "+5V" H 7515 4023 50  0000 C CNN
F 2 "" H 7500 3850 50  0001 C CNN
F 3 "" H 7500 3850 50  0001 C CNN
	1    7500 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 4000 7800 4000
Wire Wire Line
	7800 4000 7800 3850
Wire Wire Line
	7800 3850 7500 3850
Wire Wire Line
	7500 3850 7500 3950
Connection ~ 7500 3850
Wire Wire Line
	8750 3900 7950 3900
Wire Wire Line
	7950 3900 7950 4350
Wire Wire Line
	7950 4350 7500 4350
Wire Wire Line
	7500 4350 7500 4250
Connection ~ 7500 4350
Wire Wire Line
	8750 4400 8150 4400
Wire Wire Line
	8150 4400 8150 5000
Wire Wire Line
	5650 5000 8150 5000
Text Notes 9000 4150 0    50   ~ 0
Vo (contrast)\n
$Comp
L Connector:Conn_01x16_Female J4
U 1 1 5F4C4EF9
P 8950 4600
F 0 "J4" H 8850 5500 50  0000 L CNN
F 1 "LCD connector" H 8650 5400 50  0000 L CNN
F 2 "" H 8950 4600 50  0001 C CNN
F 3 "~" H 8950 4600 50  0001 C CNN
	1    8950 4600
	1    0    0    -1  
$EndComp
Text Notes 9000 4650 0    50   ~ 0
DB1
$EndSCHEMATC
