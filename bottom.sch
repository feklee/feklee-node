EESchema Schematic File Version 4
LIBS:node-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
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
L Device:Battery_Cell BT?
U 1 1 5C99B5FE
P 3275 2225
AR Path="/5C99B5FE" Ref="BT?"  Part="1" 
AR Path="/5C920CA4/5C99B5FE" Ref="BT2"  Part="1" 
F 0 "BT2" H 3393 2321 50  0000 L CNN
F 1 "CR2032" H 3393 2230 50  0000 L CNN
F 2 "gsg-modules:BK-912" V 3275 2285 50  0001 C CNN
F 3 "http://www.memoryprotectiondevices.com/datasheets/BK-912-datasheet.pdf" V 3275 2285 50  0001 C CNN
F 4 "BK-912" H 1475 -225 50  0001 C CNN "MPN"
F 5 "1" H 1475 -225 50  0001 C CNN "Min Quantity"
	1    3275 2225
	1    0    0    -1  
$EndComp
Text HLabel 5700 1925 2    50   Input ~ 0
DOUT
Text HLabel 5700 2025 2    50   Output ~ 0
BNC-3
Text HLabel 5700 2125 2    50   Output ~ 0
BNC-4
Text HLabel 5700 2325 2    50   UnSpc ~ 0
BATT-BOT
Text HLabel 5700 2425 2    50   UnSpc ~ 0
GNDB
Text Label 3275 2025 2    50   ~ 0
BATT-BOT
Text Label 5300 2325 0    50   ~ 0
BATT-BOT
$Comp
L Connector_Generic:Conn_01x02 J7
U 1 1 5CA5A9D9
P 7250 1875
F 0 "J7" H 7330 1867 50  0000 L CNN
F 1 "Port_3" H 7330 1776 50  0000 L CNN
F 2 "Connector_Molex:Molex_PicoBlade_53047-0210_1x02_P1.25mm_Vertical" H 7250 1875 50  0001 C CNN
F 3 "~" H 7250 1875 50  0001 C CNN
	1    7250 1875
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J8
U 1 1 5CA5ADA9
P 7250 2375
F 0 "J8" H 7330 2367 50  0000 L CNN
F 1 "Port_4" H 7330 2276 50  0000 L CNN
F 2 "Connector_Molex:Molex_PicoBlade_53047-0210_1x02_P1.25mm_Vertical" H 7250 2375 50  0001 C CNN
F 3 "~" H 7250 2375 50  0001 C CNN
	1    7250 2375
	1    0    0    -1  
$EndComp
Text Label 5300 2125 0    50   ~ 0
BNC-4
Text Label 5300 2025 0    50   ~ 0
BNC-3
Text Label 5300 1925 0    50   ~ 0
DOUT
$Comp
L Connector_Generic:Conn_01x06 J6
U 1 1 5CA7C65D
P 4850 2225
F 0 "J6" H 4850 1825 50  0000 C CNN
F 1 "FFC-0.5MM-6POS" H 5000 2575 50  0000 C CNN
F 2 "Connector_FFC-FPC:Hirose_FH12-6S-0.5SH_1x06-1MP_P0.50mm_Horizontal" H 4850 2225 50  0001 C CNN
F 3 "http://file.elecfans.com/web1/M00/58/C8/o4YBAFte0lKAMHKmAAy2rm8BovQ141.pdf" H 4850 2225 50  0001 C CNN
F 4 "FH12-6S-0.5SH(55)" H 3750 875 50  0001 C CNN "MPN"
F 5 "FH12-6S-0.5SH(55)" H 3750 875 50  0001 C CNN "SKU"
F 6 "Shenzhen" H 3750 875 50  0001 C CNN "OPL"
F 7 "1" H 3750 875 50  0001 C CNN "Min Quantity"
	1    4850 2225
	-1   0    0    1   
$EndComp
Wire Wire Line
	5050 1925 5700 1925
Wire Wire Line
	5050 2025 5700 2025
Wire Wire Line
	5050 2125 5700 2125
Wire Wire Line
	5050 2325 5700 2325
Text Label 6700 1875 0    50   ~ 0
BNC-3
Text Label 6700 2375 0    50   ~ 0
BNC-4
Wire Wire Line
	6700 1875 7050 1875
Wire Wire Line
	7050 2375 6700 2375
Wire Wire Line
	4675 3900 4675 3950
Wire Wire Line
	4675 4550 4675 4600
Connection ~ 4675 4600
Wire Wire Line
	4675 4600 4675 4650
Text Label 3975 4250 0    50   ~ 0
DOUT
Wire Wire Line
	3975 4250 4375 4250
Wire Wire Line
	5900 4600 5900 4550
Connection ~ 5900 4600
Wire Wire Line
	6525 4600 6525 4100
Wire Wire Line
	5900 4600 6525 4600
Wire Wire Line
	5900 4650 5900 4600
Wire Wire Line
	5900 3900 5900 3800
Connection ~ 5900 3900
Wire Wire Line
	5900 3900 6525 3900
Wire Wire Line
	5900 3950 5900 3900
Wire Wire Line
	5300 4600 5300 4100
Wire Wire Line
	4675 4600 5300 4600
Wire Wire Line
	4675 3900 5300 3900
Wire Wire Line
	4975 4250 5600 4250
$Comp
L Device:C_Small C?
U 1 1 5CA85CBD
P 6525 4000
AR Path="/5CA85CBD" Ref="C?"  Part="1" 
AR Path="/5C920754/5CA85CBD" Ref="C?"  Part="1" 
AR Path="/5C920CA4/5CA85CBD" Ref="C13"  Part="1" 
F 0 "C13" H 6617 4046 50  0000 L CNN
F 1 "0.1u" H 6617 3955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 6525 4000 50  0001 C CNN
F 3 "~" H 6525 4000 50  0001 C CNN
F 4 "VJ0402G104KXQCW1BC" H 1875 1650 50  0001 C CNN "MPN"
F 5 "VJ0402G104KXQCW1BC" H 1875 1650 50  0001 C CNN "SKU"
F 6 "Shenzhen" H 1875 1650 50  0001 C CNN "OPL"
F 7 "50" H 1875 1650 50  0001 C CNN "Min Quantity"
	1    6525 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5CA85CB7
P 5300 4000
AR Path="/5CA85CB7" Ref="C?"  Part="1" 
AR Path="/5C920754/5CA85CB7" Ref="C?"  Part="1" 
AR Path="/5C920CA4/5CA85CB7" Ref="C12"  Part="1" 
F 0 "C12" H 5392 4046 50  0000 L CNN
F 1 "0.1u" H 5392 3955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 5300 4000 50  0001 C CNN
F 3 "~" H 5300 4000 50  0001 C CNN
F 4 "VJ0402G104KXQCW1BC" H 1600 1650 50  0001 C CNN "MPN"
F 5 "VJ0402G104KXQCW1BC" H 1600 1650 50  0001 C CNN "SKU"
F 6 "Shenzhen" H 1600 1650 50  0001 C CNN "OPL"
F 7 "50" H 1600 1650 50  0001 C CNN "Min Quantity"
	1    5300 4000
	1    0    0    -1  
$EndComp
$Comp
L node:WS2812D-F5 D?
U 1 1 5C9C36C4
P 4675 4250
AR Path="/5C920754/5C9C36C4" Ref="D?"  Part="1" 
AR Path="/5C920CA4/5C9C36C4" Ref="D4"  Part="1" 
F 0 "D4" H 4475 4500 50  0000 L CNN
F 1 "WS2812D-F5" H 4700 4000 50  0000 L CNN
F 2 "node:WS2812D-F5" H 4725 3950 50  0001 L TNN
F 3 "http://www.world-semi.com/DownLoadFile/135" H 4775 3875 50  0001 L TNN
	1    4675 4250
	1    0    0    -1  
$EndComp
$Comp
L node:WS2812D-F5 D?
U 1 1 5C9C3CDA
P 5900 4250
AR Path="/5C920754/5C9C3CDA" Ref="D?"  Part="1" 
AR Path="/5C920CA4/5C9C3CDA" Ref="D5"  Part="1" 
F 0 "D5" H 5700 4500 50  0000 L CNN
F 1 "WS2812D-F5" H 5925 4000 50  0000 L CNN
F 2 "node:WS2812D-F5" H 5950 3950 50  0001 L TNN
F 3 "http://www.world-semi.com/DownLoadFile/135" H 6000 3875 50  0001 L TNN
	1    5900 4250
	1    0    0    -1  
$EndComp
NoConn ~ 6200 4250
$Comp
L node:GNDB #PWR0101
U 1 1 5CA41F18
P 7050 2475
F 0 "#PWR0101" H 7050 2225 50  0001 C CNN
F 1 "GNDB" H 7055 2302 50  0000 C CNN
F 2 "" H 7050 2475 50  0001 C CNN
F 3 "" H 7050 2475 50  0001 C CNN
	1    7050 2475
	1    0    0    -1  
$EndComp
$Comp
L node:GNDB #PWR0102
U 1 1 5CA4305A
P 7050 1975
F 0 "#PWR0102" H 7050 1725 50  0001 C CNN
F 1 "GNDB" H 7055 1802 50  0000 C CNN
F 2 "" H 7050 1975 50  0001 C CNN
F 3 "" H 7050 1975 50  0001 C CNN
	1    7050 1975
	1    0    0    -1  
$EndComp
$Comp
L node:GNDB #PWR0103
U 1 1 5CA43459
P 5600 2525
F 0 "#PWR0103" H 5600 2275 50  0001 C CNN
F 1 "GNDB" H 5605 2352 50  0000 C CNN
F 2 "" H 5600 2525 50  0001 C CNN
F 3 "" H 5600 2525 50  0001 C CNN
	1    5600 2525
	1    0    0    -1  
$EndComp
$Comp
L node:GNDB #PWR0104
U 1 1 5CA437BD
P 3275 2325
F 0 "#PWR0104" H 3275 2075 50  0001 C CNN
F 1 "GNDB" H 3280 2152 50  0000 C CNN
F 2 "" H 3275 2325 50  0001 C CNN
F 3 "" H 3275 2325 50  0001 C CNN
	1    3275 2325
	1    0    0    -1  
$EndComp
$Comp
L node:GNDB #PWR0105
U 1 1 5CA43F56
P 4675 4650
F 0 "#PWR0105" H 4675 4400 50  0001 C CNN
F 1 "GNDB" H 4680 4477 50  0000 C CNN
F 2 "" H 4675 4650 50  0001 C CNN
F 3 "" H 4675 4650 50  0001 C CNN
	1    4675 4650
	1    0    0    -1  
$EndComp
$Comp
L node:GNDB #PWR0107
U 1 1 5CA44687
P 5900 4650
F 0 "#PWR0107" H 5900 4400 50  0001 C CNN
F 1 "GNDB" H 5905 4477 50  0000 C CNN
F 2 "" H 5900 4650 50  0001 C CNN
F 3 "" H 5900 4650 50  0001 C CNN
	1    5900 4650
	1    0    0    -1  
$EndComp
Text HLabel 5700 2225 2    50   Input ~ 0
+5VB
$Comp
L node:+5VB #PWR0108
U 1 1 5C99193B
P 5900 3800
F 0 "#PWR0108" H 5900 3650 50  0001 C CNN
F 1 "+5VB" H 5915 3973 50  0000 C CNN
F 2 "" H 5900 3800 50  0001 C CNN
F 3 "" H 5900 3800 50  0001 C CNN
	1    5900 3800
	1    0    0    -1  
$EndComp
$Comp
L node:+5VB #PWR0110
U 1 1 5CA4532B
P 5200 1500
F 0 "#PWR0110" H 5200 1350 50  0001 C CNN
F 1 "+5VB" H 5215 1673 50  0000 C CNN
F 2 "" H 5200 1500 50  0001 C CNN
F 3 "" H 5200 1500 50  0001 C CNN
	1    5200 1500
	1    0    0    -1  
$EndComp
$Comp
L node:+5VB #PWR0109
U 1 1 5CA03EDF
P 4675 3800
F 0 "#PWR0109" H 4675 3650 50  0001 C CNN
F 1 "+5VB" H 4690 3973 50  0000 C CNN
F 2 "" H 4675 3800 50  0001 C CNN
F 3 "" H 4675 3800 50  0001 C CNN
	1    4675 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2225 5700 2225
Wire Wire Line
	5050 2225 5200 2225
Connection ~ 5200 2225
Wire Wire Line
	5200 1500 5200 1600
Wire Wire Line
	4675 3800 4675 3900
Connection ~ 4675 3900
Wire Wire Line
	5050 2425 5250 2425
Wire Wire Line
	5600 2525 5600 2425
Connection ~ 5600 2425
Wire Wire Line
	5600 2425 5700 2425
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5CA08161
P 4850 1500
F 0 "#FLG0101" H 4850 1575 50  0001 C CNN
F 1 "PWR_FLAG" H 4850 1673 50  0000 C CNN
F 2 "" H 4850 1500 50  0001 C CNN
F 3 "~" H 4850 1500 50  0001 C CNN
	1    4850 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 1500 4850 1600
Wire Wire Line
	4850 1600 5200 1600
Connection ~ 5200 1600
Wire Wire Line
	5200 1600 5200 2225
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5CA09F39
P 5250 2525
F 0 "#FLG0102" H 5250 2600 50  0001 C CNN
F 1 "PWR_FLAG" H 5250 2698 50  0000 C CNN
F 2 "" H 5250 2525 50  0001 C CNN
F 3 "~" H 5250 2525 50  0001 C CNN
	1    5250 2525
	-1   0    0    1   
$EndComp
Wire Wire Line
	5250 2525 5250 2425
Connection ~ 5250 2425
Wire Wire Line
	5250 2425 5600 2425
$EndSCHEMATC
