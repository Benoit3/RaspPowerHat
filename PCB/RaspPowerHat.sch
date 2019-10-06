EESchema Schematic File Version 4
LIBS:RaspPowerHat-cache
EELAYER 29 0
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
L Connector-ML:RPi_GPIO J2
U 1 1 5516AE26
P 8600 2550
F 0 "J2" H 9350 2800 60  0000 C CNN
F 1 "RPi_GPIO" H 9350 2700 60  0000 C CNN
F 2 "RPi_Hat:Pin_Header_Straight_2x20" H 8600 2550 60  0001 C CNN
F 3 "" H 8600 2550 60  0000 C CNN
	1    8600 2550
	1    0    0    -1  
$EndComp
Text Notes 8500 4950 0    100  Italic 0
Thru-Hole PI Connector
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 5CAA82F4
P 650 2950
F 0 "J1" H 568 2625 50  0000 C CNN
F 1 "Conn_01x05" H 568 2716 50  0001 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MPT-0,5-5-2.54_1x05_P2.54mm_Horizontal" H 650 2950 50  0001 C CNN
F 3 "~" H 650 2950 50  0001 C CNN
	1    650  2950
	-1   0    0    1   
$EndComp
Wire Wire Line
	1650 3150 1650 2700
Wire Wire Line
	1650 2700 2300 2700
Wire Wire Line
	1650 3150 1650 4450
Wire Wire Line
	1650 4450 2150 4450
Wire Wire Line
	2700 4450 2700 4100
Connection ~ 1650 3150
Wire Wire Line
	2300 3100 2150 3100
Wire Wire Line
	2150 3100 2150 3450
Wire Wire Line
	2150 3800 2300 3800
Wire Wire Line
	1550 2300 3100 2300
Wire Wire Line
	2700 4450 3500 4450
Wire Wire Line
	3900 4450 3900 4100
Connection ~ 2700 4450
Wire Wire Line
	3600 3450 3600 3800
Wire Wire Line
	1450 2950 1450 2200
Connection ~ 3900 4450
Wire Wire Line
	3900 4450 4350 4450
Wire Wire Line
	10550 2100 10550 2550
Wire Wire Line
	10300 2650 10550 2650
Wire Wire Line
	10550 2550 10300 2550
Connection ~ 10550 2550
Wire Wire Line
	10550 2550 10550 2650
Wire Wire Line
	6200 4300 6200 4450
Wire Wire Line
	8450 4450 8400 4450
$Comp
L Device:C C1
U 1 1 5CB0892B
P 4350 4050
F 0 "C1" H 4465 4096 50  0000 L CNN
F 1 "100 nF" H 4465 4005 50  0000 L CNN
F 2 "Capacitor_SMD:C_1812_4532Metric_Pad1.30x3.40mm_HandSolder" H 4388 3900 50  0001 C CNN
F 3 "~" H 4350 4050 50  0001 C CNN
	1    4350 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 3800 4350 3800
Wire Wire Line
	4350 3800 4350 3900
Wire Wire Line
	4350 4200 4350 4450
Connection ~ 4350 4450
Wire Wire Line
	4350 4450 4800 4450
Wire Wire Line
	4350 3800 4350 3000
Connection ~ 4350 3800
$Comp
L MCU_Microchip_ATtiny:ATtiny45-20PU U5
U 1 1 5CAA066C
P 6200 3700
F 0 "U5" H 5671 3746 50  0000 R CNN
F 1 "ATtiny45-20PU" H 5671 3655 50  0000 R CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 6200 3700 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 6200 3700 50  0001 C CNN
	1    6200 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 3000 6200 3100
Wire Wire Line
	4350 3000 6200 3000
Wire Wire Line
	10750 4750 10750 4250
Wire Wire Line
	10750 4250 10300 4250
Wire Wire Line
	2300 2800 1950 2800
Wire Wire Line
	1950 2800 1950 1950
Wire Wire Line
	7050 1950 7050 3500
Wire Wire Line
	7050 3500 6800 3500
Wire Wire Line
	2150 3450 2350 3450
Connection ~ 2150 3450
Wire Wire Line
	2150 3450 2150 3800
Wire Wire Line
	3400 2100 3400 3800
$Comp
L Device:R_Small R1
U 1 1 5CB30355
P 4800 2300
F 0 "R1" H 4859 2346 50  0000 L CNN
F 1 "100 k" H 4859 2255 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4800 2300 50  0001 C CNN
F 3 "~" H 4800 2300 50  0001 C CNN
	1    4800 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5CB30E30
P 4800 4050
F 0 "R2" H 4859 4096 50  0000 L CNN
F 1 "10 k" H 4859 4005 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4800 4050 50  0001 C CNN
F 3 "~" H 4800 4050 50  0001 C CNN
	1    4800 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2400 4800 2600
Wire Wire Line
	4800 4150 4800 4450
Connection ~ 4800 4450
Wire Wire Line
	4800 4450 6200 4450
Wire Wire Line
	4800 2600 6900 2600
Wire Wire Line
	6900 3700 6800 3700
Connection ~ 4800 2600
Wire Wire Line
	4800 2600 4800 3950
Wire Wire Line
	6900 2600 6900 3700
Text Label 1150 3150 0    50   ~ 0
GND
Text Label 1150 3050 0    50   ~ 0
VCC
Text Label 1150 2950 0    50   ~ 0
Vacc
$Comp
L perso:BTS452T U2
U 1 1 5CAAF724
P 2650 2900
F 0 "U2" H 2650 3365 50  0000 C CNN
F 1 "BTS452T" H 2650 3274 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-252-5_TabPin6" H 2650 3250 50  0001 C CNN
F 3 "" H 2650 3250 50  0001 C CNN
	1    2650 2900
	1    0    0    -1  
$EndComp
$Comp
L perso:TSR_2-2450 U3
U 1 1 5CAB1BEE
P 2700 3900
F 0 "U3" H 2700 4267 50  0000 C CNN
F 1 "TSR_2-2450" H 2700 4176 50  0000 C CNN
F 2 "RaspPowerHat:Converter_DCDC_TRACO_TSR-2_THT" H 2700 3750 50  0001 L CIN
F 3 "http://www.tracopower.com/products/tsr1.pdf" H 2700 3900 50  0001 C CNN
	1    2700 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3800 3400 3800
Wire Wire Line
	6200 4450 7750 4450
Connection ~ 6200 4450
Text Label 8050 4350 0    50   ~ 0
-HALTED
Text Label 1950 1950 0    50   ~ 0
POWER_ON
Wire Wire Line
	2000 5600 2500 5600
Wire Wire Line
	2500 5600 2500 4450
Connection ~ 2500 4450
Wire Wire Line
	2500 4450 2700 4450
$Comp
L Device:R R3
U 1 1 5CC084BB
P 2000 5150
F 0 "R3" H 2070 5196 50  0000 L CNN
F 1 "100 k" H 2070 5105 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 1930 5150 50  0001 C CNN
F 3 "~" H 2000 5150 50  0001 C CNN
	1    2000 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 2950 1450 2950
Wire Wire Line
	2000 5000 1550 5000
$Comp
L Diode:BZT52Bxx D6
U 1 1 5CC03D99
P 2000 5450
F 0 "D6" V 1954 5529 50  0000 L CNN
F 1 "MMSZ4685T1G" V 2045 5529 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 2000 5275 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/MMSZ4678T1-D.PDF" H 2000 5450 50  0001 C CNN
	1    2000 5450
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Female J3
U 1 1 5CC08B15
P 1450 5300
F 0 "J3" H 1342 5075 50  0000 C CNN
F 1 "GPS Backup" H 1450 5150 50  0000 C CNN
F 2 "Connector_Pin:Pin_D1.4mm_L8.5mm_W2.8mm_FlatFork" H 1450 5300 50  0001 C CNN
F 3 "~" H 1450 5300 50  0001 C CNN
	1    1450 5300
	-1   0    0    1   
$EndComp
Wire Wire Line
	1650 5300 2000 5300
Connection ~ 2000 5300
$Comp
L Jumper:SolderJumper_3_Open JP1
U 1 1 5CC1196D
P 7600 3400
F 0 "JP1" V 7554 3468 50  0000 L CNN
F 1 "SolderJumper_3_Open" V 7645 3468 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_RoundedPad1.0x1.5mm_NumberLabels" H 7600 3400 50  0001 C CNN
F 3 "~" H 7600 3400 50  0001 C CNN
	1    7600 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	6800 3400 7450 3400
Wire Wire Line
	7600 3200 7600 2650
Wire Wire Line
	7600 2650 8400 2650
Wire Wire Line
	6800 3600 7350 3600
Wire Wire Line
	7350 3600 7350 2750
Wire Wire Line
	7350 2750 8400 2750
$Comp
L Device:R R5
U 1 1 5CC2C9B5
P 7600 2500
F 0 "R5" H 7670 2546 50  0000 L CNN
F 1 "10k" H 7670 2455 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7530 2500 50  0001 C CNN
F 3 "~" H 7600 2500 50  0001 C CNN
	1    7600 2500
	1    0    0    -1  
$EndComp
Connection ~ 7600 2650
$Comp
L Device:R R4
U 1 1 5CC2D2CE
P 7350 2500
F 0 "R4" H 7420 2546 50  0000 L CNN
F 1 "10 k" H 7420 2455 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7280 2500 50  0001 C CNN
F 3 "~" H 7350 2500 50  0001 C CNN
	1    7350 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 2650 7350 2750
Connection ~ 7350 2750
Wire Wire Line
	7350 2350 7600 2350
Wire Wire Line
	7600 2350 8200 2350
Wire Wire Line
	8200 2350 8200 2550
Wire Wire Line
	8200 2550 8400 2550
Connection ~ 7600 2350
$Comp
L Diode:MRA4003T3G D1
U 1 1 5CC04851
P 2500 3450
F 0 "D1" H 2500 3234 50  0000 C CNN
F 1 "S1B" H 2500 3325 50  0000 C CNN
F 2 "Diode_SMD:D_SMA" H 2500 3275 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/S1M-D.pdf" H 2500 3450 50  0001 C CNN
	1    2500 3450
	-1   0    0    1   
$EndComp
$Comp
L Diode:MRA4003T3G D2
U 1 1 5CC0C7DB
P 3600 3300
F 0 "D2" V 3646 3221 50  0000 R CNN
F 1 "S1B" V 3555 3221 50  0000 R CNN
F 2 "Diode_SMD:D_SMA" H 3600 3125 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/S1M-D.pdf" H 3600 3300 50  0001 C CNN
	1    3600 3300
	0    -1   -1   0   
$EndComp
$Comp
L Diode:MRA4003T3G D3
U 1 1 5CC0FF16
P 3600 3000
F 0 "D3" V 3646 2921 50  0000 R CNN
F 1 "S1B" V 3555 2921 50  0000 R CNN
F 2 "Diode_SMD:D_SMA" H 3600 2825 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/S1M-D.pdf" H 3600 3000 50  0001 C CNN
	1    3600 3000
	0    -1   -1   0   
$EndComp
$Comp
L Diode:MRA4003T3G D4
U 1 1 5CC1098B
P 3600 2700
F 0 "D4" V 3646 2621 50  0000 R CNN
F 1 "S1B" V 3555 2621 50  0000 R CNN
F 2 "Diode_SMD:D_SMA" H 3600 2525 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/S1M-D.pdf" H 3600 2700 50  0001 C CNN
	1    3600 2700
	0    -1   -1   0   
$EndComp
$Comp
L Diode:MRA4003T3G D5
U 1 1 5CC1101F
P 3600 2400
F 0 "D5" V 3646 2321 50  0000 R CNN
F 1 "S1B" V 3555 2321 50  0000 R CNN
F 2 "Diode_SMD:D_SMA" H 3600 2225 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/S1M-D.pdf" H 3600 2400 50  0001 C CNN
	1    3600 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1450 2200 3600 2200
Wire Wire Line
	3600 2200 3600 2250
Connection ~ 3600 2200
Wire Wire Line
	3600 2200 4800 2200
Wire Wire Line
	3100 2300 3100 2900
Wire Wire Line
	3100 2900 3000 2900
Wire Wire Line
	2650 3450 3350 3450
Wire Wire Line
	3350 3450 3350 2550
Wire Wire Line
	3350 2550 3600 2550
Connection ~ 3600 2550
$Comp
L Device:C C2
U 1 1 5CC23DC3
P 3500 4050
F 0 "C2" H 3615 4096 50  0000 L CNN
F 1 "330 nF" H 3615 4005 50  0000 L CNN
F 2 "Capacitor_SMD:C_1812_4532Metric_Pad1.30x3.40mm_HandSolder" H 3538 3900 50  0001 C CNN
F 3 "~" H 3500 4050 50  0001 C CNN
	1    3500 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3800 3500 3900
Wire Wire Line
	3600 3800 3500 3800
Connection ~ 3500 4450
Wire Wire Line
	3500 4450 3900 4450
Wire Wire Line
	3500 4200 3500 4450
$Comp
L Device:LED D7
U 1 1 5CC054F3
P 10850 3050
F 0 "D7" H 11000 3000 50  0000 C CNN
F 1 "B" H 10950 3000 50  0001 C CNN
F 2 "LED_THT:LED_D3.0mm" H 10850 3050 50  0001 C CNN
F 3 "~" H 10850 3050 50  0001 C CNN
	1    10850 3050
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D8
U 1 1 5CC0D1F4
P 10850 3200
F 0 "D8" H 11000 3150 50  0000 C CNN
F 1 "R" H 10950 3150 50  0001 C CNN
F 2 "LED_THT:LED_D3.0mm" H 10850 3200 50  0001 C CNN
F 3 "~" H 10850 3200 50  0001 C CNN
	1    10850 3200
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D9
U 1 1 5CC10B1D
P 10850 3350
F 0 "D9" H 11000 3300 50  0000 C CNN
F 1 "J" H 10950 3300 50  0001 C CNN
F 2 "LED_THT:LED_D3.0mm" H 10850 3350 50  0001 C CNN
F 3 "~" H 10850 3350 50  0001 C CNN
	1    10850 3350
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D10
U 1 1 5CC114FD
P 10850 3500
F 0 "D10" H 10950 3450 50  0000 C CNN
F 1 "V" H 10950 3450 50  0001 C CNN
F 2 "LED_THT:LED_D3.0mm" H 10850 3500 50  0001 C CNN
F 3 "~" H 10850 3500 50  0001 C CNN
	1    10850 3500
	-1   0    0    1   
$EndComp
$Comp
L Device:R R6
U 1 1 5CC133D7
P 10550 3050
F 0 "R6" V 10500 2900 50  0000 C CNN
F 1 "330" V 10550 3050 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 10480 3050 50  0001 C CNN
F 3 "~" H 10550 3050 50  0001 C CNN
	1    10550 3050
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5CC16B56
P 10550 3200
F 0 "R7" V 10500 3050 50  0000 C CNN
F 1 "330" V 10550 3200 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 10480 3200 50  0001 C CNN
F 3 "~" H 10550 3200 50  0001 C CNN
	1    10550 3200
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5CC17FF4
P 10550 3350
F 0 "R8" V 10500 3200 50  0000 C CNN
F 1 "330" V 10550 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 10480 3350 50  0001 C CNN
F 3 "~" H 10550 3350 50  0001 C CNN
	1    10550 3350
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 5CC182F1
P 10550 3500
F 0 "R9" V 10500 3350 50  0000 C CNN
F 1 "330" V 10550 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 10480 3500 50  0001 C CNN
F 3 "~" H 10550 3500 50  0001 C CNN
	1    10550 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	10300 3050 10400 3050
Wire Wire Line
	8400 3050 8400 3100
Wire Wire Line
	8400 3100 10400 3100
Wire Wire Line
	10400 3100 10400 3200
Wire Wire Line
	10400 3250 10400 3350
Wire Wire Line
	8400 3150 8400 3200
Wire Wire Line
	10350 3300 10350 3500
Wire Wire Line
	10350 3500 10400 3500
$Comp
L Device:R R10
U 1 1 5CC23D1F
P 10550 3650
F 0 "R10" V 10500 3500 50  0000 C CNN
F 1 "330" V 10550 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 10480 3650 50  0001 C CNN
F 3 "~" H 10550 3650 50  0001 C CNN
	1    10550 3650
	0    1    1    0   
$EndComp
$Comp
L Device:LED D11
U 1 1 5CC23FCE
P 10850 3650
F 0 "D11" H 10950 3600 50  0000 C CNN
F 1 "V" H 10950 3600 50  0001 C CNN
F 2 "LED_THT:LED_D3.0mm" H 10850 3650 50  0001 C CNN
F 3 "~" H 10850 3650 50  0001 C CNN
	1    10850 3650
	-1   0    0    1   
$EndComp
Wire Wire Line
	8400 3350 8400 3400
Wire Wire Line
	8400 3400 9300 3400
Wire Wire Line
	9300 3400 9300 3600
Wire Wire Line
	9300 3600 10400 3600
Wire Wire Line
	10400 3600 10400 3650
Wire Wire Line
	11000 3650 11000 3500
Wire Wire Line
	11000 3350 11000 3200
Wire Wire Line
	11000 3050 11000 2750
Wire Wire Line
	11000 3050 11000 3200
Connection ~ 11000 3050
Connection ~ 11000 3200
Wire Wire Line
	11000 3350 11000 3500
Connection ~ 11000 3350
Connection ~ 11000 3500
$Comp
L Device:Polyfuse F2
U 1 1 5CC3805B
P 1000 3050
F 0 "F2" V 950 2900 50  0000 C CNN
F 1 "29L110/60" V 866 3050 50  0001 C CNN
F 2 "Fuse:Fuse_2920_7451Metric_Pad2.10x5.45mm_HandSolder" H 1050 2850 50  0001 L CNN
F 3 "~" H 1000 3050 50  0001 C CNN
	1    1000 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 2300 1550 3050
Wire Wire Line
	1150 3050 1550 3050
Connection ~ 1550 3050
Wire Wire Line
	1550 3050 1550 5000
Wire Wire Line
	850  3150 1650 3150
$Comp
L Device:Polyfuse F1
U 1 1 5CC49379
P 1000 2950
F 0 "F1" V 950 2800 50  0000 C CNN
F 1 "1206L010/60WR" V 866 2950 50  0001 C CNN
F 2 "Fuse:Fuse_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1050 2750 50  0001 L CNN
F 3 "~" H 1000 2950 50  0001 C CNN
	1    1000 2950
	0    1    1    0   
$EndComp
$Comp
L Isolator:SFH6206-1T U6
U 1 1 5CC4DF89
P 5750 1250
F 0 "U6" H 5750 1617 50  0000 C CNN
F 1 "SFH6206-1T" H 5750 1526 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W9.53mm_Clearance8mm" H 5750 850 50  0001 C CNN
F 3 "http://www.vishay.com/docs/83675/sfh620a.pdf" H 5750 1250 50  0001 C CNN
	1    5750 1250
	1    0    0    -1  
$EndComp
$Comp
L Isolator:SFH6206-1T U7
U 1 1 5CC4FB56
P 6800 1250
F 0 "U7" H 6800 1617 50  0000 C CNN
F 1 "SFH6206-1T" H 6590 990 50  0000 L CNN
F 2 "Package_DIP:SMDIP-4_W9.53mm_Clearance8mm" H 6800 850 50  0001 C CNN
F 3 "http://www.vishay.com/docs/83675/sfh620a.pdf" H 6800 1250 50  0001 C CNN
	1    6800 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	11000 2750 10300 2750
Wire Wire Line
	6050 1350 6050 1650
Wire Wire Line
	6050 1650 6400 1650
Wire Wire Line
	7100 1350 7100 1650
Wire Wire Line
	7750 2950 7900 2950
Wire Wire Line
	8400 3950 8300 3950
Wire Wire Line
	8300 3950 8300 750 
Wire Wire Line
	8300 750  6150 750 
Wire Wire Line
	6150 750  6150 1150
Wire Wire Line
	6150 1150 6050 1150
Wire Wire Line
	7100 1150 8100 1150
Wire Wire Line
	8100 1150 8100 4050
Wire Wire Line
	8100 4050 8400 4050
$Comp
L Device:R_Small R11
U 1 1 5CCA16EE
P 5200 1550
F 0 "R11" H 5000 1550 50  0000 L CNN
F 1 "10 k" H 5250 1550 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5200 1550 50  0001 C CNN
F 3 "~" H 5200 1550 50  0001 C CNN
	1    5200 1550
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R12
U 1 1 5CCA59EE
P 5200 1050
F 0 "R12" H 5000 1050 50  0000 L CNN
F 1 "10 k" H 5250 1050 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5200 1050 50  0001 C CNN
F 3 "~" H 5200 1050 50  0001 C CNN
	1    5200 1050
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R13
U 1 1 5CCA659B
P 6400 1550
F 0 "R13" H 6450 1600 50  0000 L CNN
F 1 "10 k" H 6450 1500 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6400 1550 50  0001 C CNN
F 3 "~" H 6400 1550 50  0001 C CNN
	1    6400 1550
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R14
U 1 1 5CCA7A1D
P 6400 1050
F 0 "R14" H 6200 1100 50  0000 L CNN
F 1 "10 k" H 6200 1000 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6400 1050 50  0001 C CNN
F 3 "~" H 6400 1050 50  0001 C CNN
	1    6400 1050
	1    0    0    -1  
$EndComp
Connection ~ 6050 1650
Wire Wire Line
	5200 1450 5200 1350
Connection ~ 6400 1650
Wire Wire Line
	1950 1950 7050 1950
Wire Wire Line
	6400 1150 6400 1350
Wire Wire Line
	6400 900  6400 950 
Wire Wire Line
	6400 900  5200 900 
Wire Wire Line
	5200 900  5200 950 
Wire Wire Line
	850  2850 1350 2850
Wire Wire Line
	1350 2850 1350 1150
Wire Wire Line
	6250 1150 6250 800 
Wire Wire Line
	6250 800  1200 800 
Wire Wire Line
	1200 800  1200 2750
Wire Wire Line
	1200 2750 850  2750
$Comp
L Device:C C3
U 1 1 5CD1AB90
P 2150 4100
F 0 "C3" H 2265 4146 50  0000 L CNN
F 1 "22 uF" H 2265 4055 50  0000 L CNN
F 2 "Capacitor_SMD:C_2225_5664Metric_Pad1.80x6.60mm_HandSolder" H 2188 3950 50  0001 C CNN
F 3 "~" H 2150 4100 50  0001 C CNN
	1    2150 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 3800 2150 3950
Connection ~ 2150 3800
Wire Wire Line
	2150 4250 2150 4450
Connection ~ 2150 4450
Wire Wire Line
	2150 4450 2500 4450
Wire Wire Line
	6800 3800 8000 3800
Wire Wire Line
	8000 3800 8000 4350
Wire Wire Line
	8000 4350 8400 4350
Wire Wire Line
	7750 2950 7750 4450
Wire Wire Line
	7600 3600 7600 4750
Wire Wire Line
	7600 4750 10750 4750
Text Label 8900 4750 0    50   ~ 0
SHUTDOWN_REQUEST
$Comp
L Regulator_Linear:L78L33_SO8 U4
U 1 1 5CC22E39
P 3900 3800
F 0 "U4" H 3900 4042 50  0000 C CNN
F 1 "L78L33_SO8" H 3900 3951 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 4000 4000 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/15/55/e5/aa/23/5b/43/fd/CD00000446.pdf/files/CD00000446.pdf/jcr:content/translations/en.CD00000446.pdf" H 4100 3800 50  0001 C CNN
	1    3900 3800
	1    0    0    -1  
$EndComp
Connection ~ 3600 3800
Wire Wire Line
	3400 2100 10550 2100
Wire Wire Line
	3600 2200 3600 900 
Wire Wire Line
	3600 900  5200 900 
Connection ~ 5200 900 
$Comp
L Connector:Conn_01x01_Female J4
U 1 1 5CC325D6
P 1450 5450
F 0 "J4" H 1350 5350 50  0000 C CNN
F 1 "GPS Backup" H 1450 5550 50  0000 C CNN
F 2 "Connector_Pin:Pin_D1.4mm_L8.5mm_W2.8mm_FlatFork" H 1450 5450 50  0001 C CNN
F 3 "~" H 1450 5450 50  0001 C CNN
	1    1450 5450
	-1   0    0    1   
$EndComp
Wire Wire Line
	1650 5300 1650 5450
Connection ~ 1650 5300
Wire Wire Line
	7100 1650 7900 1650
Wire Wire Line
	7900 1650 7900 2950
Connection ~ 7100 1650
Connection ~ 7900 2950
Wire Wire Line
	7900 2950 8400 2950
Wire Wire Line
	5200 1650 6050 1650
Wire Wire Line
	1350 1150 5450 1150
Wire Wire Line
	5200 1350 5450 1350
Connection ~ 5200 1350
Wire Wire Line
	5200 1350 5200 1150
Wire Wire Line
	6250 1150 6500 1150
Wire Wire Line
	6400 1650 7100 1650
Wire Wire Line
	6400 1350 6500 1350
Connection ~ 6400 1350
Wire Wire Line
	6400 1350 6400 1450
Wire Wire Line
	10350 3300 10300 3300
Wire Wire Line
	10300 3300 10300 3250
Wire Wire Line
	10400 3250 10350 3250
Wire Wire Line
	10350 3250 10350 3200
Wire Wire Line
	8400 3200 10350 3200
$EndSCHEMATC
