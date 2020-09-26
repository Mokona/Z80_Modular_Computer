EESchema Schematic File Version 4
LIBS:USART-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "USART Card for Z80 Modular Computer"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L My_Private_lib:8251 U3
U 1 1 5E8B5EDD
P 5700 3850
F 0 "U3" H 5350 4750 50  0000 C CNN
F 1 "8251" H 5350 4650 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 5800 2950 50  0001 C CNN
F 3 "" H 5700 4200 50  0001 C CNN
	1    5700 3850
	1    0    0    -1  
$EndComp
$Comp
L Interface_UART:MAX232 U5
U 1 1 5E8B66FC
P 8400 3300
F 0 "U5" H 8050 4500 50  0000 C CNN
F 1 "MAX232" H 8050 4400 50  0000 C CNN
F 2 "" H 8450 2250 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/max232.pdf" H 8400 3400 50  0001 C CNN
	1    8400 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J2
U 1 1 5DE110BD
P 1450 2450
F 0 "J2" H 1500 2867 50  0000 C CNN
F 1 "Power Bus" H 1500 2776 50  0000 C CNN
F 2 "" H 1450 2450 50  0001 C CNN
F 3 "~" H 1450 2450 50  0001 C CNN
	1    1450 2450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J3
U 1 1 5DE11A6D
P 3500 1950
F 0 "J3" H 3550 3067 50  0000 C CNN
F 1 "Signal Buss" H 3550 2976 50  0000 C CNN
F 2 "" H 3500 1950 50  0001 C CNN
F 3 "~" H 3500 1950 50  0001 C CNN
	1    3500 1950
	1    0    0    -1  
$EndComp
Text Label 1750 2250 0    50   ~ 0
gnd
Text Label 1750 2350 0    50   ~ 0
+5V
Text Label 1750 2450 0    50   ~ 0
+12V
Text Label 1750 2550 0    50   ~ 0
v1
Text Label 1750 2650 0    50   ~ 0
gnd
Text Label 1250 2250 2    50   ~ 0
gnd
Text Label 1250 2350 2    50   ~ 0
+5V
Text Label 1250 2450 2    50   ~ 0
+12V
Text Label 1250 2550 2    50   ~ 0
v1
Text Label 1250 2650 2    50   ~ 0
gnd
Text Label 3300 1050 2    50   ~ 0
a01
Text Label 3300 1150 2    50   ~ 0
a03
Text Label 3300 1250 2    50   ~ 0
a05
Text Label 3300 1350 2    50   ~ 0
a07
Text Label 3300 1450 2    50   ~ 0
a09
Text Label 3300 1550 2    50   ~ 0
a11
Text Label 3300 1650 2    50   ~ 0
a13
Text Label 3300 1750 2    50   ~ 0
a15
Text Label 3300 1850 2    50   ~ 0
d01
Text Label 3300 1950 2    50   ~ 0
d03
Text Label 3300 2050 2    50   ~ 0
d05
Text Label 3300 2150 2    50   ~ 0
d07
Text Label 3300 2250 2    50   ~ 0
wr
Text Label 3300 2350 2    50   ~ 0
rd
Text Label 3300 2450 2    50   ~ 0
busack
Text Label 3300 2550 2    50   ~ 0
halt
Text Label 3300 2650 2    50   ~ 0
int
Text Label 3300 2750 2    50   ~ 0
s1
Text Label 3300 2850 2    50   ~ 0
m1
Text Label 3300 2950 2    50   ~ 0
clk
Text Label 3800 1050 0    50   ~ 0
a00
Text Label 3800 1150 0    50   ~ 0
a02
Text Label 3800 1250 0    50   ~ 0
a04
Text Label 3800 1350 0    50   ~ 0
a06
Text Label 3800 1450 0    50   ~ 0
a08
Text Label 3800 1550 0    50   ~ 0
a10
Text Label 3800 1650 0    50   ~ 0
a12
Text Label 3800 1750 0    50   ~ 0
a14
Text Label 3800 1850 0    50   ~ 0
d00
Text Label 3800 1950 0    50   ~ 0
d02
Text Label 3800 2050 0    50   ~ 0
d04
Text Label 3800 2150 0    50   ~ 0
d06
Text Label 3800 2250 0    50   ~ 0
mreq
Text Label 3800 2350 0    50   ~ 0
iorq
Text Label 3800 2450 0    50   ~ 0
busrq
Text Label 3800 2550 0    50   ~ 0
wait
Text Label 3800 2650 0    50   ~ 0
nmi
Text Label 3800 2750 0    50   ~ 0
s0
Text Label 3800 2850 0    50   ~ 0
s2
$Comp
L power:+5V #PWR07
U 1 1 5E34AA96
P 2250 2050
F 0 "#PWR07" H 2250 1900 50  0001 C CNN
F 1 "+5V" H 2265 2223 50  0000 C CNN
F 2 "" H 2250 2050 50  0001 C CNN
F 3 "" H 2250 2050 50  0001 C CNN
	1    2250 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5E34BF5A
P 2250 2750
F 0 "#PWR08" H 2250 2500 50  0001 C CNN
F 1 "GND" H 2255 2577 50  0000 C CNN
F 2 "" H 2250 2750 50  0001 C CNN
F 3 "" H 2250 2750 50  0001 C CNN
	1    2250 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2750 2250 2650
Wire Wire Line
	2250 2650 1750 2650
Wire Wire Line
	2250 2050 2250 2350
Wire Wire Line
	2250 2350 1750 2350
NoConn ~ 3300 2850
NoConn ~ 3300 2750
NoConn ~ 3800 2750
NoConn ~ 3800 2850
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5E3C8BDE
P 1300 1200
F 0 "#FLG01" H 1300 1275 50  0001 C CNN
F 1 "PWR_FLAG" H 1300 1373 50  0000 C CNN
F 2 "" H 1300 1200 50  0001 C CNN
F 3 "~" H 1300 1200 50  0001 C CNN
	1    1300 1200
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5E3C9F2A
P 2250 1200
F 0 "#FLG02" H 2250 1275 50  0001 C CNN
F 1 "PWR_FLAG" H 2250 1373 50  0000 C CNN
F 2 "" H 2250 1200 50  0001 C CNN
F 3 "~" H 2250 1200 50  0001 C CNN
	1    2250 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5E3CA8BD
P 2250 1300
F 0 "#PWR06" H 2250 1050 50  0001 C CNN
F 1 "GND" H 2255 1127 50  0000 C CNN
F 2 "" H 2250 1300 50  0001 C CNN
F 3 "" H 2250 1300 50  0001 C CNN
	1    2250 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 5E3CB5D9
P 1600 1200
F 0 "#PWR02" H 1600 1050 50  0001 C CNN
F 1 "+5V" H 1615 1373 50  0000 C CNN
F 2 "" H 1600 1200 50  0001 C CNN
F 3 "" H 1600 1200 50  0001 C CNN
	1    1600 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1200 1300 1350
Wire Wire Line
	1300 1350 1600 1350
Wire Wire Line
	1600 1350 1600 1200
Wire Wire Line
	2250 1200 2250 1300
NoConn ~ 3300 2550
NoConn ~ 3800 2650
NoConn ~ 3800 2550
NoConn ~ 3800 2450
$Comp
L power:GND #PWR05
U 1 1 5E67707E
P 8600 6150
F 0 "#PWR05" H 8600 5900 50  0001 C CNN
F 1 "GND" H 8605 5977 50  0000 C CNN
F 2 "" H 8600 6150 50  0001 C CNN
F 3 "" H 8600 6150 50  0001 C CNN
	1    8600 6150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 5E677E2E
P 8600 5050
F 0 "#PWR04" H 8600 4900 50  0001 C CNN
F 1 "+5V" H 8615 5223 50  0000 C CNN
F 2 "" H 8600 5050 50  0001 C CNN
F 3 "" H 8600 5050 50  0001 C CNN
	1    8600 5050
	1    0    0    -1  
$EndComp
NoConn ~ 3300 2450
$Comp
L 74xx:74LS85 U2
U 1 1 5E8AE503
P 2800 4450
F 0 "U2" H 2550 5250 50  0000 C CNN
F 1 "74LS85" H 2550 5150 50  0000 C CNN
F 2 "" H 2800 4450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS85" H 2800 4450 50  0001 C CNN
	1    2800 4450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J1
U 1 1 5E8D5E71
P 1100 4150
F 0 "J1" H 1150 4467 50  0000 C CNN
F 1 "Card addr" H 1150 4376 50  0000 C CNN
F 2 "" H 1100 4150 50  0001 C CNN
F 3 "~" H 1100 4150 50  0001 C CNN
	1    1100 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 4050 1500 4050
Wire Wire Line
	1400 4150 1700 4150
Wire Wire Line
	2300 4250 1900 4250
Wire Wire Line
	1400 4350 2100 4350
Wire Wire Line
	900  4050 900  4150
Wire Wire Line
	900  4150 900  4250
Connection ~ 900  4150
Wire Wire Line
	900  4250 900  4350
Connection ~ 900  4250
$Comp
L power:+5V #PWR09
U 1 1 5E8E97E6
P 2800 3750
F 0 "#PWR09" H 2800 3600 50  0001 C CNN
F 1 "+5V" H 2815 3923 50  0000 C CNN
F 2 "" H 2800 3750 50  0001 C CNN
F 3 "" H 2800 3750 50  0001 C CNN
	1    2800 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5E8EA827
P 2800 5150
F 0 "#PWR010" H 2800 4900 50  0001 C CNN
F 1 "GND" H 2805 4977 50  0000 C CNN
F 2 "" H 2800 5150 50  0001 C CNN
F 3 "" H 2800 5150 50  0001 C CNN
	1    2800 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5E8EB844
P 3300 4050
F 0 "#PWR012" H 3300 3800 50  0001 C CNN
F 1 "GND" H 3305 3877 50  0000 C CNN
F 2 "" H 3300 4050 50  0001 C CNN
F 3 "" H 3300 4050 50  0001 C CNN
	1    3300 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3300 4050 3300 4150
$Comp
L Device:R R1
U 1 1 5E8F1A02
P 1500 3750
F 0 "R1" V 1600 3850 50  0000 C CNN
F 1 "10k" V 1600 3700 50  0000 C CNN
F 2 "" V 1430 3750 50  0001 C CNN
F 3 "~" H 1500 3750 50  0001 C CNN
	1    1500 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5E8F954C
P 1700 3750
F 0 "R2" V 1800 3850 50  0000 C CNN
F 1 "10k" V 1800 3700 50  0000 C CNN
F 2 "" V 1630 3750 50  0001 C CNN
F 3 "~" H 1700 3750 50  0001 C CNN
	1    1700 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5E8FB1E6
P 1900 3750
F 0 "R3" V 2000 3850 50  0000 C CNN
F 1 "10k" V 2000 3700 50  0000 C CNN
F 2 "" V 1830 3750 50  0001 C CNN
F 3 "~" H 1900 3750 50  0001 C CNN
	1    1900 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5E8FCDB9
P 2100 3750
F 0 "R4" V 2200 3850 50  0000 C CNN
F 1 "10k" V 2200 3700 50  0000 C CNN
F 2 "" V 2030 3750 50  0001 C CNN
F 3 "~" H 2100 3750 50  0001 C CNN
	1    2100 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 3900 1500 4050
Connection ~ 1500 4050
Wire Wire Line
	1500 4050 1400 4050
Wire Wire Line
	1700 3900 1700 4150
Connection ~ 1700 4150
Wire Wire Line
	1700 4150 2300 4150
Wire Wire Line
	1900 3900 1900 4250
Connection ~ 1900 4250
Wire Wire Line
	1900 4250 1400 4250
Wire Wire Line
	2100 3900 2100 4350
Connection ~ 2100 4350
Wire Wire Line
	2100 4350 2300 4350
Wire Wire Line
	1500 3600 1500 3500
Wire Wire Line
	1500 3500 1700 3500
Wire Wire Line
	2100 3500 2100 3600
Wire Wire Line
	1900 3600 1900 3500
Connection ~ 1900 3500
Wire Wire Line
	1900 3500 2100 3500
Wire Wire Line
	1700 3600 1700 3500
Connection ~ 1700 3500
$Comp
L power:+5V #PWR03
U 1 1 5E914060
P 1700 3350
F 0 "#PWR03" H 1700 3200 50  0001 C CNN
F 1 "+5V" H 1715 3523 50  0000 C CNN
F 2 "" H 1700 3350 50  0001 C CNN
F 3 "" H 1700 3350 50  0001 C CNN
	1    1700 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 3350 1700 3500
$Comp
L power:GND #PWR01
U 1 1 5E917E68
P 900 4500
F 0 "#PWR01" H 900 4250 50  0001 C CNN
F 1 "GND" H 905 4327 50  0000 C CNN
F 2 "" H 900 4500 50  0001 C CNN
F 3 "" H 900 4500 50  0001 C CNN
	1    900  4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  4500 900  4350
Connection ~ 900  4350
Text Label 2300 4550 2    50   ~ 0
a07
Text Label 2300 4650 2    50   ~ 0
a06
Text Label 2300 4750 2    50   ~ 0
a05
Text Label 2300 4850 2    50   ~ 0
a04
NoConn ~ 3300 4650
NoConn ~ 3300 4750
Wire Wire Line
	1700 3500 1900 3500
Text Notes 650  4050 0    50   ~ 0
msb
Text Notes 700  4350 0    50   ~ 0
lsb
Text Label 5200 3250 2    50   ~ 0
d07
Text Label 5200 3350 2    50   ~ 0
d06
Text Label 5200 3450 2    50   ~ 0
d05
Text Label 5200 3550 2    50   ~ 0
d04
Text Label 5200 3650 2    50   ~ 0
d03
Text Label 5200 3750 2    50   ~ 0
d02
Text Label 5200 3850 2    50   ~ 0
d01
Text Label 5200 3950 2    50   ~ 0
d00
Text Label 5200 4300 2    50   ~ 0
a00
Text Label 5200 4400 2    50   ~ 0
rd
Text Label 5200 4500 2    50   ~ 0
wr
$Comp
L power:GND #PWR016
U 1 1 5EA529DA
P 5700 4800
F 0 "#PWR016" H 5700 4550 50  0001 C CNN
F 1 "GND" H 5705 4627 50  0000 C CNN
F 2 "" H 5700 4800 50  0001 C CNN
F 3 "" H 5700 4800 50  0001 C CNN
	1    5700 4800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR015
U 1 1 5EA54796
P 5700 2950
F 0 "#PWR015" H 5700 2800 50  0001 C CNN
F 1 "+5V" H 5715 3123 50  0000 C CNN
F 2 "" H 5700 2950 50  0001 C CNN
F 3 "" H 5700 2950 50  0001 C CNN
	1    5700 2950
	1    0    0    -1  
$EndComp
NoConn ~ 3800 1450
NoConn ~ 3800 1550
NoConn ~ 3800 1650
NoConn ~ 3800 1750
NoConn ~ 3300 1750
NoConn ~ 3300 1650
NoConn ~ 3300 1550
NoConn ~ 3300 1450
NoConn ~ 3300 1150
NoConn ~ 3800 1150
NoConn ~ 3300 1050
NoConn ~ 3800 2250
NoConn ~ 6200 4100
$Comp
L Device:CP C4
U 1 1 5EA61F2B
P 9200 2550
F 0 "C4" H 9318 2596 50  0000 L CNN
F 1 "1uF" H 9318 2505 50  0000 L CNN
F 2 "" H 9238 2400 50  0001 C CNN
F 3 "~" H 9200 2550 50  0001 C CNN
	1    9200 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 5EA62D6B
P 7600 2550
F 0 "C2" H 7350 2650 50  0000 L CNN
F 1 "1uF" H 7350 2550 50  0000 L CNN
F 2 "" H 7638 2400 50  0001 C CNN
F 3 "~" H 7600 2550 50  0001 C CNN
	1    7600 2550
	1    0    0    -1  
$EndComp
$Comp
L Connector:DB9_Male J4
U 1 1 5E8B7530
P 10700 4000
F 0 "J4" H 10880 4046 50  0000 L CNN
F 1 "RS232" H 10880 3955 50  0000 L CNN
F 2 "" H 10700 4000 50  0001 C CNN
F 3 " ~" H 10700 4000 50  0001 C CNN
	1    10700 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C5
U 1 1 5EA60659
P 9550 2900
F 0 "C5" V 9700 2950 50  0000 C CNN
F 1 "1uF" V 9700 2800 50  0000 C CNN
F 2 "" H 9588 2750 50  0001 C CNN
F 3 "~" H 9550 2900 50  0001 C CNN
	1    9550 2900
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP C6
U 1 1 5EA6122F
P 9550 3200
F 0 "C6" V 9400 3150 50  0000 C CNN
F 1 "1uF" V 9400 3300 50  0000 C CNN
F 2 "" H 9588 3050 50  0001 C CNN
F 3 "~" H 9550 3200 50  0001 C CNN
	1    9550 3200
	0    1    1    0   
$EndComp
$Comp
L Device:CP C3
U 1 1 5EA72344
P 8700 1950
F 0 "C3" V 8850 2100 50  0000 C CNN
F 1 "1uF" V 8850 1850 50  0000 C CNN
F 2 "" H 8738 1800 50  0001 C CNN
F 3 "~" H 8700 1950 50  0001 C CNN
	1    8700 1950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5EA7906F
P 9100 1950
F 0 "#PWR026" H 9100 1700 50  0001 C CNN
F 1 "GND" V 9105 1822 50  0000 R CNN
F 2 "" H 9100 1950 50  0001 C CNN
F 3 "" H 9100 1950 50  0001 C CNN
	1    9100 1950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR028
U 1 1 5EA79CB0
P 9850 3200
F 0 "#PWR028" H 9850 2950 50  0001 C CNN
F 1 "GND" V 9855 3072 50  0000 R CNN
F 2 "" H 9850 3200 50  0001 C CNN
F 3 "" H 9850 3200 50  0001 C CNN
	1    9850 3200
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR024
U 1 1 5EA7AFE0
P 8400 1800
F 0 "#PWR024" H 8400 1650 50  0001 C CNN
F 1 "+5V" H 8415 1973 50  0000 C CNN
F 2 "" H 8400 1800 50  0001 C CNN
F 3 "" H 8400 1800 50  0001 C CNN
	1    8400 1800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR027
U 1 1 5EA7BEDF
P 9850 2750
F 0 "#PWR027" H 9850 2600 50  0001 C CNN
F 1 "+5V" H 9865 2923 50  0000 C CNN
F 2 "" H 9850 2750 50  0001 C CNN
F 3 "" H 9850 2750 50  0001 C CNN
	1    9850 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 1800 8400 1950
Wire Wire Line
	8550 1950 8400 1950
Connection ~ 8400 1950
Wire Wire Line
	8400 1950 8400 2100
Wire Wire Line
	9200 2900 9400 2900
Wire Wire Line
	9200 3200 9400 3200
Wire Wire Line
	9700 2900 9850 2900
Wire Wire Line
	9850 2900 9850 2750
Wire Wire Line
	9850 3200 9700 3200
Wire Wire Line
	9100 1950 8850 1950
Wire Wire Line
	6200 3600 6500 3600
NoConn ~ 6200 3400
NoConn ~ 6200 3500
$Comp
L power:GND #PWR025
U 1 1 5EA9D943
P 8400 4500
F 0 "#PWR025" H 8400 4250 50  0001 C CNN
F 1 "GND" H 8405 4327 50  0000 C CNN
F 2 "" H 8400 4500 50  0001 C CNN
F 3 "" H 8400 4500 50  0001 C CNN
	1    8400 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 5EAA4037
P 10400 3600
F 0 "#PWR029" H 10400 3350 50  0001 C CNN
F 1 "GND" V 10405 3472 50  0000 R CNN
F 2 "" H 10400 3600 50  0001 C CNN
F 3 "" H 10400 3600 50  0001 C CNN
	1    10400 3600
	0    1    1    0   
$EndComp
$Comp
L Transistor_BJT:BC328 Q2
U 1 1 5EAC3D76
P 6450 1050
F 0 "Q2" H 6641 1004 50  0000 L CNN
F 1 "BC328" H 6641 1095 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 6650 975 50  0001 L CIN
F 3 "http://www.redrok.com/PNP_BC327_-45V_-800mA_0.625W_Hfe100_TO-92.pdf" H 6450 1050 50  0001 L CNN
	1    6450 1050
	-1   0    0    1   
$EndComp
$Comp
L Device:R R7
U 1 1 5EAC8C44
P 6350 1700
F 0 "R7" H 6420 1746 50  0000 L CNN
F 1 "180" H 6420 1655 50  0000 L CNN
F 2 "" V 6280 1700 50  0001 C CNN
F 3 "~" H 6350 1700 50  0001 C CNN
	1    6350 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 5EACD440
P 6350 1400
F 0 "D2" V 6389 1283 50  0000 R CNN
F 1 "LED" V 6298 1283 50  0000 R CNN
F 2 "" H 6350 1400 50  0001 C CNN
F 3 "~" H 6350 1400 50  0001 C CNN
	1    6350 1400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5EAD43C2
P 6350 1850
F 0 "#PWR018" H 6350 1600 50  0001 C CNN
F 1 "GND" H 6355 1677 50  0000 C CNN
F 2 "" H 6350 1850 50  0001 C CNN
F 3 "" H 6350 1850 50  0001 C CNN
	1    6350 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5EAD4843
P 6800 1050
F 0 "R9" V 7007 1050 50  0000 C CNN
F 1 "3k3" V 6916 1050 50  0000 C CNN
F 2 "" V 6730 1050 50  0001 C CNN
F 3 "~" H 6800 1050 50  0001 C CNN
	1    6800 1050
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR017
U 1 1 5EADA8EC
P 6350 850
F 0 "#PWR017" H 6350 700 50  0001 C CNN
F 1 "+5V" H 6365 1023 50  0000 C CNN
F 2 "" H 6350 850 50  0001 C CNN
F 3 "" H 6350 850 50  0001 C CNN
	1    6350 850 
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC328 Q1
U 1 1 5EADEC37
P 5300 1050
F 0 "Q1" H 5491 1004 50  0000 L CNN
F 1 "BC328" H 5491 1095 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 5500 975 50  0001 L CIN
F 3 "http://www.redrok.com/PNP_BC327_-45V_-800mA_0.625W_Hfe100_TO-92.pdf" H 5300 1050 50  0001 L CNN
	1    5300 1050
	-1   0    0    1   
$EndComp
$Comp
L Device:R R5
U 1 1 5EADEC3D
P 5200 1700
F 0 "R5" H 5270 1746 50  0000 L CNN
F 1 "180" H 5270 1655 50  0000 L CNN
F 2 "" V 5130 1700 50  0001 C CNN
F 3 "~" H 5200 1700 50  0001 C CNN
	1    5200 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 5EADEC43
P 5200 1400
F 0 "D1" V 5239 1283 50  0000 R CNN
F 1 "LED" V 5148 1283 50  0000 R CNN
F 2 "" H 5200 1400 50  0001 C CNN
F 3 "~" H 5200 1400 50  0001 C CNN
	1    5200 1400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5EADEC49
P 5200 1850
F 0 "#PWR014" H 5200 1600 50  0001 C CNN
F 1 "GND" H 5205 1677 50  0000 C CNN
F 2 "" H 5200 1850 50  0001 C CNN
F 3 "" H 5200 1850 50  0001 C CNN
	1    5200 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5EADEC4F
P 5650 1050
F 0 "R6" V 5857 1050 50  0000 C CNN
F 1 "3k3" V 5766 1050 50  0000 C CNN
F 2 "" V 5580 1050 50  0001 C CNN
F 3 "~" H 5650 1050 50  0001 C CNN
	1    5650 1050
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 5EADEC55
P 5200 850
F 0 "#PWR013" H 5200 700 50  0001 C CNN
F 1 "+5V" H 5215 1023 50  0000 C CNN
F 2 "" H 5200 850 50  0001 C CNN
F 3 "" H 5200 850 50  0001 C CNN
	1    5200 850 
	1    0    0    -1  
$EndComp
Text Notes 6200 1450 2    50   ~ 0
TX
Text Notes 5050 1450 2    50   ~ 0
RX
Wire Wire Line
	6500 3600 6500 4000
$Comp
L power:GND #PWR020
U 1 1 5EB3F82C
P 1750 7150
F 0 "#PWR020" H 1750 6900 50  0001 C CNN
F 1 "GND" H 1755 6977 50  0000 C CNN
F 2 "" H 1750 7150 50  0001 C CNN
F 3 "" H 1750 7150 50  0001 C CNN
	1    1750 7150
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR019
U 1 1 5EB4811F
P 5300 5750
F 0 "#PWR019" H 5300 5600 50  0001 C CNN
F 1 "+5V" H 5315 5923 50  0000 C CNN
F 2 "" H 5300 5750 50  0001 C CNN
F 3 "" H 5300 5750 50  0001 C CNN
	1    5300 5750
	-1   0    0    -1  
$EndComp
Connection ~ 3300 4050
Wire Wire Line
	6200 4000 6500 4000
Wire Wire Line
	7600 3400 7000 3400
Wire Wire Line
	7600 3800 6850 3800
NoConn ~ 13250 1100
NoConn ~ 10400 3700
Wire Wire Line
	10400 4000 10000 4000
Wire Wire Line
	10000 4000 10000 3400
Wire Wire Line
	10000 3400 9200 3400
Wire Wire Line
	10400 4200 9700 4200
Wire Wire Line
	9700 4200 9700 3800
Wire Wire Line
	9700 3800 9200 3800
Wire Wire Line
	5800 1050 5900 1050
$Comp
L Connector_Generic:Conn_02x01 J5
U 1 1 5EFFC074
P 4750 2550
F 0 "J5" H 4800 2767 50  0000 C CNN
F 1 "INT enable" H 4800 2676 50  0000 C CNN
F 2 "" H 4750 2550 50  0001 C CNN
F 3 "~" H 4750 2550 50  0001 C CNN
	1    4750 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2550 5050 2550
Wire Wire Line
	5900 2150 6850 2150
Wire Wire Line
	6200 3800 6850 3800
Wire Wire Line
	6200 3900 6350 3900
Wire Wire Line
	6350 2550 5850 2550
Wire Wire Line
	6350 2550 6350 3900
Wire Wire Line
	3300 2650 3150 2650
Wire Wire Line
	3150 2650 3150 3100
Wire Wire Line
	3150 3100 4050 3100
Wire Wire Line
	5900 1050 5900 2150
Wire Wire Line
	7000 1050 6950 1050
Connection ~ 6850 3800
Wire Wire Line
	6850 2150 6850 3800
NoConn ~ 7600 3600
NoConn ~ 7600 4000
NoConn ~ 9200 4000
NoConn ~ 9200 3600
NoConn ~ 6200 4300
NoConn ~ 6200 4400
NoConn ~ 6200 4500
NoConn ~ 6200 4600
Wire Wire Line
	7000 3400 6650 3400
Connection ~ 7000 3400
Wire Wire Line
	7000 1050 7000 3400
Wire Wire Line
	10400 3800 10250 3800
Wire Wire Line
	10250 3800 10250 4300
Wire Wire Line
	10250 4300 10400 4300
Wire Wire Line
	6650 3300 6650 3400
Wire Wire Line
	6200 3300 6650 3300
$Comp
L 74xx:74LS04 U1
U 7 1 5F3A989B
P 8600 5600
F 0 "U1" H 8830 5646 50  0000 L CNN
F 1 "74LS04" H 8830 5555 50  0000 L CNN
F 2 "" H 8600 5600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 8600 5600 50  0001 C CNN
	7    8600 5600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 1 1 5F3AB160
P 3950 4850
F 0 "U1" H 3950 5167 50  0000 C CNN
F 1 "74LS04" H 3950 5076 50  0000 C CNN
F 2 "" H 3950 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3950 4850 50  0001 C CNN
	1    3950 4850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 2 1 5F3AC87F
P 3700 4250
F 0 "U1" H 3700 4567 50  0000 C CNN
F 1 "74LS04" H 3700 4476 50  0000 C CNN
F 2 "" H 3700 4250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3700 4250 50  0001 C CNN
	2    3700 4250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10250 4300 10250 4400
Wire Wire Line
	10250 4400 10400 4400
Connection ~ 10250 4300
Wire Wire Line
	10400 3900 10350 3900
Wire Wire Line
	10350 3900 10350 4100
Wire Wire Line
	10350 4100 10400 4100
Text Label 3800 2950 0    50   ~ 0
reset
$Comp
L 74xx:74LS04 U1
U 3 1 5F4DC2DD
P 5550 2550
F 0 "U1" H 5550 2867 50  0000 C CNN
F 1 "74LS04" H 5550 2776 50  0000 C CNN
F 2 "" H 5550 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5550 2550 50  0001 C CNN
	3    5550 2550
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 4 1 5F4E2C67
P 2050 6150
F 0 "U1" H 2050 6467 50  0000 C CNN
F 1 "74LS04" H 2050 6376 50  0000 C CNN
F 2 "" H 2050 6150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2050 6150 50  0001 C CNN
	4    2050 6150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 5 1 5F4E3D9F
P 2950 6150
F 0 "U1" H 2950 6467 50  0000 C CNN
F 1 "74LS04" H 2950 6376 50  0000 C CNN
F 2 "" H 2950 6150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2950 6150 50  0001 C CNN
	5    2950 6150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 6 1 5F4E5021
P 3550 6150
F 0 "U1" H 3550 6467 50  0000 C CNN
F 1 "74LS04" H 3550 6376 50  0000 C CNN
F 2 "" H 3550 6150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3550 6150 50  0001 C CNN
	6    3550 6150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U4
U 1 1 5F4E65C4
P 4400 6150
F 0 "U4" H 4150 6650 50  0000 C CNN
F 1 "74LS74" H 4150 6550 50  0000 C CNN
F 2 "" H 4400 6150 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4400 6150 50  0001 C CNN
	1    4400 6150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U4
U 2 1 5F4E7A99
P 5300 6050
F 0 "U4" H 5000 6500 50  0000 C CNN
F 1 "74LS74" H 5000 6400 50  0000 C CNN
F 2 "" H 5300 6050 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5300 6050 50  0001 C CNN
	2    5300 6050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U4
U 3 1 5F4E90AF
P 9500 5600
F 0 "U4" H 9730 5646 50  0000 L CNN
F 1 "74LS74" H 9730 5555 50  0000 L CNN
F 2 "" H 9500 5600 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 9500 5600 50  0001 C CNN
	3    9500 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 5100 9500 5100
Wire Wire Line
	9500 5100 9500 5200
Wire Wire Line
	8600 6100 9500 6100
Wire Wire Line
	9500 6100 9500 6000
Wire Wire Line
	8600 5050 8600 5100
Connection ~ 8600 5100
Wire Wire Line
	8600 6150 8600 6100
Connection ~ 8600 6100
$Comp
L Device:R R8
U 1 1 5F503356
P 2000 6550
F 0 "R8" V 1793 6550 50  0000 C CNN
F 1 "330" V 1884 6550 50  0000 C CNN
F 2 "" V 1930 6550 50  0001 C CNN
F 3 "~" H 2000 6550 50  0001 C CNN
	1    2000 6550
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 5F506004
P 2900 6550
F 0 "R10" V 2693 6550 50  0000 C CNN
F 1 "330" V 2784 6550 50  0000 C CNN
F 2 "" V 2830 6550 50  0001 C CNN
F 3 "~" H 2900 6550 50  0001 C CNN
	1    2900 6550
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 5F509956
P 1750 7000
F 0 "C1" H 1865 7046 50  0000 L CNN
F 1 "22pF" H 1865 6955 50  0000 L CNN
F 2 "" H 1788 6850 50  0001 C CNN
F 3 "~" H 1750 7000 50  0001 C CNN
	1    1750 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5F508D27
P 2500 6150
F 0 "C7" V 2248 6150 50  0000 C CNN
F 1 "100nF" V 2339 6150 50  0000 C CNN
F 2 "" H 2538 6000 50  0001 C CNN
F 3 "~" H 2500 6150 50  0001 C CNN
	1    2500 6150
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 6150 1750 6550
Wire Wire Line
	1750 6550 1850 6550
Wire Wire Line
	2350 6150 2350 6550
Wire Wire Line
	2350 6550 2150 6550
Wire Wire Line
	2650 6150 2650 6550
Wire Wire Line
	2650 6550 2750 6550
Wire Wire Line
	3250 6150 3250 6550
Wire Wire Line
	3250 6550 3050 6550
Connection ~ 2350 6150
Connection ~ 2650 6150
Connection ~ 3250 6150
$Comp
L Device:Crystal Y1
U 1 1 5F52C12A
P 2500 6850
F 0 "Y1" H 2500 7118 50  0000 C CNN
F 1 "2.4576MHz" H 2500 7027 50  0000 C CNN
F 2 "" H 2500 6850 50  0001 C CNN
F 3 "~" H 2500 6850 50  0001 C CNN
	1    2500 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 6850 1750 6850
Wire Wire Line
	1750 6850 1750 6550
Connection ~ 1750 6550
Wire Wire Line
	2650 6850 3250 6850
Wire Wire Line
	3250 6850 3250 6550
Connection ~ 3250 6550
Connection ~ 1750 6850
Wire Wire Line
	3850 6150 4100 6150
Wire Wire Line
	4700 6050 4800 6050
$Comp
L power:+5V #PWR021
U 1 1 5F55DA82
P 4400 5850
F 0 "#PWR021" H 4400 5700 50  0001 C CNN
F 1 "+5V" H 4415 6023 50  0000 C CNN
F 2 "" H 4400 5850 50  0001 C CNN
F 3 "" H 4400 5850 50  0001 C CNN
	1    4400 5850
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR030
U 1 1 5F560FBB
P 5300 6350
F 0 "#PWR030" H 5300 6200 50  0001 C CNN
F 1 "+5V" H 5315 6523 50  0000 C CNN
F 2 "" H 5300 6350 50  0001 C CNN
F 3 "" H 5300 6350 50  0001 C CNN
	1    5300 6350
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR022
U 1 1 5F571ADF
P 4400 6450
F 0 "#PWR022" H 4400 6300 50  0001 C CNN
F 1 "+5V" H 4415 6623 50  0000 C CNN
F 2 "" H 4400 6450 50  0001 C CNN
F 3 "" H 4400 6450 50  0001 C CNN
	1    4400 6450
	1    0    0    1   
$EndComp
Wire Wire Line
	4100 6050 4000 6050
Wire Wire Line
	4000 6050 4000 6700
Wire Wire Line
	4700 6700 4700 6250
Wire Wire Line
	4000 6700 4700 6700
Wire Wire Line
	5000 5950 4900 5950
Wire Wire Line
	4900 5950 4900 6600
Wire Wire Line
	4900 6600 5600 6600
Wire Wire Line
	5600 6600 5600 6150
$Comp
L Device:CP C9
U 1 1 5F4D8A65
P 2250 2500
F 0 "C9" H 2368 2546 50  0000 L CNN
F 1 "10uF" H 2368 2455 50  0000 L CNN
F 2 "" H 2288 2350 50  0001 C CNN
F 3 "~" H 2250 2500 50  0001 C CNN
	1    2250 2500
	1    0    0    -1  
$EndComp
Connection ~ 2250 2350
Connection ~ 2250 2650
$Comp
L Device:C C10
U 1 1 5F4DA4A1
P 5900 3000
F 0 "C10" V 5648 3000 50  0000 C CNN
F 1 "10nF" V 5739 3000 50  0000 C CNN
F 2 "" H 5938 2850 50  0001 C CNN
F 3 "~" H 5900 3000 50  0001 C CNN
	1    5900 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 3000 5700 3000
Wire Wire Line
	5700 3000 5700 3050
Wire Wire Line
	5700 2950 5700 3000
Connection ~ 5700 3000
$Comp
L power:GND #PWR031
U 1 1 5F4F3667
P 6050 3000
F 0 "#PWR031" H 6050 2750 50  0001 C CNN
F 1 "GND" H 6055 2827 50  0000 C CNN
F 2 "" H 6050 3000 50  0001 C CNN
F 3 "" H 6050 3000 50  0001 C CNN
	1    6050 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6000 5950 5600 5950
Connection ~ 4800 6050
Wire Wire Line
	4800 6050 5000 6050
Wire Wire Line
	5200 4200 4800 4200
Wire Wire Line
	3650 4850 3300 4850
Wire Wire Line
	5200 4600 4500 4600
Wire Wire Line
	4500 4600 4500 4850
Wire Wire Line
	4500 4850 4250 4850
Wire Wire Line
	4800 4200 4800 5300
$Comp
L Connector_Generic:Conn_01x03 J6
U 1 1 5F652076
P 6800 5400
F 0 "J6" H 6880 5442 50  0000 L CNN
F 1 "baud rate" H 6880 5351 50  0000 L CNN
F 2 "" H 6800 5400 50  0001 C CNN
F 3 "~" H 6800 5400 50  0001 C CNN
	1    6800 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 5300 4800 5300
Connection ~ 4800 5300
Wire Wire Line
	4800 5300 4800 6050
Wire Wire Line
	6500 4000 6500 5400
Wire Wire Line
	6500 5400 6600 5400
Connection ~ 6500 4000
Wire Wire Line
	6600 5500 6000 5500
Wire Wire Line
	6000 5500 6000 5950
Text Notes 4850 5250 0    50   ~ 0
1.2288MHz
Text Notes 6050 5600 0    50   ~ 0
614.4kHz
Wire Wire Line
	4050 2550 4050 3100
Wire Wire Line
	4050 2550 4550 2550
Wire Wire Line
	3800 2350 4150 2350
NoConn ~ 3300 2950
$Comp
L Transistor_BJT:BC547 Q3
U 1 1 5F67ABA0
P 4550 3600
F 0 "Q3" H 4400 3450 50  0000 L CNN
F 1 "BC547" H 4350 3350 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4750 3525 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 4550 3600 50  0001 L CNN
	1    4550 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 4250 3400 4250
Wire Wire Line
	4150 2350 4150 4250
Wire Wire Line
	4150 4250 4000 4250
$Comp
L power:GND #PWR023
U 1 1 5F68A088
P 4650 3900
F 0 "#PWR023" H 4650 3650 50  0001 C CNN
F 1 "GND" H 4655 3727 50  0000 C CNN
F 2 "" H 4650 3900 50  0001 C CNN
F 3 "" H 4650 3900 50  0001 C CNN
	1    4650 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5F68B146
P 4650 3100
F 0 "R12" H 4720 3146 50  0000 L CNN
F 1 "10k" H 4720 3055 50  0000 L CNN
F 2 "" V 4580 3100 50  0001 C CNN
F 3 "~" H 4650 3100 50  0001 C CNN
	1    4650 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 5F68BEE3
P 4350 3300
F 0 "R11" H 4420 3346 50  0000 L CNN
F 1 "22k" H 4420 3255 50  0000 L CNN
F 2 "" V 4280 3300 50  0001 C CNN
F 3 "~" H 4350 3300 50  0001 C CNN
	1    4350 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 2950 4350 2950
Wire Wire Line
	4350 2950 4350 3150
Wire Wire Line
	4350 3450 4350 3600
Wire Wire Line
	4650 3250 4650 3350
Wire Wire Line
	4650 3800 4650 3900
$Comp
L power:+5V #PWR011
U 1 1 5F6A19E1
P 4650 2850
F 0 "#PWR011" H 4650 2700 50  0001 C CNN
F 1 "+5V" H 4665 3023 50  0000 C CNN
F 2 "" H 4650 2850 50  0001 C CNN
F 3 "" H 4650 2850 50  0001 C CNN
	1    4650 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2850 4650 2950
Wire Wire Line
	4650 3350 4900 3350
Wire Wire Line
	4900 3350 4900 4100
Connection ~ 4650 3350
Wire Wire Line
	4650 3350 4650 3400
Wire Wire Line
	5200 4100 4900 4100
$EndSCHEMATC
