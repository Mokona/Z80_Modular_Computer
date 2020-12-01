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
L Interface_UART:MAX232 U5
U 1 1 5E8B66FC
P 5950 3500
F 0 "U5" H 5600 4700 50  0000 C CNN
F 1 "MAX232" H 5600 4600 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 6000 2450 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/max232.pdf" H 5950 3600 50  0001 C CNN
	1    5950 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C4
U 1 1 5EA61F2B
P 6750 2750
F 0 "C4" H 6868 2796 50  0000 L CNN
F 1 "1uF" H 6868 2705 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D7.5mm_P2.50mm" H 6788 2600 50  0001 C CNN
F 3 "~" H 6750 2750 50  0001 C CNN
	1    6750 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 5EA62D6B
P 5150 2750
F 0 "C2" H 4900 2850 50  0000 L CNN
F 1 "1uF" H 4900 2750 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D7.5mm_P2.50mm" H 5188 2600 50  0001 C CNN
F 3 "~" H 5150 2750 50  0001 C CNN
	1    5150 2750
	1    0    0    -1  
$EndComp
$Comp
L Connector:DB9_Male J4
U 1 1 5E8B7530
P 8250 4200
F 0 "J4" H 8430 4246 50  0000 L CNN
F 1 "RS232" H 8430 4155 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Male_Horizontal_P2.77x2.54mm_EdgePinOffset9.40mm" H 8250 4200 50  0001 C CNN
F 3 " ~" H 8250 4200 50  0001 C CNN
	1    8250 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C5
U 1 1 5EA60659
P 7100 3100
F 0 "C5" V 7250 3150 50  0000 C CNN
F 1 "1uF" V 7250 3000 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D7.5mm_P2.50mm" H 7138 2950 50  0001 C CNN
F 3 "~" H 7100 3100 50  0001 C CNN
	1    7100 3100
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP C6
U 1 1 5EA6122F
P 7100 3400
F 0 "C6" V 6950 3350 50  0000 C CNN
F 1 "1uF" V 6950 3500 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D7.5mm_P2.50mm" H 7138 3250 50  0001 C CNN
F 3 "~" H 7100 3400 50  0001 C CNN
	1    7100 3400
	0    1    1    0   
$EndComp
$Comp
L Device:CP C3
U 1 1 5EA72344
P 6250 2150
F 0 "C3" V 6400 2300 50  0000 C CNN
F 1 "1uF" V 6400 2050 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D7.5mm_P2.50mm" H 6288 2000 50  0001 C CNN
F 3 "~" H 6250 2150 50  0001 C CNN
	1    6250 2150
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5EA7906F
P 6650 2150
F 0 "#PWR026" H 6650 1900 50  0001 C CNN
F 1 "GND" V 6655 2022 50  0000 R CNN
F 2 "" H 6650 2150 50  0001 C CNN
F 3 "" H 6650 2150 50  0001 C CNN
	1    6650 2150
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR028
U 1 1 5EA79CB0
P 7400 3400
F 0 "#PWR028" H 7400 3150 50  0001 C CNN
F 1 "GND" V 7405 3272 50  0000 R CNN
F 2 "" H 7400 3400 50  0001 C CNN
F 3 "" H 7400 3400 50  0001 C CNN
	1    7400 3400
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR024
U 1 1 5EA7AFE0
P 5950 2000
F 0 "#PWR024" H 5950 1850 50  0001 C CNN
F 1 "+5V" H 5965 2173 50  0000 C CNN
F 2 "" H 5950 2000 50  0001 C CNN
F 3 "" H 5950 2000 50  0001 C CNN
	1    5950 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR027
U 1 1 5EA7BEDF
P 7400 2950
F 0 "#PWR027" H 7400 2800 50  0001 C CNN
F 1 "+5V" H 7415 3123 50  0000 C CNN
F 2 "" H 7400 2950 50  0001 C CNN
F 3 "" H 7400 2950 50  0001 C CNN
	1    7400 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 2000 5950 2150
Wire Wire Line
	6100 2150 5950 2150
Connection ~ 5950 2150
Wire Wire Line
	5950 2150 5950 2300
Wire Wire Line
	6750 3100 6950 3100
Wire Wire Line
	6750 3400 6950 3400
Wire Wire Line
	7250 3100 7400 3100
Wire Wire Line
	7400 3100 7400 2950
Wire Wire Line
	7400 3400 7250 3400
Wire Wire Line
	6650 2150 6400 2150
$Comp
L power:GND #PWR025
U 1 1 5EA9D943
P 5950 4700
F 0 "#PWR025" H 5950 4450 50  0001 C CNN
F 1 "GND" H 5955 4527 50  0000 C CNN
F 2 "" H 5950 4700 50  0001 C CNN
F 3 "" H 5950 4700 50  0001 C CNN
	1    5950 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 5EAA4037
P 7950 3800
F 0 "#PWR029" H 7950 3550 50  0001 C CNN
F 1 "GND" V 7955 3672 50  0000 R CNN
F 2 "" H 7950 3800 50  0001 C CNN
F 3 "" H 7950 3800 50  0001 C CNN
	1    7950 3800
	0    1    1    0   
$EndComp
NoConn ~ 13250 1100
NoConn ~ 7950 3900
Wire Wire Line
	7950 4200 7550 4200
Wire Wire Line
	7550 4200 7550 3600
Wire Wire Line
	7550 3600 6750 3600
Wire Wire Line
	7950 4400 7250 4400
Wire Wire Line
	7250 4400 7250 4000
Wire Wire Line
	7250 4000 6750 4000
NoConn ~ 5150 3800
NoConn ~ 5150 4200
NoConn ~ 6750 4200
NoConn ~ 6750 3800
NoConn ~ 7950 4000
NoConn ~ 7950 4100
NoConn ~ 7950 4300
NoConn ~ 7950 4500
NoConn ~ 7950 4600
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5FC733E2
P 3850 4100
F 0 "A1" H 4450 5500 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 4450 5400 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 3850 4100 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 3850 4100 50  0001 C CNN
	1    3850 4100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5150 3600 4650 3600
Wire Wire Line
	5150 4000 4550 4000
Wire Wire Line
	4550 4000 4550 3500
Wire Wire Line
	4550 3500 4350 3500
NoConn ~ 3350 3900
NoConn ~ 3350 4100
NoConn ~ 3350 4200
NoConn ~ 3350 4300
NoConn ~ 3350 4400
NoConn ~ 3350 4500
NoConn ~ 3350 4600
NoConn ~ 3350 4700
NoConn ~ 3350 4800
NoConn ~ 4350 4800
NoConn ~ 4350 4700
NoConn ~ 4350 4600
NoConn ~ 4350 4500
NoConn ~ 4350 4400
NoConn ~ 4350 4300
NoConn ~ 4350 4200
NoConn ~ 4350 4100
NoConn ~ 4350 4000
NoConn ~ 4350 3900
NoConn ~ 4350 3800
NoConn ~ 4350 3700
NoConn ~ 3950 3100
NoConn ~ 3750 3100
NoConn ~ 3350 3600
NoConn ~ 3850 5100
$Comp
L power:GND #PWR05
U 1 1 5FC823D3
P 3750 5100
F 0 "#PWR05" H 3750 4850 50  0001 C CNN
F 1 "GND" H 3755 4927 50  0000 C CNN
F 2 "" H 3750 5100 50  0001 C CNN
F 3 "" H 3750 5100 50  0001 C CNN
	1    3750 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 5FC82C54
P 3650 3100
F 0 "#PWR04" H 3650 2950 50  0001 C CNN
F 1 "+5V" H 3665 3273 50  0000 C CNN
F 2 "" H 3650 3100 50  0001 C CNN
F 3 "" H 3650 3100 50  0001 C CNN
	1    3650 3100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 5FC83421
P 2650 3500
F 0 "J1" H 2300 3500 50  0000 C CNN
F 1 "Reset jumper" H 2300 3400 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 2650 3500 50  0001 C CNN
F 3 "~" H 2650 3500 50  0001 C CNN
	1    2650 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3500 2850 3500
$Comp
L power:+5V #PWR01
U 1 1 5FC859CA
P 2850 3300
F 0 "#PWR01" H 2850 3150 50  0001 C CNN
F 1 "+5V" H 2865 3473 50  0000 C CNN
F 2 "" H 2850 3300 50  0001 C CNN
F 3 "" H 2850 3300 50  0001 C CNN
	1    2850 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5FC85FDD
P 2850 3700
F 0 "#PWR03" H 2850 3450 50  0001 C CNN
F 1 "GND" H 2855 3527 50  0000 C CNN
F 2 "" H 2850 3700 50  0001 C CNN
F 3 "" H 2850 3700 50  0001 C CNN
	1    2850 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 3300 2850 3400
Wire Wire Line
	2850 3600 2850 3700
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 5FC87182
P 4650 3050
F 0 "J2" V 4450 2900 50  0000 L CNN
F 1 "TTL port" V 4550 2950 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 4650 3050 50  0001 C CNN
F 3 "~" H 4650 3050 50  0001 C CNN
	1    4650 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	4550 3250 4550 3500
Connection ~ 4550 3500
Wire Wire Line
	4650 3250 4650 3600
Connection ~ 4650 3600
Wire Wire Line
	4650 3600 4350 3600
$Comp
L power:GND #PWR07
U 1 1 5FC8AA4C
P 4750 3350
F 0 "#PWR07" H 4750 3100 50  0001 C CNN
F 1 "GND" H 4755 3177 50  0000 C CNN
F 2 "" H 4750 3350 50  0001 C CNN
F 3 "" H 4750 3350 50  0001 C CNN
	1    4750 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3250 4750 3350
$EndSCHEMATC
