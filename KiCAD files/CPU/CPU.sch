EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "CPU Card for Z80 Modular Computer"
Date ""
Rev ""
Comp ""
Comment1 "Z80 CPU + clock + reset"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CPU:Z80CPU U3
U 1 1 5DE101B7
P 9800 3600
F 0 "U3" H 9406 5281 50  0000 C CNN
F 1 "Z80CPU" H 9406 5190 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W25.4mm_Socket_LongPads" H 9800 4000 50  0001 C CNN
F 3 "www.zilog.com/manage_directlink.php?filepath=docs/z80/um0080" H 9800 4000 50  0001 C CNN
	1    9800 3600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J2
U 1 1 5DE110BD
P 2500 2200
F 0 "J2" H 2550 2617 50  0000 C CNN
F 1 "Power Bus" H 2550 2526 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 2500 2200 50  0001 C CNN
F 3 "~" H 2500 2200 50  0001 C CNN
	1    2500 2200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J1
U 1 1 5DE11A6D
P 1550 3950
F 0 "J1" H 1600 5067 50  0000 C CNN
F 1 "Signal Bus" H 1600 4976 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x20_P2.54mm_Vertical" H 1550 3950 50  0001 C CNN
F 3 "~" H 1550 3950 50  0001 C CNN
	1    1550 3950
	1    0    0    -1  
$EndComp
Text Label 2800 2000 0    50   ~ 0
gnd
Text Label 2800 2100 0    50   ~ 0
+5V
Text Label 2800 2200 0    50   ~ 0
+12V
Text Label 2800 2300 0    50   ~ 0
v1
Text Label 2800 2400 0    50   ~ 0
gnd
Text Label 2300 2000 2    50   ~ 0
gnd
Text Label 2300 2100 2    50   ~ 0
+5V
Text Label 2300 2200 2    50   ~ 0
+12V
Text Label 2300 2300 2    50   ~ 0
v1
Text Label 2300 2400 2    50   ~ 0
gnd
Text Label 1350 3050 2    50   ~ 0
a01
Text Label 1350 3150 2    50   ~ 0
a03
Text Label 1350 3250 2    50   ~ 0
a05
Text Label 1350 3350 2    50   ~ 0
a07
Text Label 1350 3450 2    50   ~ 0
a09
Text Label 1350 3550 2    50   ~ 0
a11
Text Label 1350 3650 2    50   ~ 0
a13
Text Label 1350 3750 2    50   ~ 0
a15
Text Label 1350 3850 2    50   ~ 0
d01
Text Label 1350 3950 2    50   ~ 0
d03
Text Label 1350 4050 2    50   ~ 0
d05
Text Label 1350 4150 2    50   ~ 0
d07
Text Label 1350 4250 2    50   ~ 0
wr
Text Label 1350 4350 2    50   ~ 0
rd
Text Label 1350 4450 2    50   ~ 0
busack
Text Label 1350 4550 2    50   ~ 0
halt
Text Label 1350 4650 2    50   ~ 0
int
Text Label 1350 4750 2    50   ~ 0
s1
Text Label 1350 4850 2    50   ~ 0
m1
Text Label 1350 4950 2    50   ~ 0
clk
Text Label 1850 3050 0    50   ~ 0
a00
Text Label 1850 3150 0    50   ~ 0
a02
Text Label 1850 3250 0    50   ~ 0
a04
Text Label 1850 3350 0    50   ~ 0
a06
Text Label 1850 3450 0    50   ~ 0
a08
Text Label 1850 3550 0    50   ~ 0
a10
Text Label 1850 3650 0    50   ~ 0
a12
Text Label 1850 3750 0    50   ~ 0
a14
Text Label 1850 3850 0    50   ~ 0
d00
Text Label 1850 3950 0    50   ~ 0
d02
Text Label 1850 4050 0    50   ~ 0
d04
Text Label 1850 4150 0    50   ~ 0
d06
Text Label 1850 4250 0    50   ~ 0
mreq
Text Label 1850 4350 0    50   ~ 0
iorq
Text Label 1850 4450 0    50   ~ 0
busrq
Text Label 1850 4550 0    50   ~ 0
wait
Text Label 1850 4650 0    50   ~ 0
nmi
Text Label 1850 4750 0    50   ~ 0
s0
Text Label 1850 4850 0    50   ~ 0
rfsh
Text Label 1850 4950 0    50   ~ 0
reset
Text Label 10500 2400 0    50   ~ 0
a00
Text Label 10500 2500 0    50   ~ 0
a01
Text Label 10500 2600 0    50   ~ 0
a02
Text Label 10500 2700 0    50   ~ 0
a03
Text Label 10500 2800 0    50   ~ 0
a04
Text Label 10500 2900 0    50   ~ 0
a05
Text Label 10500 3000 0    50   ~ 0
a06
Text Label 10500 3100 0    50   ~ 0
a07
Text Label 10500 3200 0    50   ~ 0
a08
Text Label 10500 3300 0    50   ~ 0
a09
Text Label 10500 3400 0    50   ~ 0
a10
Text Label 10500 3500 0    50   ~ 0
a11
Text Label 10500 3600 0    50   ~ 0
a12
Text Label 10500 3700 0    50   ~ 0
a13
Text Label 10500 3800 0    50   ~ 0
a14
Text Label 10500 3900 0    50   ~ 0
a15
Text Label 10500 4100 0    50   ~ 0
d00
Text Label 10500 4200 0    50   ~ 0
d01
Text Label 10500 4300 0    50   ~ 0
d02
Text Label 10500 4400 0    50   ~ 0
d03
Text Label 10500 4500 0    50   ~ 0
d04
Text Label 10500 4600 0    50   ~ 0
d05
Text Label 10500 4700 0    50   ~ 0
d06
Text Label 10500 4800 0    50   ~ 0
d07
Text Label 9100 3000 2    50   ~ 0
nmi
Text Label 9100 3100 2    50   ~ 0
int
Text Label 9100 3600 2    50   ~ 0
wait
Text Label 9100 3700 2    50   ~ 0
halt
Text Label 9100 4700 2    50   ~ 0
busrq
Text Label 9100 4800 2    50   ~ 0
busack
$Comp
L power:GND #PWR032
U 1 1 5E3474E1
P 9800 5100
F 0 "#PWR032" H 9800 4850 50  0001 C CNN
F 1 "GND" H 9805 4927 50  0000 C CNN
F 2 "" H 9800 5100 50  0001 C CNN
F 3 "" H 9800 5100 50  0001 C CNN
	1    9800 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR031
U 1 1 5E347F82
P 9800 2100
F 0 "#PWR031" H 9800 1950 50  0001 C CNN
F 1 "+5V" H 9815 2273 50  0000 C CNN
F 2 "" H 9800 2100 50  0001 C CNN
F 3 "" H 9800 2100 50  0001 C CNN
	1    9800 2100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 5E34AA96
P 3300 1800
F 0 "#PWR011" H 3300 1650 50  0001 C CNN
F 1 "+5V" H 3315 1973 50  0000 C CNN
F 2 "" H 3300 1800 50  0001 C CNN
F 3 "" H 3300 1800 50  0001 C CNN
	1    3300 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5E34BF5A
P 3300 2500
F 0 "#PWR012" H 3300 2250 50  0001 C CNN
F 1 "GND" H 3305 2327 50  0000 C CNN
F 2 "" H 3300 2500 50  0001 C CNN
F 3 "" H 3300 2500 50  0001 C CNN
	1    3300 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2500 3300 2400
Wire Wire Line
	3300 2400 2800 2400
Wire Wire Line
	3300 1800 3300 2100
Wire Wire Line
	3300 2100 2800 2100
NoConn ~ 1350 4750
NoConn ~ 1850 4750
$Comp
L 74xx:74LS00 U1
U 1 1 5E3503C0
P 4950 2650
F 0 "U1" H 4950 2975 50  0000 C CNN
F 1 "74LS00" H 4950 2884 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 4950 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 4950 2650 50  0001 C CNN
	1    4950 2650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U1
U 2 1 5E351A86
P 5850 2550
F 0 "U1" H 5850 2875 50  0000 C CNN
F 1 "74LS00" H 5850 2784 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 5850 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 5850 2550 50  0001 C CNN
	2    5850 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5E354E74
P 5850 3000
F 0 "R2" V 6057 3000 50  0000 C CNN
F 1 "330R" V 5966 3000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5780 3000 50  0001 C CNN
F 3 "~" H 5850 3000 50  0001 C CNN
	1    5850 3000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5E3559CA
P 4900 3100
F 0 "R1" V 5107 3100 50  0000 C CNN
F 1 "330R" V 5016 3100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4830 3100 50  0001 C CNN
F 3 "~" H 4900 3100 50  0001 C CNN
	1    4900 3100
	0    -1   -1   0   
$EndComp
$Comp
L Device:Crystal_Small Y1
U 1 1 5E35DD18
P 5400 3350
F 0 "Y1" H 5400 3550 50  0000 C CNN
F 1 "4MHz" H 5400 3450 50  0000 C CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 5400 3350 50  0001 C CNN
F 3 "~" H 5400 3350 50  0001 C CNN
	1    5400 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5E35F358
P 4650 3650
F 0 "C5" H 4765 3696 50  0000 L CNN
F 1 "22p" H 4765 3605 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 4688 3500 50  0001 C CNN
F 3 "~" H 4650 3650 50  0001 C CNN
	1    4650 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5E365D8F
P 4650 3800
F 0 "#PWR017" H 4650 3550 50  0001 C CNN
F 1 "GND" H 4655 3627 50  0000 C CNN
F 2 "" H 4650 3800 50  0001 C CNN
F 3 "" H 4650 3800 50  0001 C CNN
	1    4650 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5E399443
P 7300 1750
F 0 "R5" H 7370 1796 50  0000 L CNN
F 1 "10k" H 7370 1705 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7230 1750 50  0001 C CNN
F 3 "~" H 7300 1750 50  0001 C CNN
	1    7300 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5E399F34
P 7050 1500
F 0 "R4" V 7257 1500 50  0000 C CNN
F 1 "100" V 7166 1500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6980 1500 50  0001 C CNN
F 3 "~" H 7050 1500 50  0001 C CNN
	1    7050 1500
	0    -1   -1   0   
$EndComp
$Comp
L Diode:1N4148 D2
U 1 1 5E39EA66
P 7600 1750
F 0 "D2" V 7554 1829 50  0000 L CNN
F 1 "1N4148" V 7645 1829 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7600 1575 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/d-sheet/1N4148_1N4448.pdf" H 7600 1750 50  0001 C CNN
	1    7600 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	7200 1500 7300 1500
Connection ~ 7300 1500
$Comp
L power:+5V #PWR023
U 1 1 5E3A301B
P 7300 1100
F 0 "#PWR023" H 7300 950 50  0001 C CNN
F 1 "+5V" H 7315 1273 50  0000 C CNN
F 2 "" H 7300 1100 50  0001 C CNN
F 3 "" H 7300 1100 50  0001 C CNN
	1    7300 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 5E3A564C
P 7300 2000
F 0 "#PWR024" H 7300 1750 50  0001 C CNN
F 1 "GND" H 7305 1827 50  0000 C CNN
F 2 "" H 7300 2000 50  0001 C CNN
F 3 "" H 7300 2000 50  0001 C CNN
	1    7300 2000
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5E3C8BDE
P 1550 1200
F 0 "#FLG01" H 1550 1275 50  0001 C CNN
F 1 "PWR_FLAG" H 1550 1373 50  0000 C CNN
F 2 "" H 1550 1200 50  0001 C CNN
F 3 "~" H 1550 1200 50  0001 C CNN
	1    1550 1200
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5E3C9F2A
P 2500 1200
F 0 "#FLG02" H 2500 1275 50  0001 C CNN
F 1 "PWR_FLAG" H 2500 1373 50  0000 C CNN
F 2 "" H 2500 1200 50  0001 C CNN
F 3 "~" H 2500 1200 50  0001 C CNN
	1    2500 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5E3CA8BD
P 2500 1300
F 0 "#PWR09" H 2500 1050 50  0001 C CNN
F 1 "GND" H 2505 1127 50  0000 C CNN
F 2 "" H 2500 1300 50  0001 C CNN
F 3 "" H 2500 1300 50  0001 C CNN
	1    2500 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 5E3CB5D9
P 1850 1200
F 0 "#PWR03" H 1850 1050 50  0001 C CNN
F 1 "+5V" H 1865 1373 50  0000 C CNN
F 2 "" H 1850 1200 50  0001 C CNN
F 3 "" H 1850 1200 50  0001 C CNN
	1    1850 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1200 1550 1350
Wire Wire Line
	1550 1350 1850 1350
Wire Wire Line
	1850 1350 1850 1200
Wire Wire Line
	2500 1200 2500 1300
$Comp
L power:GND #PWR02
U 1 1 5E3D7E97
P 1700 6750
F 0 "#PWR02" H 1700 6500 50  0001 C CNN
F 1 "GND" H 1705 6577 50  0000 C CNN
F 2 "" H 1700 6750 50  0001 C CNN
F 3 "" H 1700 6750 50  0001 C CNN
	1    1700 6750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U2
U 1 1 5E5A7BF0
P 7500 3400
F 0 "U2" H 7250 3800 50  0000 C CNN
F 1 "74LS74" H 7250 3700 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 7500 3400 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7500 3400 50  0001 C CNN
	1    7500 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 3400 7200 3400
Wire Wire Line
	7200 3300 7100 3300
Wire Wire Line
	7100 3300 7100 3900
Wire Wire Line
	7100 3900 7800 3900
Wire Wire Line
	7800 3900 7800 3500
$Comp
L power:+5V #PWR025
U 1 1 5E5B027D
P 7500 3100
F 0 "#PWR025" H 7500 2950 50  0001 C CNN
F 1 "+5V" H 7600 3200 50  0000 C CNN
F 2 "" H 7500 3100 50  0001 C CNN
F 3 "" H 7500 3100 50  0001 C CNN
	1    7500 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR026
U 1 1 5E5B0DC3
P 7500 3700
F 0 "#PWR026" H 7500 3550 50  0001 C CNN
F 1 "+5V" V 7515 3873 50  0000 C CNN
F 2 "" H 7500 3700 50  0001 C CNN
F 3 "" H 7500 3700 50  0001 C CNN
	1    7500 3700
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS74 U2
U 2 1 5E632ACD
P 8250 3400
F 0 "U2" H 8000 3800 50  0000 C CNN
F 1 "74LS74" H 8000 3700 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 8250 3400 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 8250 3400 50  0001 C CNN
	2    8250 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 3300 7800 3400
Wire Wire Line
	7800 3400 7950 3400
Wire Wire Line
	7950 3300 7900 3300
Wire Wire Line
	7900 3300 7900 3900
Wire Wire Line
	7900 3900 8550 3900
Wire Wire Line
	8550 3900 8550 3500
$Comp
L power:+5V #PWR029
U 1 1 5E639152
P 8250 3100
F 0 "#PWR029" H 8250 2950 50  0001 C CNN
F 1 "+5V" H 8350 3200 50  0000 C CNN
F 2 "" H 8250 3100 50  0001 C CNN
F 3 "" H 8250 3100 50  0001 C CNN
	1    8250 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR030
U 1 1 5E639CC5
P 8250 3700
F 0 "#PWR030" H 8250 3550 50  0001 C CNN
F 1 "+5V" V 8265 3828 50  0000 L CNN
F 2 "" H 8250 3700 50  0001 C CNN
F 3 "" H 8250 3700 50  0001 C CNN
	1    8250 3700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7150 2550 7150 2900
Wire Wire Line
	7150 2900 7800 2900
Wire Wire Line
	7800 2900 7800 3300
Connection ~ 7800 3300
Wire Wire Line
	7300 2650 7300 2800
Wire Wire Line
	7300 2800 8550 2800
Wire Wire Line
	8550 2800 8550 3300
Wire Wire Line
	8050 2450 8050 2550
Wire Wire Line
	8050 2550 8050 2650
Connection ~ 8050 2550
Wire Wire Line
	9100 2550 9100 2700
Wire Wire Line
	7000 3400 7000 2450
$Comp
L 74xx:74LS00 U1
U 5 1 5E65AC95
P 3300 6600
F 0 "U1" H 3530 6646 50  0000 L CNN
F 1 "74LS00" H 3530 6555 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 3300 6600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 3300 6600 50  0001 C CNN
	5    3300 6600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U2
U 3 1 5E65DE93
P 4200 6600
F 0 "U2" H 4430 6646 50  0000 L CNN
F 1 "74LS74" H 4430 6555 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 4200 6600 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4200 6600 50  0001 C CNN
	3    4200 6600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR015
U 1 1 5E670778
P 4200 6100
F 0 "#PWR015" H 4200 5950 50  0001 C CNN
F 1 "+5V" H 4215 6273 50  0000 C CNN
F 2 "" H 4200 6100 50  0001 C CNN
F 3 "" H 4200 6100 50  0001 C CNN
	1    4200 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5E67141E
P 4200 7100
F 0 "#PWR016" H 4200 6850 50  0001 C CNN
F 1 "GND" H 4205 6927 50  0000 C CNN
F 2 "" H 4200 7100 50  0001 C CNN
F 3 "" H 4200 7100 50  0001 C CNN
	1    4200 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 4450 2400 4450
Wire Wire Line
	2400 4300 2400 4450
$Comp
L power:+5V #PWR06
U 1 1 5E6F3954
P 2400 3900
F 0 "#PWR06" H 2400 3750 50  0001 C CNN
F 1 "+5V" H 2415 4073 50  0000 C CNN
F 2 "" H 2400 3900 50  0001 C CNN
F 3 "" H 2400 3900 50  0001 C CNN
	1    2400 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 4650 2600 4650
Wire Wire Line
	1850 4550 2500 4550
$Comp
L Device:C C6
U 1 1 5E35E6E4
P 5400 2650
F 0 "C6" V 5650 2600 50  0000 L CNN
F 1 "100n" V 5550 2550 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 5438 2500 50  0001 C CNN
F 3 "~" H 5400 2650 50  0001 C CNN
	1    5400 2650
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS00 U1
U 3 1 5E80D8F7
P 6700 2450
F 0 "U1" H 6700 2775 50  0000 C CNN
F 1 "74LS00" H 6700 2684 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 6700 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 6700 2450 50  0001 C CNN
	3    6700 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3500 4650 3350
Wire Wire Line
	4750 3100 4650 3100
Connection ~ 4650 3100
Wire Wire Line
	4650 3100 4650 2750
Wire Wire Line
	5050 3100 5250 3100
Wire Wire Line
	5250 3100 5250 2650
Connection ~ 5250 2650
Wire Wire Line
	5700 3000 5550 3000
Wire Wire Line
	5550 3000 5550 2650
Connection ~ 5550 2650
Wire Wire Line
	6150 2550 6150 3000
Wire Wire Line
	6150 3000 6000 3000
Wire Wire Line
	6150 2550 6400 2550
Connection ~ 6150 2550
Wire Wire Line
	5300 3350 4650 3350
Connection ~ 4650 3350
Wire Wire Line
	4650 3350 4650 3100
Wire Wire Line
	5500 3350 6150 3350
Wire Wire Line
	6150 3350 6150 3000
Connection ~ 6150 3000
Connection ~ 7000 2450
Text Notes 7450 2450 0    50   ~ 0
f
Text Notes 7400 2550 0    50   ~ 0
f/2
Text Notes 7400 2650 0    50   ~ 0
f/4
Wire Wire Line
	900  5100 900  4650
Wire Wire Line
	900  4650 1350 4650
Text Label 9100 4100 2    50   ~ 0
rd
Text Label 9100 4200 2    50   ~ 0
wr
Text Label 9100 4300 2    50   ~ 0
mreq
Text Label 9100 2700 2    50   ~ 0
clk
Text Label 9100 2400 2    50   ~ 0
reset
Text Label 9100 4400 2    50   ~ 0
iorq
Wire Wire Line
	8050 2550 9100 2550
Wire Wire Line
	7000 2450 7550 2450
Wire Wire Line
	7150 2550 7550 2550
Wire Wire Line
	7550 2650 7300 2650
Text Label 9100 3400 2    50   ~ 0
m1
Text Label 9100 3500 2    50   ~ 0
rfsh
Wire Wire Line
	6400 2350 6400 2550
Connection ~ 6400 2550
Wire Wire Line
	5550 2450 5550 2650
Wire Wire Line
	4650 2550 4650 2750
Connection ~ 4650 2750
$Comp
L Device:CP C4
U 1 1 5EFE3FDA
P 3300 2250
F 0 "C4" H 3418 2296 50  0000 L CNN
F 1 "10uF" H 3418 2205 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 3338 2100 50  0001 C CNN
F 3 "~" H 3300 2250 50  0001 C CNN
	1    3300 2250
	1    0    0    -1  
$EndComp
Connection ~ 3300 2100
Connection ~ 3300 2400
$Comp
L Transistor_BJT:BC328 Q1
U 1 1 5F30EBE9
P 7950 4700
F 0 "Q1" H 8141 4654 50  0000 L CNN
F 1 "BC328" H 8141 4745 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8150 4625 50  0001 L CIN
F 3 "http://www.redrok.com/PNP_BC327_-45V_-800mA_0.625W_Hfe100_TO-92.pdf" H 7950 4700 50  0001 L CNN
	1    7950 4700
	-1   0    0    1   
$EndComp
$Comp
L Device:R R6
U 1 1 5F316219
P 7850 5050
F 0 "R6" H 7920 5096 50  0000 L CNN
F 1 "270" H 7920 5005 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7780 5050 50  0001 C CNN
F 3 "~" H 7850 5050 50  0001 C CNN
	1    7850 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 5F31708F
P 7850 5350
F 0 "D3" V 7900 5500 50  0000 C CNN
F 1 "LED" V 7800 5500 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 7850 5350 50  0001 C CNN
F 3 "~" H 7850 5350 50  0001 C CNN
	1    7850 5350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 5F318E5E
P 8300 4700
F 0 "R7" V 8500 4650 50  0000 L CNN
F 1 "3.3k" V 8400 4650 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8230 4700 50  0001 C CNN
F 3 "~" H 8300 4700 50  0001 C CNN
	1    8300 4700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR028
U 1 1 5F3288C7
P 7850 5600
F 0 "#PWR028" H 7850 5350 50  0001 C CNN
F 1 "GND" H 7855 5427 50  0000 C CNN
F 2 "" H 7850 5600 50  0001 C CNN
F 3 "" H 7850 5600 50  0001 C CNN
	1    7850 5600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR027
U 1 1 5F32B519
P 7850 4400
F 0 "#PWR027" H 7850 4250 50  0001 C CNN
F 1 "+5V" H 7865 4573 50  0000 C CNN
F 2 "" H 7850 4400 50  0001 C CNN
F 3 "" H 7850 4400 50  0001 C CNN
	1    7850 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 4400 7850 4500
Wire Wire Line
	7850 5500 7850 5600
Wire Wire Line
	9100 3700 8650 3700
Wire Wire Line
	8650 3700 8650 4700
Text Notes 8000 5400 0    50   ~ 0
CPU halted
$Comp
L 74xx:74LS00 U1
U 4 1 5F33B6E6
P 8250 1500
F 0 "U1" H 8250 1825 50  0000 C CNN
F 1 "74LS00" H 8250 1734 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 8250 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 8250 1500 50  0001 C CNN
	4    8250 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 1400 7950 1500
Connection ~ 7950 1500
Wire Wire Line
	7950 1500 7950 1600
Wire Wire Line
	8750 2400 9100 2400
Wire Wire Line
	7300 1500 7300 1600
Wire Wire Line
	7300 1500 7600 1500
Wire Wire Line
	7600 1600 7600 1500
Connection ~ 7600 1500
Wire Wire Line
	7600 1500 7950 1500
Wire Wire Line
	7300 1400 7300 1500
Wire Wire Line
	7300 1950 7600 1950
Wire Wire Line
	7600 1950 7600 1900
Wire Wire Line
	7300 1900 7300 1950
Wire Wire Line
	7300 2000 7300 1950
Connection ~ 7300 1950
Wire Wire Line
	8550 1500 8750 1500
Wire Wire Line
	8750 1500 8750 2400
$Comp
L Device:CP C7
U 1 1 5F38F7A8
P 7300 1250
F 0 "C7" H 7418 1296 50  0000 L CNN
F 1 "10uF" H 7418 1205 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 7338 1100 50  0001 C CNN
F 3 "~" H 7300 1250 50  0001 C CNN
	1    7300 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 60CBC165
P 6500 5200
F 0 "D1" V 6550 5350 50  0000 C CNN
F 1 "LED" V 6450 5350 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 6500 5200 50  0001 C CNN
F 3 "~" H 6500 5200 50  0001 C CNN
	1    6500 5200
	0    -1   -1   0   
$EndComp
Text Notes 6650 5250 0    50   ~ 0
Power On
$Comp
L power:GND #PWR022
U 1 1 60CBEDD9
P 6500 5450
F 0 "#PWR022" H 6500 5200 50  0001 C CNN
F 1 "GND" H 6505 5277 50  0000 C CNN
F 2 "" H 6500 5450 50  0001 C CNN
F 3 "" H 6500 5450 50  0001 C CNN
	1    6500 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 5450 6500 5350
$Comp
L Device:R R3
U 1 1 60CC4F5F
P 6500 4900
F 0 "R3" H 6570 4946 50  0000 L CNN
F 1 "270" H 6570 4855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6430 4900 50  0001 C CNN
F 3 "~" H 6500 4900 50  0001 C CNN
	1    6500 4900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR021
U 1 1 60CC8077
P 6500 4750
F 0 "#PWR021" H 6500 4600 50  0001 C CNN
F 1 "+5V" H 6515 4923 50  0000 C CNN
F 2 "" H 6500 4750 50  0001 C CNN
F 3 "" H 6500 4750 50  0001 C CNN
	1    6500 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 4700 8450 4700
$Comp
L power:GND #PWR010
U 1 1 60D5D5B7
P 3200 5250
F 0 "#PWR010" H 3200 5000 50  0001 C CNN
F 1 "GND" H 3205 5077 50  0000 C CNN
F 2 "" H 3200 5250 50  0001 C CNN
F 3 "" H 3200 5250 50  0001 C CNN
	1    3200 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 60D80A86
P 5450 6700
F 0 "#PWR019" H 5450 6450 50  0001 C CNN
F 1 "GND" H 5455 6527 50  0000 C CNN
F 2 "" H 5450 6700 50  0001 C CNN
F 3 "" H 5450 6700 50  0001 C CNN
	1    5450 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR018
U 1 1 60D83962
P 5450 6400
F 0 "#PWR018" H 5450 6250 50  0001 C CNN
F 1 "+5V" H 5465 6573 50  0000 C CNN
F 2 "" H 5450 6400 50  0001 C CNN
F 3 "" H 5450 6400 50  0001 C CNN
	1    5450 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 6500 5450 6500
Wire Wire Line
	5450 6500 5450 6400
Wire Wire Line
	5600 6600 5450 6600
Wire Wire Line
	5450 6600 5450 6700
$Comp
L Connector_Generic:Conn_02x01 J5
U 1 1 60DA7471
P 6600 1500
F 0 "J5" H 6650 1717 50  0000 C CNN
F 1 "Reset" H 6650 1626 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Vertical" H 6600 1500 50  0001 C CNN
F 3 "~" H 6600 1500 50  0001 C CNN
	1    6600 1500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x01 J3
U 1 1 60DA8272
P 2900 5100
F 0 "J3" H 2950 5317 50  0000 C CNN
F 1 "INT" H 2950 5226 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Vertical" H 2900 5100 50  0001 C CNN
F 3 "~" H 2900 5100 50  0001 C CNN
	1    2900 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 5100 3200 5250
Text Notes 3150 4950 0    50   ~ 0
Connects to a\npushbutton on\nthe front panel
Text Notes 5900 1350 0    50   ~ 0
Connects to a\npushbutton on\nthe front panel
$Comp
L Device:R_Network04 RN1
U 1 1 60E51537
P 2600 4100
F 0 "RN1" H 2788 4146 50  0000 L CNN
F 1 "4x10k" H 2788 4055 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP5" V 2875 4100 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 2600 4100 50  0001 C CNN
	1    2600 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4300 2500 4550
Wire Wire Line
	2600 4300 2600 4650
Wire Wire Line
	2700 5100 900  5100
Wire Wire Line
	2700 4300 2700 5100
Connection ~ 2700 5100
$Comp
L Device:C C1
U 1 1 60EE2AA3
P 1700 6600
F 0 "C1" H 1815 6646 50  0000 L CNN
F 1 "10n" H 1815 6555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 1738 6450 50  0001 C CNN
F 3 "~" H 1700 6600 50  0001 C CNN
	1    1700 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 60EE3893
P 2050 6600
F 0 "C2" H 2165 6646 50  0000 L CNN
F 1 "10n" H 2165 6555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 2088 6450 50  0001 C CNN
F 3 "~" H 2050 6600 50  0001 C CNN
	1    2050 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 60EE41B7
P 2400 6600
F 0 "C3" H 2515 6646 50  0000 L CNN
F 1 "10n" H 2515 6555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 2438 6450 50  0001 C CNN
F 3 "~" H 2400 6600 50  0001 C CNN
	1    2400 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 60EE86BD
P 2050 6750
F 0 "#PWR05" H 2050 6500 50  0001 C CNN
F 1 "GND" H 2055 6577 50  0000 C CNN
F 2 "" H 2050 6750 50  0001 C CNN
F 3 "" H 2050 6750 50  0001 C CNN
	1    2050 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 60EEAD3A
P 2400 6750
F 0 "#PWR08" H 2400 6500 50  0001 C CNN
F 1 "GND" H 2405 6577 50  0000 C CNN
F 2 "" H 2400 6750 50  0001 C CNN
F 3 "" H 2400 6750 50  0001 C CNN
	1    2400 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 60EED5C6
P 3300 7100
F 0 "#PWR014" H 3300 6850 50  0001 C CNN
F 1 "GND" H 3305 6927 50  0000 C CNN
F 2 "" H 3300 7100 50  0001 C CNN
F 3 "" H 3300 7100 50  0001 C CNN
	1    3300 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 60EF2228
P 3300 6100
F 0 "#PWR013" H 3300 5950 50  0001 C CNN
F 1 "+5V" H 3315 6273 50  0000 C CNN
F 2 "" H 3300 6100 50  0001 C CNN
F 3 "" H 3300 6100 50  0001 C CNN
	1    3300 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 60EF48F0
P 2400 6450
F 0 "#PWR07" H 2400 6300 50  0001 C CNN
F 1 "+5V" H 2415 6623 50  0000 C CNN
F 2 "" H 2400 6450 50  0001 C CNN
F 3 "" H 2400 6450 50  0001 C CNN
	1    2400 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 60EF6E12
P 2050 6450
F 0 "#PWR04" H 2050 6300 50  0001 C CNN
F 1 "+5V" H 2065 6623 50  0000 C CNN
F 2 "" H 2050 6450 50  0001 C CNN
F 3 "" H 2050 6450 50  0001 C CNN
	1    2050 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 60EF953C
P 1700 6450
F 0 "#PWR01" H 1700 6300 50  0001 C CNN
F 1 "+5V" H 1715 6623 50  0000 C CNN
F 2 "" H 1700 6450 50  0001 C CNN
F 3 "" H 1700 6450 50  0001 C CNN
	1    1700 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 6100 4200 6200
Wire Wire Line
	4200 7000 4200 7100
$Comp
L power:+5V #PWR020
U 1 1 60D62CAC
P 6400 1500
F 0 "#PWR020" H 6400 1350 50  0001 C CNN
F 1 "+5V" V 6415 1673 50  0000 C CNN
F 2 "" H 6400 1500 50  0001 C CNN
F 3 "" H 6400 1500 50  0001 C CNN
	1    6400 1500
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_02x02_Odd_Even J4
U 1 1 60E17A37
P 5800 6500
F 0 "J4" H 5850 6717 50  0000 C CNN
F 1 "EXT RESET/INT" H 5850 6626 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Vertical" H 5800 6500 50  0001 C CNN
F 3 "~" H 5800 6500 50  0001 C CNN
	1    5800 6500
	1    0    0    -1  
$EndComp
Text Label 6100 6500 0    50   ~ 0
reset
Text Label 6100 6600 0    50   ~ 0
int
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J6
U 1 1 60D99554
P 7750 2550
F 0 "J6" H 7800 2867 50  0000 C CNN
F 1 "clock selector" H 7800 2776 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 7750 2550 50  0001 C CNN
F 3 "~" H 7750 2550 50  0001 C CNN
	1    7750 2550
	1    0    0    -1  
$EndComp
$EndSCHEMATC
