
===== [tab: Features] =====
FeatureNum		Feature	Feature	Feature		FeatureNum		Feature	Feature	Feature		FeatureNum		Feature	Feature	Feature		FeatureNum		Feature	Feature	Feature		FeatureNum		Feature	Feature	Feature
F1	F1-1	EtherCAT Ports
(2-4)	Permanent ports	(2-4)		F5	F5-1	EBUS Features	Low Jitter			F8	F8-1	PDI General Features	Increased PDI performance			F13	F13-1	On-Chip Bus PDI				F23	F23-1	SII EEPROM Interface (0x0500:0x050F)	EEPROM sizes supported	
	F1-2		Optional Bridge port 3 (EBUS or MII)	-			F5-2		Enhanced Link Detection supported				F8-2		Extended PDI Configuration (0x0152:0x0153)			F14	F14-1	EtherCAT Bridge (port 3, EBUS/MII)					F23-2		EEPROM size reflected in 0x0502[7]	
	F1-3		EBUS ports	(0-4)			F5-3		Enhanced Link Detection compatible				F8-3		PDI Error Counter (0x030D)			F15	F15-1	General Purpose I/O	GPO bits	(0-16)			F23-3		EEPROM controllable by PDI	
	F1-4		MII ports	(0-4)			F5-4		EBUS signal validation				F8-4		PDI Error Code (0x030E)				F15-2		GPI bits	(0-16)			F23-4		EEPROM Emulation by PDI	
	F1-5		RMII ports	-			F5-5		LVDS Transceiver internal				F8-5		CPU_CLK output (10, 20, 25 MHz)				F15-3		GPIO available independent of PDI or port configuration				F23-5		EEPROM Emulation CRC error 0x0502[11] PDI writable	
	F1-6		RGMII ports	-			F5-6		LVDS sample rate [MHz]	1000			F8-6		SOF, EOF, WD_TRIG and WD_STATE independent of PDI				F15-4		GPIO available without PDI				F23-6		Read data bytes (0x0502[6])	8
	F1-7		Port 0	-			F5-7		Remote link down signaling time configurable
0x0100[22]				F8-7		Available PDIs and PDI features depending on port configuration				F15-5		Concurrent access to GPO by ECAT and PDI				F23-7		Internal Pull-Ups for EEPROM_CLK and	
	F1-8		Ports 0, 1			F6	F6-1	General Ethernet Features 
(MII/RMII/RGMII)	MII Management Interface (0x0510:0x051F)				F8-8		PDI selection at run-time (SII EEPROM)			F16	F16-1	ESC Information	Basic Information (0x0000:0x0006)				F23-8		EEPROM_DATA	
	F1-9		Ports 0, 1, 2				F6-2		Supported PHY Address Offsets	0/16			F8-9		PDI active immediately (SII EEPROM settings ignored)				F16-2		Port Descriptor (0x0007)				F23-9		I2C base address	
	F1-10		Ports 0, 1, 3				F6-3		Individual port PHY addresses				F8-10		PDI function acknowledge by write				F16-3		ESC Features supported (0x0008:0x0009)			F24	F24-1	FMMUs
(8)	Bit-oriented operation	
	F1-11		Ports 0, 1, 2, 3				F6-4		Port PHY addresses readable				F8-11		PDI Information register 0x014E:0x014F				F16-4		Extended ESC Feature Availability in User RAM(0x0F80 ff.)			F25	F25-1	SyncManagers
(8)	Watchdog trigger generation for 1 Byte Mailbox configuration independent of reading access	
F2	F2-1	EtherCAT mode					F6-5		Link Polarity configurable			F9	F9-1	Digital I/O PDI	Digital I/O width [bits]	8/16/24/32		F17	F17-1	Write Protection (0x0020:0x0031)					F25-2		SyncManager Event Times (+0x8[7:6])	
F3	F3-1	Slave Category	Position addressing				F6-6		Enhanced Link Detection supported				F9-3		PDI Control register value (0x0140:0x0141)	4		F18	F18-1	Data Link Layer Features	ECAT Reset (0x0040)				F25-3		Buffer state (+0x5[7:6])	
	F3-2		Node addressing				F6-7		FX PHY support (native)				F9-4		Control/Status signals:	7/0			F18-2		PDI Reset (0x0041)				F25-4		SyncManager Sequential mode	
	F3-3		Logical addressing				F6-8		PHY reset out signals				F9-5		LATCH_IN				F18-3		ESC DL Control (0x0100:0x0103) bytes				F25-5		SyncManager deactivation delay	
	F3-4		Broadcast addressing				F6-9		Link detection using PHY signal (LED)				F9-6		SOF				F18-4		EtherCAT only mode (0x0100[0])			F26	F26-1	Distributed Clocks	Width	64
F4	F4-1	Physical Layer General Features	FIFO Size configurable (0x0100[18:16])				F6-10		MI link status and configuration				F9-7		OUTVALID				F18-5		Temporary loop control (0x0100[1])				F26-2		Sync/Latch signals	2
	F4-2		FIFO Size default from SII EEPROM	-			F6-11		MI controllable by PDI (0x0516:0x0517)				F9-8		WD_TRIG				F18-6		FIFO Size configurable (0x0100[18:16])				F26-3		SyncManager Event Times (0x09F0:0x09FF)	
	F4-3		Auto-Forwarder checks CRC and SOF				F6-12		MI read error (0x0510[13])				F9-9		OE_CONF				F18-7		Configured Station Address (0x0010:0x0011)				F26-4		DC Receive Times	
	F4-4		Forwarded RX Error indication, detection and				F6-13		MI PHY configuration update status (0x0518[5])				F9-10		OE_EXT				F18-8		Configured Station Alias (0x0100[24],0x0012:0x0013)				F26-5		DC Time Loop Control controllable by PDI	
	F4-5		Counter (0x0308:0x030B)				F6-14		MI preamble suppression				F9-11		EEPROM_				F18-9		Physical Read/Write Offset (0x0108:0x0109)				F26-6		DC Sync/Latch activation (0x0140[11:10])	
	F4-6		Lost Link Counter (0x0310:0x0313)				F6-15		Additional MCLK				F9-12		Loaded			F19	F19-1	Application Layer Features	Extended AL Control/Status bits (0x0120[15:5],0x0130[15:5])				F26-7		Propagation delay measurement with traffic(BWR/FPWR 0x900 detected at each port)	
	F4-7		Prevention of circulating frames				F6-16		Gigabit PHY configuration				F9-13		WD_STATE				F19-2		AL Status Emulation (0x0140[8])				F26-8		LatchSignal state in Latch Status register(0x09AE:0x09AF)	
	F4-8		Fallback: Port 0 opens if all ports are closed				F6-17		Gigabit PHY register 9 detection				F9-14		EOF				F19-3		AL Status Code (0x0134:0x0135)				F26-9		SyncSignal Auto-Activation (0x0981[3])	
	F4-9		VLAN Tag and IP/UDP support				F6-18		FX PHY configuration				F9-15		Granularity of direction configuration [bits]	2		F20	F20-1	Interrupts	ECAT Event Mask (0x0200:0x0201)				F26-10		SyncSignal 32 or 64 bit Start Time (0x0981[4])	
	F4-10		Enhanced Link Detection per port configurable				F6-19		Transparent Mode				F9-16		Bidirectional mode				F20-2		AL Event Mask (0x0204:0x0207)				F26-11		SyncSignal Late Activation (0x0981[6:5])	
						F7	F7-1	MII Features	CLK25OUT as PHY clock source				F9-17		Output high-Z if WD expired				F20-3		ECAT Event Request (0x0210:0x0211)				F26-12		SyncSignal debug pulse (0x0981[7])	
							F7-2		Bootstrap TX Shift settings				F9-18		Output 0 if WD expired				F20-4		AL Event Request (0x0220:0x0223)				F26-13		SyncSignal Activation State 0x0984)	
							F7-3		Automatic TX Shift setting (with TX_CLK)				F9-19		Output with EOF				F20-5		SyncManager activation changed (0x0220[4])				F26-14		Reset filters after writing filter depth	
							F7-4		TX Shift not necessary (PHY TX_CLK as clocksource)				F9-20		Output with DC SyncSignals				F20-6		SyncManager watchdog expiration (0x0220[6])			F27	F27-1	ESC Specific Registers (0x0E00:0x0EFF)	Product and Vendor ID	
							F7-5		FIFO size reduction steps	1			F9-21		Input with SOF			F21	F21-1	Error Counters	RX Error Counter (0x0300:0x0307)				F27-2		POR Values	
													F9-22		Input with DC SyncSignals				F21-2		Forwarded RX Error Counter (0x0308:0x030B)				F27-3		FPGA Update (online)	
												F10	F10-1	SPI Slave PDI	Max. SPI clock [MHz]	20			F21-3		ECAT Processing Unit Error Counter (0x030C)			F28	F28-1	Process RAM and User RAM	Process RAM (0x1000 ff.) [Kbyte]	8
													F10-2		SPI modes configurable (0x0150[1:0])				F21-4		PDI Error Counter (0x030D)				F28-2		User RAM (0x0F80:0x0FFF)	
													F10-3		SPI_IRQ driver configurable (0x0150[3:2])				F21-5		Lost Link Counter (0x0310:0x0313)				F28-3		Extended ESC Feature Availability in User RAM	
													F10-4		SPI_SEL polarity configurable (0x0150[4])			F22	F22-1	Watchdog	Watchdog Divider configurable (0x0400:0x0401)				F28-4		RAM initialization	
													F10-5		Data out sample mode configurable (0x0150[5])				F22-2		Watchdog Process Data			F29	F29-1	Additional EEPROMs	[object Object],[object Object],[object Object]	
													F10-6		Busy signaling				F22-3		Watchdog PDI				F29-2		FPGA configuration EEPROM	
													F10-7		Wait State byte(s)				F22-4		Watchdog Counter Process Data (0x0442)			F30	F30-1	LED Signals	RUN LED	
													F10-8		Number of address extension byte(s)	any			F22-5		Watchdog Counter PDI (0x0443)				F30-2		RUN LED override	
													F10-9		2/4 Byte SPI master support										F30-3		Link/Activity(x) LED per port	
													F10-10		Extended error detection (read busy violation)										F30-4		PERR(x) LED per port	
													F10-11		SPI_IRQ delay										F30-5		Device ERR LED	
													F10-12		Status indication										F30-6		STATE_RUN LED	
													F10-13		EEPROM_Loaded signal									F31	F31-1	Optional LED states	RUN LED: Bootstrap	
												F11	F11-1	Asynchronous uController PDI	0x0152:0x0153										F31-2		RUN LED: Booting	
													F11-2		ADR[15:13] available (000b if not available)										F31-3		RUN LED: Device identification	
													F11-3		EEPROM_Loaded signal										F31-4		RUN LED: loading SII EEPROM	
													F11-4		RD polarity configurable (0x0150[7])										F31-5		Error LED: SII EEPROM loading error	
													F11-5		Read BUSY delay (0x0152[0])										F31-6		Error LED: Invalid hardware configuration	
													F11-6		Write after first edge (0x0152[2])										F31-7		Error LED: Process data watchdog timeout	
													F11-7		Default BUSY state										F31-8		Error LED: PDI watchdog timeout	
												F12	F12-1	Synchronous uController PDI	EEPROM_Loaded signal										F31-9		Error LED: Error Indication 0x0130[4]	
																									F31-10		Link/Activity: port closed	
																									F31-11		Link/Activity: local auto-negotiation error	
																									F31-12		Link/Activity: remote auto-negotiation error	
																									F31-13		Link/Activity: unknown PHY auto-negotiation error LED test	

===== [tab: Register] =====
	Address	Length
(Byte)	Description																					
	0x0000-0x0FFF	4KB	Register																					
	0x1000-0x2FFF	8KB	Ram(Process Data)																					
	Address	Length
(Byte)	Description			Address	Length
(Byte)	Description			Address	Length
(Byte)	Description			Address	Length
(Byte)	Description			Address	Length
(Byte)		Description
	0x0000	1	Type			0x0140	1	PDI Control			0x0400-0x0401	2	Watchdog Divider			0x0900-0x090F	4x4	DC – Receive Times			0x0E00-0x0E03	4		Power-On Values [Bits]
	0x0001	1	Revision					0x00:Interface deactivated (no PDI)			0x0402-0x040F	-	-	-		0x0910-0x0917	8	DC – System Time			0x0E00	[1:0]	P_MODE[1:0]	[object Object],[object Object],[object Object]
	0x0002-0x003	2	Build					0x04:Digital I/O			0x0410-0x0411	2	Watchdog Time PDI			0x0918-0x091F	8	DC – Receive Time EPU						[object Object],[object Object],[object Object]
	0x0004	1	FMMUs supported					0x05:SPI Slave			0x0412-0x041F	-	-	-		0x0920-0x0927	8	DC – System Time Offset						[object Object],[object Object],[object Object]
	0x0005	1	SyncManagers supported					0x08:16 Bit asynchronous			0x0420-0x0421	2	Watchdog Time Process Data			0x0928-0x092B	4	DC – System Time Delay						[object Object],[object Object],[object Object]
	0x0006	1	RAM Size					0x09:8 Bit asynchronous			0x0422-0x043F	-	-	-		0x092C-0x092F	4	DC – System Time Difference				[5:2]	P_CONF[3:0]	[object Object],[object Object],[object Object],[object Object],[object Object]
	0x0007	1	Port Descriptor(Port configuration)					0x0A:16 Bit synchronous			0x0440-0x0441	2	Watchdog Status Process Data			0x0930-0x0931	2	DC – Speed Counter Start						[object Object],[object Object],[object Object],[object Object],[object Object]
			00: Not implemented					0x0B:8 Bit synchronous			0x0442	1	Watchdog Counter Process Data			0x0932-0x0933	2	DC – Speed Counter Diff						[object Object],[object Object],[object Object],[object Object],[object Object]
			01: Not configured (SII EEPROM)			0x0141	1	ESC Configuration			0x0443	1	Watchdog Counter PDI			0x0934	1	DC – System Time Difference Filter Depth						[object Object],[object Object],[object Object],[object Object],[object Object]
			10: EBUS				[0]	Device emulation (control of AL status)			0x0424-0x04FF	-	-	-		0x0935	1	DC – Speed Counter Filter Depth				[7:6]	CLK_MODE[1:0]
(CPU clock output)	[object Object],[object Object],[object Object]
			11: MII / RMII / RGMII					AL status register has to be set by PDI			0x0500-0x050F	16	SII EEPROM Interface			0x0936	1	DC – Receive Time Latch mode						[object Object],[object Object],[object Object]
		[1:0]	Port 0					AL status register will be set to value written to AL control register			0x0510-0x0515	6	MII Management Interface			0x0980	1	DC – Cyclic Unit Control						[object Object],[object Object],[object Object]
		[3:2]	Port 1				[1]	Enhanced Link detection all ports			0x0516-0x0517	2	MII Management Access State			0x0981	1	DC – Activation						[object Object],[object Object],[object Object]
		[5:4]	Port 2					disabled (if bits [7:4]=0)			0x0518-0x051B	4	PHY Port Status[3:0]			0x0982-0x0983	2	DC – Pulse length of SyncSignals			0x0E01	[1:0]	C25_SHI	[object Object],[object Object],[object Object]
		[7:6]	Port 3					enabled at all ports (overrides bits [7:4])			0x051C-0x05FF	-	-	-		0x0984	1	DC – Activation Status						00: MII TX signals shifted by 0°
	0x0008-0x0009	2	ESC Features supported				[2]	Distributed Clocks SYNC Out Unit			0x0600-0x06FC	16x13	FMMU[15:0]			0x098E	1	DC – SYNC0 Status						01: MII TX signals shifted by 90°
	0x000A-0x000F	-	-	-				disabled (power saving)			0x06FD-0x07FF	-	-	-		0x098F	1	DC – SYNC1 Status						10: MII TX signals shifted by 180°
	0x0010-0x0011	2	Configured Station Address					enabled			0x0800-0x087F	16x8	SyncManager[15:0]			0x0990-0x0997	8	DC – Next Time Cyclic Operation/Next SYNC0 Pulse						11: MII TX signals shifted by 270°
	0x0012-0x0013	2	Configured Station Alias				[3]	Distributed Clocks Latch In Unit			0x0880-0x0FFF	-	-	-		0x0998-0x099F	8	DC – Next SYNC1 Pulse				[2]	C25_ENA	CLK25 Output Enable (C25_ENA):
	0x0014-0x001F	-	-	-				disabled (power saving)								0x09A0-0x09A3	4	DC – SYNC0 Cycle Time						0: Disabled – PDI[31] available as PDI port
	0x0020	1	Write Register Enable					enabled								0x09A4-0x09A7	4	DC – SYNC1 Cycle Time						[object Object],[object Object],[object Object]
	0x0021	1	Write Register Protection				[4:7]	Enhanced Link port 0/1/2/3								0x09A8	1	DC – Latch0 Control				[3]	TRANS_MODE_ENA	Transparent Mode MII
	0x0022-0x002F	-	-	-				[object Object],[object Object],[object Object]								0x09A9	1	DC – Latch1 Control						[object Object],[object Object],[object Object]
	0x0030	1	ESC Write Enable					[object Object],[object Object],[object Object]								0x09AE	1	DC – Latch0 Status						[object Object],[object Object],[object Object]
	0x0031	1	ESC Write Protection			0x0142-0x014D	-	-	-							0x09AF	1	DC – Latch1 Status				[4]	CTRL_STATUS_MOVE	Digital Control/State Move
	0x0032-0x003F	-	-	-		0x014E-0x014F	2	PDI Information								0x09B0-0x09B7	8	DC – Latch0 Positive Edge						0: Control/Status signals are mapped to 
PDI[39:32] – if available
	0x0040	1	ESC Reset ECAT			0x0150	1	PDI Configuration								0x09B8-0x09BF	8	DC – Latch0 Negative Edge						1: Control/Status signals are remapped to 
the highest available PDI Byte
	0x0041	1	ESC Reset PDI			0x0151	1	DC Sync/Latch Configuration								0x09C0-0x09C7	8	DC – Latch1 Positive Edge				[5]	PHYAD_OFF	PHY Address Offset
	0x0042-0x00FF	-	-	-		0x0152-0x0153	2	Extended PDI Configuration								0x09C8-0x09CF	8	DC – Latch1 Negative Edge						0: No PHY address offset
	0x0100-0x0101	2	ESC DL Control			0x0154-0x01FF	-	-	-							0x09F0-0x09F3	4	DC – EtherCAT Buffer Change Event Time						1: PHY address offset is 16
	0x0102-0x0103	2	Extended ESC DL Control			0x0200-0x0201	2	ECAT Event Mask								0x09F8-0x09FB	4	DC – PDI Buffer Start Event Time				[6]	LINKPOL	PHY Link Polarity
	0x0104-0x0107	-	-	-		0x0202-0x0203	-	-	-							0x09FC-0x09FF	4	DC – PDI Buffer Change Event Time						0: LINK_MII is active low
	0x0108-0x0109	2	Physical Read/Write Offset			0x0204-0x0207	4	PDI AL Event Mask																1: LINK_MII is active high
	0x010A-0x010F	-	-	-		0x0218-0x0211	2	ECAT Event Request													0x0E00-0x0E07	8		Product ID
	0x0110-0x0111	2	ESC DL Status			0x0212-0x021F	-	-	-												0x0E08-0x0E0F	8		Vendor ID
	0x0112-0x011F	-	-	-		0x0220-0x0223	4	AL Event Request													0x0E10	1		ESC Health Status
	0x0120	1	AL Control			0x0224-0x02FF	-	-	-												0x0F00-0x0F03	4		Digital I/O Output Data
	0x0120-0x0121	2	AL Control			0x0300-0x0307	4x2	Rx Error Counter[3:0]													0x0F10-0x0F17	8		General Purpose Outputs [Byte]
	0x0122-0x012F	-	-	-		0x0308-0x030B	4x1	Forwarded Rx Error counter[3:0]													0x0F18-0x0F1F	8		General Purpose Inputs [Byte]
	0x0130	1	AL Status			0x030C	4	ECAT Processing Unit Error Counter													0x0F80-0x0FFF	128		User RAM
	0x0130-0x0131	2	AL Status			0x030D	1	PDI Error Counter													0x1000-0x1003	4		Digital I/O Input Data
	0x0134-0x0135	2	AL Status Code			0x030E	1	PDI Error Code													0x1000 ff.			Process Data RAM [Kbyte]
	0x0136-0x0137	-	-	-		0x030F	-	-	-															
	0x0138	1	RUN LED Override			0x0310-0x0313	4x1	Lost Link Counter[3:0]																
	0x0139	1	ERR LED Override			0x0314-0x03FF	-	-	-															
	0x013A-0x013F	-	-	-																				

===== [tab: 0x150~0x153] =====
Registers	Address		Description					
		Bit	PDI 
Digital I/O	PDI 
SPI Slave	PDI 
asynchronous Microcontroller	PDI 
Synchronous Microcontroller 	EtherCAT Bridge	PDI 
On-chip bus
		[0]	OUTVALID polarity					
			0: Active high					
			1: Active low					
		[1]	OUTVALID mode					
			0: Output event signaling					
			1：Process Data Watchdog trigger 
(WD_TRIG) signaling on OUTVALID pin 
(see SyncManager). Output data is 
updated if watchdog is triggered. 
Overrides 0x0150[7:6]					
		[2]						
		[3]						
		[4]						
		[5]						
		[6]						
		[7]						

===== [tab: PDI_MII_EBUS] =====
																		Register PDI Control (0x0140)							
																		0x09/0x08	0x0B/0x0A	0x05	[object Object],[object Object],[object Object],[object Object]				
	P_MODE[1:0]		PORT0	PORT1	PORT2	PORT3			P_CONF[3:0]	PORTs	PORT0	PORT1	PORT2	PORT3	MII	EBUS		Async. uC	Sync. uC	SPI	0	1			
	00	2 ports	√	√	X	X		F-1	4'bx000	2 ports	EBUS(0)	EBUS(1)	X	X	0	2		8/16Bit	8/16Bit	SPI+32 Bit GPI/O	32Bit I/O+control/status signals				
	01	3 ports	√	√	√	X		F-2	4'bx001		MII(0)	EBUS(1)	X	X	1	1		8/16Bit	8/16Bit	SPI+32 Bit GPI/O	32Bit I/O+control/status signals				
	10	3 ports	√	√	X	√		F-3	4'bx010		EBUS(0)	MII(1)	X	X	1	1		8/16Bit	8/16Bit	SPI+32 Bit GPI/O	32Bit I/O+control/status signals				
	11	4 ports	√	√	√	√	√	F-4	4'bx011		MII(0)	MII(1)	X	X	2	0									
								F-5	4'bx000	3 ports	EBUS(0)	EBUS(1)	EBUS(2)	X	0	3		8/16Bit	8/16Bit	SPI+32 Bit GPI/O	32Bit I/O+control/status signals				
								F-6	4'bx001		MII(0)	EBUS(1)	EBUS(2)	X	1	2		8/16Bit	8/16Bit	SPI+32 Bit GPI/O	32Bit I/O+control/status signals				
								F-7	4'bx010		EBUS(0)	MII(1)	EBUS(2)	X	1	2		8/16Bit	8/16Bit	SPI+32 Bit GPI/O	32Bit I/O+control/status signals				
								F-8	4'bx011		MII(0)	MII(1)	EBUS(2)	X	2	1		8/16Bit	8/16Bit	SPI+32 Bit GPI/O	32Bit I/O+control/status signals				
								F-9	4'bx100		EBUS(0)	EBUS(1)	MII(2)	X	1	2		8/16Bit	8/16Bit	SPI+32 Bit GPI/O	32Bit I/O+control/status signals				
								F-10	4'bx101		MII(0)	EBUS(1)	MII(2)	X	2	1		8/16Bit	8/16Bit	SPI+32 Bit GPI/O	32Bit I/O+control/status signals				
								F-11	4'bx110		EBUS(0)	MII(1)	MII(2)	X	2	1		8/16Bit	8/16Bit	SPI+32 Bit GPI/O	32Bit I/O+control/status signals				
								F-12	4'bx111		MII(0)	MII(1)	MII(2)	X	3	0		8Bit	8Bit	SPI+24 Bit GPI/O	32Bit I/O	24Bit I/O+ control/status signals			
								F-13	4'bx000	3 ports	EBUS(0)	EBUS(1)	X	EBUS(3)	0	3		8/16Bit	8/16Bit	SPI+32 Bit GPI/O	32Bit I/O+control/status signals				
								F-14	4'bx001		MII(0)	EBUS(1)	X	EBUS(3)	1	2		8/16Bit	8/16Bit	SPI+32 Bit GPI/O	32Bit I/O+control/status signals				
								F-15	4'bx010		EBUS(0)	MII(1)	X	EBUS(3)	1	2		8/16Bit	8/16Bit	SPI+32 Bit GPI/O	32Bit I/O+control/status signals				
								F-16	4'bx011		MII(0)	MII(1)	X	EBUS(3)	2	1		8/16Bit	8/16Bit	SPI+32 Bit GPI/O	32Bit I/O+control/status signals				
								F-17	4'bx100		EBUS(0)	EBUS(1)	X	MII(3)	1	2		8/16Bit	8/16Bit	SPI+32 Bit GPI/O	32Bit I/O+control/status signals				
								F-18	4'bx101		MII(0)	EBUS(1)	X	MII(3)	2	1		8/16Bit	8/16Bit	SPI+32 Bit GPI/O	32Bit I/O+control/status signals				
								F-19	4'bx110		EBUS(0)	MII(1)	X	MII(3)	2	1		8/16Bit	8/16Bit	SPI+32 Bit GPI/O	32Bit I/O+control/status signals				
								F-20	4'bx111		MII(0)	MII(1)	X	MII(3)	3	0		8Bit	8Bit	SPI+24 Bit GPI/O	32Bit I/O	24Bit I/O+control/status signals			
								F-21	4'b0000	4 ports	EBUS(0)	EBUS(1)	EBUS(2)	EBUS(3)	0	4		-	-	SPI+16Bit GPI/O	24Bit I/O + control/status signals				
								F-22	4'b0001		MII(0)	EBUS(1)	EBUS(2)	EBUS(3)	1	3		-	-	SPI+16Bit GPI/O	24Bit I/O + control/status signals				
								F-23	4'b0010		EBUS(0)	MII(1)	EBUS(2)	EBUS(3)	1	3		-	-	SPI+16Bit GPI/O	24Bit I/O + control/status signals				
								F-24	4'b0011		MII(0)	MII(1)	EBUS(2)	EBUS(3)	2	2		-	-	SPI+16Bit GPI/O	24Bit I/O + control/status signals				
								F-25	4'b0100		EBUS(0)	EBUS(1)	MII(2)	EBUS(3)	1	3		-	-	SPI+16Bit GPI/O	24Bit I/O + control/status signals				
								F-26	4'b0101		MII(0)	EBUS(1)	MII(2)	EBUS(3)	2	2		-	-	SPI+16Bit GPI/O	24Bit I/O + control/status signals				                                                                     
								F-27	4'b0110		EBUS(0)	MII(1)	MII(2)	EBUS(3)	2	2		-	-	SPI+16Bit GPI/O	24Bit I/O + control/status signals				
								F-28	4'b0111		MII(0)	MII(1)	MII(2)	EBUS(3)	3	1		-	-	SPI+16Bit GPI/O	24 Bit I/O	16Bit I/O+ control/status signals			
								F-29	4'b1000		EBUS(0)	EBUS(1)	EBUS(2)	MII(3)	1	3		-	-	SPI+16Bit GPI/O	24Bit I/O + control/status signals				
								F-30	4'b1001		MII(0)	EBUS(1)	EBUS(2)	MII(3)	2	2		-	-	SPI+16Bit GPI/O	24Bit I/O + control/status signals				
								F-31	4'b1010		EBUS(0)	MII(1)	EBUS(2)	MII(3)	2	2		-	-	SPI+16Bit GPI/O	24Bit I/O + control/status signals				
								F-32	4'b1011		MII(0)	MII(1)	EBUS(2)	MII(3)	3	1		-	-	SPI+16Bit GPI/O	24 Bit I/O	16Bit I/O+ control/status signals			
								F-33	4'b1100		EBUS(0)	EBUS(1)	MII(2)	MII(3)	2	2									
								F-34	4'b1101		MII(0)	EBUS(1)	MII(2)	MII(3)	3	1		-	-	SPI+16Bit GPI/O	24 Bit I/O	16Bit I/O+ control/status signals			
								F-35	4'b1110		EBUS(0)	MII(1)	MII(2)	MII(3)	3	1		-	-	SPI+16Bit GPI/O	24 Bit I/O	16Bit I/O+ control/status signals			
								F-36	4'b1111		MII(0)	MII(1)	MII(2)	MII(3)	4	0		-	-	SPI+8Bit GPI/O	16Bit I/O	8Bit I/O+ control/status signals			

===== [tab: PIN] =====
																					8/16 Asynchronous UC controller						8/16 Synchronous UC controller							Mapping of SPI Interface to Port (1)				Mapping of SPI Interface to Port (2)					
				[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object]		[object Object],[object Object],[object Object],[object Object],[object Object]				[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object]		[object Object],[object Object],[object Object],[object Object],[object Object]				[object Object],[object Object],[object Object],[object Object],[object Object]					2 ports, or 3 ports 
with min. 1xEBUS				3xMII, 0xEBUS		2 ports, or 3 ports 
with min. 1xEBUS				3xMII, 0xEBUS			2 ports, or 3 ports 
with min. 1xEBUS		3xMII, 
0xEBUS		4 ports, 
min. 2x EBUS		3xMII, 
1xEBUS		4xMII	
	PDI					CTRL_STATUS_MOVE=0		CTRL_STATUS_MOVE=1				CTRL_STATUS_MOVE=0		CTRL_STATUS_MOVE=1		CTRL_STATUS_MOVE=0		CTRL_STATUS_MOVE=1			8 bit		16 bit		8 bit		8 bit		16 bit		8 bit												
		number		signal	dir	signal	dir	signal	dir	signal	dir	signal	dir	signal	dir	signal	dir	signal	dir		signal	dir	signal	dir	signal	dir	signal	dir	signal	dir	signal	dir		signal	dir	signal	dir	signal	dir	signal	dir	signal	dir
	Byte0	PDI[0]	D12	IO[0]	IO/BD	IO[0]	IO/BD	IO[0]	IO/BD	IO[0]	IO/BD	IO[0]	IO/BD	IO[0]	IO/BD	IO[0]	IO/BD	IO[0]	IO/BD		CS	I	CS	I	CS	I	CS	I	CS	I	CS	I		SPI_CLK	I	SPI_CLK	I	SPI_CLK	I	SPI_CLK	I	SPI_CLK	I
		PDI[1]	D11	IO[1]	IO/BD	IO[1]	IO/BD	IO[1]	IO/BD	IO[1]	IO/BD	IO[1]	IO/BD	IO[1]	IO/BD	IO[1]	IO/BD	IO[1]	IO/BD		RD	I	RD	I	RD	I	RD	I	RD	I	RD	I		SPI_SEL	I	SPI_SEL	I	SPI_SEL	I	SPI_SEL	I	SPI_SEL	I
		PDI[2]	C12	IO[2]	IO/BD	IO[2]	IO/BD	IO[2]	IO/BD	IO[2]	IO/BD	IO[2]	IO/BD	IO[2]	IO/BD	IO[2]	IO/BD	IO[2]	IO/BD		WR	I	WR	I	WR	I	WR	I	WR	I	WR	I		SPI_DI	I	SPI_DI	I	SPI_DI	I	SPI_DI	I	SPI_DI	I
		PDI[3]	C11	IO[3]	IO/BD	IO[3]	IO/BD	IO[3]	IO/BD	IO[3]	IO/BD	IO[3]	IO/BD	IO[3]	IO/BD	IO[3]	IO/BD	IO[3]	IO/BD		BUSY	O	BUSY	O	BUSY	O	BUSY	O	BUSY	O	BUSY	O		SPI_DO	O	SPI_DO	O	SPI_DO	O	SPI_DO	O	SPI_DO	O
		PDI[4]	B12	IO[4]	IO/BD	IO[4]	IO/BD	IO[4]	IO/BD	IO[4]	IO/BD	IO[4]	IO/BD	IO[4]	IO/BD	IO[4]	IO/BD	IO[4]	IO/BD		IRQ	O	IRQ	O	IRQ	O	IRQ	O	IRQ	O	IRQ	O		SPI_IRQ	O	SPI_IRQ	O	SPI_IRQ	O	SPI_IRQ	O	SPI_IRQ	O
		PDI[5]	C10	IO[5]	IO/BD	IO[5]	IO/BD	IO[5]	IO/BD	IO[5]	IO/BD	IO[5]	IO/BD	IO[5]	IO/BD	IO[5]	IO/BD	IO[5]	IO/BD		BHE	I	BHE	I	BHE	I	BHE	I	BHE	I	BHE	I		-	-	-	-	-	-	-	-	-	-
		PDI[6]	A12	IO[6]	IO/BD	IO[6]	IO/BD	IO[6]	IO/BD	IO[6]	IO/BD	IO[6]	IO/BD	IO[6]	IO/BD	IO[6]	IO/BD	IO[6]	IO/BD		EEPROM_LOADED	O	EEPROM_LOADED	O	EEPROM_LOADED	O	EEPROM_LOADED	O	EEPROM_LOADED	O	EEPROM_LOADED	O		EEPROM_LOADED	O	EEPROM_LOADED	O	EEPROM_LOADED	O	EEPROM_LOADED	O	EEPROM_LOADED	O
		PDI[7]	B11	[object Object],[object Object],[object Object]	IO/BD/O	[object Object],[object Object],[object Object]	IO/BD/O	[object Object],[object Object],[object Object]	IO/BD/O	[object Object],[object Object],[object Object]	IO/BD/O	[object Object],[object Object],[object Object]	IO/BD/O	[object Object],[object Object],[object Object]	IO/BD/O	[object Object],[object Object],[object Object]	IO/BD/O	[object Object],[object Object],[object Object]	IO/BD/O		[object Object],[object Object],[object Object]	I/O	[object Object],[object Object],[object Object]	I/O	[object Object],[object Object],[object Object]	I/O	[object Object],[object Object],[object Object]	I/O	[object Object],[object Object],[object Object]	I/O	[object Object],[object Object],[object Object]	I/O		[object Object],[object Object],[object Object]	-/O	[object Object],[object Object],[object Object]	-/O	[object Object],[object Object],[object Object]	-/O	[object Object],[object Object],[object Object]	-/O	[object Object],[object Object],[object Object]	-/O
	Byte1	PDI[8]	A11	IO[8]	IO/BD	IO[8]	IO/BD	IO[8]	IO/BD	IO[8]	IO/BD	IO[8]	IO/BD	IO[8]	IO/BD	IO[8]	IO/BD	SOF	O		ADR[14]	I	ADR[14]	I	ADR[14]	I	ADR[14]	I	ADR[14]	I	ADR[14]	I		GPO[0]	O	GPO[0]	O	GPO[0]	O	GPO[0]	O	GPO[0]	O
		PDI[9]	B10	IO[9]	IO/BD	IO[9]	IO/BD	IO[9]	IO/BD	IO[9]	IO/BD	IO[9]	IO/BD	IO[9]	IO/BD	IO[9]	IO/BD	OE_EXT	I		ADR[13]	I	ADR[13]	I	ADR[13]	I	ADR[13]	I	ADR[13]	I	ADR[13]	I		GPO[1]	O	GPO[1]	O	GPO[1]	O	GPO[1]	O	GPO[1]	O
		PDI[10]	A10	IO[10]	IO/BD	IO[10]	IO/BD	IO[10]	IO/BD	IO[10]	IO/BD	IO[10]	IO/BD	IO[10]	IO/BD	IO[10]	IO/BD	OUTVALID	O		ADR[12]	I	ADR[12]	I	ADR[12]	I	ADR[12]	I	ADR[12]	I	ADR[12]	I		GPO[2]	O	GPO[2]	O	GPO[2]	O	GPO[2]	O	GPO[2]	O
		PDI[11]	C9	IO[11]	IO/BD	IO[11]	IO/BD	IO[11]	IO/BD	IO[11]	IO/BD	IO[11]	IO/BD	IO[11]	IO/BD	IO[11]	IO/BD	WD_TRIG	O		ADR[11]	I	ADR[11]	I	ADR[11]	I	ADR[11]	I	ADR[11]	I	ADR[11]	I		GPO[3]	O	GPO[3]	O	GPO[3]	O	GPO[3]	O	GPO[3]	O
		PDI[12]	A9	IO[12]	IO/BD	IO[12]	IO/BD	IO[12]	IO/BD	IO[12]	IO/BD	IO[12]	IO/BD	IO[12]	IO/BD	IO[12]	IO/BD	LATCH_IN	I		ADR[10]	I	ADR[10]	I	ADR[10]	I	ADR[10]	I	ADR[10]	I	ADR[10]	I		GPI[0]	I	GPI[0]	I	GPI[0]	I	GPI[0]	I	GPI[0]	I
		PDI[13]	B9	IO[13]	IO/BD	IO[13]	IO/BD	IO[13]	IO/BD	IO[13]	IO/BD	IO[13]	IO/BD	IO[13]	IO/BD	IO[13]	IO/BD	OE_CONF	I		ADR[9]	I	ADR[9]	I	ADR[9]	I	ADR[9]	I	ADR[9]	I	ADR[9]	I		GPI[1]	I	GPI[1]	I	GPI[1]	I	GPI[1]	I	GPI[1]	I
		PDI[14]	A8	IO[14]	IO/BD	IO[14]	IO/BD	IO[14]	IO/BD	IO[14]	IO/BD	IO[14]	IO/BD	IO[14]	IO/BD	IO[14]	IO/BD	EEPROM_LOADED	O		ADR[8]	I	ADR[8]	I	ADR[8]	I	ADR[8]	I	ADR[8]	I	ADR[8]	I		GPI[2]	I	GPI[2]	I	GPI[2]	I	GPI[2]	I	GPI[2]	I
		PDI[15]	B8	IO[15]	IO/BD	IO[15]	IO/BD	IO[15]	IO/BD	IO[15]	IO/BD	IO[15]	IO/BD	IO[15]	IO/BD	IO[15]	IO/BD	-	-		ADR[7]	I	ADR[7]	I	ADR[7]	I	ADR[7]	I	ADR[7]	I	ADR[7]	I		GPI[3]	I	GPI[3]	I	GPI[3]	I	GPI[3]	I	GPI[3]	I
	Byte2	PDI[16]	A7	IO[16]	IO/BD	IO[16]	IO/BD	IO[16]	IO/BD	IO[16]	IO/BD	IO[16]	IO/BD	SOF	O	MII(3)_RX_ERR	IO/BD	MII(3)_RX_ERR	IO/BD		ADR[6]	I	ADR[6]	I	ADR[6]	I	ADR[6]	I	ADR[6]	I	ADR[6]	I		GPO[4]	O	GPO[4]	O	GPO[4]	O	GPO[4]	O	MII(3)_RX_ERR	IO/BD
		PDI[17]	B7	IO[17]	IO/BD	IO[17]	IO/BD	IO[17]	IO/BD	IO[17]	IO/BD	IO[17]	IO/BD	OE_EXT	I	MII(3)_RX_CLK	IO/BD	MII(3)_RX_CLK	IO/BD		ADR[5]	I	ADR[5]	I	ADR[5]	I	ADR[5]	I	ADR[5]	I	ADR[5]	I		GPO[5]	O	GPO[5]	O	GPO[5]	O	GPO[5]	O	MII(3)_RX_CLK	IO/BD
		PDI[18]	A6	IO[18]	IO/BD	IO[18]	IO/BD	IO[18]	IO/BD	IO[18]	IO/BD	IO[18]	IO/BD	OUTVALID	O	MII(3)_RX_D[0]	IO/BD	MII(3)_RX_D[0]	IO/BD		ADR[4]	I	ADR[4]	I	ADR[4]	I	ADR[4]	I	ADR[4]	I	ADR[4]	I		GPO[6]	O	GPO[6]	O	GPO[6]	O	GPO[6]	O	MII(3)_RX_D[0]	IO/BD
		PDI[19]	B6	IO[19]	IO/BD	IO[19]	IO/BD	IO[19]	IO/BD	IO[19]	IO/BD	IO[19]	IO/BD	WD_TRIG	O	MII(3)_RX_D[2]	IO/BD	MII(3)_RX_D[2]	IO/BD		ADR[3]	I	ADR[3]	I	ADR[3]	I	ADR[3]	I	ADR[3]	I	ADR[3]	I		GPO[7]	O	GPO[7]	O	GPO[7]	O	GPO[7]	O	MII(3)_RX_D[2]	IO/BD
		PDI[20]	A5	IO[20]	IO/BD	IO[20]	IO/BD	IO[20]	IO/BD	IO[20]	IO/BD	IO[20]	IO/BD	LATCH_IN	I	MII(3)_RX_D[3]	IO/BD	MII(3)_RX_D[3]	IO/BD		ADR[2]	I	ADR[2]	I	ADR[2]	I	ADR[2]	I	ADR[2]	I	ADR[2]	I		GPI[4]	I	GPI[4]	I	GPI[4]	I	GPI[4]	I	MII(3)_RX_D[3]	IO/BD
LINK_MII(3)		PDI[21]	B5	IO[21]	IO/BD	IO[21]	IO/BD	IO[21]	IO/BD	IO[21]	IO/BD	IO[21]	IO/BD	OE_CONF	I	MII(3)_LINK_MII	IO/BD	MII(3)_LINK_MII	IO/BD		ADR[1]	I	ADR[1]	I	ADR[1]	I	ADR[1]	I	ADR[1]	I	ADR[1]	I		GPI[5]	I	GPI[5]	I	GPI[5]	I	GPI[5]	I	MII(3)_LINK_MII	IO/BD
		PDI[22]	A4	IO[22]	IO/BD	IO[22]	IO/BD	IO[22]	IO/BD	IO[22]	IO/BD	IO[22]	IO/BD	EEPROM_LOADED	O	MII(3)_TX_D[3]	IO/BD	MII(3)_TX_D[3]	IO/BD		ADR[0]	I	ADR[0]	I	ADR[0]	I	ADR[0]	I	ADR[0]	I	ADR[0]	I		GPI[6]	I	GPI[6]	I	GPI[6]	I	GPI[6]	I	MII(3)_TX_D[3]	IO/BD
		PDI[23]	B4	IO[23]	IO/BD	IO[23]	IO/BD	IO[23]	IO/BD	IO[23]	IO/BD	IO[23]	IO/BD	-	-	MII(3)_TX_D[2]	IO/BD	MII(3)_TX_D[2]	IO/BD		DATA[0]	BD	DATA[0]	BD	DATA[0]	BD	DATA[0]	BD	DATA[0]	BD	DATA[0]	BD		GPI[7]	I	GPI[7]	I	GPI[7]	I	GPI[7]	I	MII(3)_TX_D[2]	IO/BD
	Byte3	PDI[24]	A3	IO[24]	IO/BD	IO[24]	IO/BD	SOF	O	EBUS(3)_TX-	O	EBUS(3)_TX-	O	EBUS(3)_TX-	O	MII(3)_TX_D[1]	IO/BD	MII(3)_TX_D[1]	IO/BD		DATA[1]	BD	DATA[1]	BD	DATA[1]	BD	DATA[1]	BD	DATA[1]	BD	DATA[1]	BD		GPO[8]	O	GPO[8]	O	EBUS(3)_TX-	O	EBUS(3)_TX-	O	MII(3)_TX_D[1]	IO/BD
		PDI[25]	B3	IO[25]	IO/BD	IO[25]	IO/BD	OE_EXT	I	-	-	-	-	-	-	MII(3)_TX_D[0]	IO/BD	MII(3)_TX_D[0]	IO/BD		DATA[2]	BD	DATA[2]	BD	DATA[2]	BD	DATA[2]	BD	DATA[2]	BD	DATA[2]	BD		GPO[9]	O	GPO[9]	O	-	-	-	-	MII(3)_TX_D[0]	IO/BD
		PDI[26]	A2	IO[26]	IO/BD	IO[26]	IO/BD	OUTVALID	O	EBUS(3)_TX+	O	EBUS(3)_TX+	O	EBUS(3)_TX+	O	MII(3)_TX_ENA	IO/BD	MII(3)_TX_ENA	IO/BD		DATA[3]	BD	DATA[3]	BD	DATA[3]	BD	DATA[3]	BD	DATA[3]	BD	DATA[3]	BD		GPO[10]	O	GPO[10]	O	EBUS(3)_TX+	O	EBUS(3)_TX+	O	MII(3)_TX_ENA	IO/BD
		PDI[27]	A1	IO[27]	IO/BD	IO[27]	IO/BD	WD_TRIG	O	EBUS(3)_RX-	I	EBUS(3)_RX-	I	EBUS(3)_RX-	I	MII(3)_RX_DV	IO/BD	MII(3)_RX_DV	IO/BD		DATA[4]	BD	DATA[4]	BD	DATA[4]	BD	DATA[4]	BD	DATA[4]	BD	DATA[4]	BD		GPO[11]	O	GPO[11]	O	EBUS(3)_RX-	I	EBUS(3)_RX-	I	MII(3)_RX_DV	IO/BD
[object Object],[object Object],[object Object]		PDI[28]	B2	IO[28]	IO/BD	IO[28]	IO/BD	LATCH_IN	I	-	-	-	-	-	-	-	IO/BD	-	IO/BD		DATA[5]	BD	DATA[5]	BD	DATA[5]	BD	DATA[5]	BD	DATA[5]	BD	DATA[5]	BD		GPI[8]	I	GPI[8]	I	-	-	-	-	-	IO/BD
		PDI[29]	B1	IO[29]	IO/BD	IO[29]	IO/BD	OE_CONF	I	EBUS(3)_RX+	I	EBUS(3)_RX+	I	EBUS(3)_RX+	I	MII(3)_RX_D[1]	IO/BD	MII(3)_RX_D[1]	IO/BD		DATA[6]	BD	DATA[6]	BD	DATA[6]	BD	DATA[6]	BD	DATA[6]	BD	DATA[6]	BD		GPI[9]	I	GPI[9]	I	EBUS(3)_RX+	I	EBUS(3)_RX+	I	MII(3)_RX_D[1]	IO/BD
[object Object],[object Object]		PDI[30]	C2	IO[30]	IO/BD	IO[30]	IO/BD	EEPROM_LOADED	O	-	-	-	-	-	-	-	IO/BD	-	IO/BD		DATA[7]	BD	DATA[7]	BD	DATA[7]	BD	DATA[7]	BD	DATA[7]	BD	DATA[7]	BD		GPI[10]	I	GPI[10]	I	-	-	-	-	-	IO/BD
		PDI[31]	C1	[object Object],[object Object],[object Object]	IO/BD/O	[object Object],[object Object],[object Object]	IO/BD/O	-	-	-	-	-	-	-	-	-	-	-	-		[object Object],[object Object]	-/O	[object Object],[object Object]	-/O	[object Object],[object Object]	-/O	CPU_CLK_IN	I	CPU_CLK_IN	I	CPU_CLK_IN	I		GPI[11]	I	[object Object],[object Object],[object Object]	I/O	-	-	-	-	-	-
	Byte4	PDI[32]	D1	SOF	O	MII(2)_TX_D[3]		MII(2)_TX_D[3]		SOF	O	MII(2)_TX_D[3]		MII(2)_TX_D[3]		MII(2)_TX_D[3]		MII(2)_TX_D[3]			-	-	DATA[8]	BD	MII(2)_TX_D[3]		-	-	DATA[8]	BD	MII(2)_TX_D[3]			GPO[12]	O	MII(2)_TX_D[3]		GPO[12]	O	MII(2)_TX_D[3]		MII(2)_TX_D[3]	
		PDI[33]	D2	OE_EXT	I	MII(2)_TX_D[2]		MII(2)_TX_D[2]		OE_EXT	I	MII(2)_TX_D[2]		MII(2)_TX_D[2]		MII(2)_TX_D[2]		MII(2)_TX_D[2]			-	-	DATA[9]	BD	MII(2)_TX_D[2]		-	-	DATA[9]	BD	MII(2)_TX_D[2]			GPO[13]	O	MII(2)_TX_D[2]		GPO[13]	O	MII(2)_TX_D[2]		MII(2)_TX_D[2]	
CTRL_STATUS_MOVE		PDI[34]	E2	OUTVALID	O	MII(2)_TX_D[0]		MII(2)_TX_D[0]		OUTVALID	O	MII(2)_TX_D[0]		MII(2)_TX_D[0]		MII(2)_TX_D[0]		MII(2)_TX_D[0]			-	-	DATA[10]	BD	MII(2)_TX_D[0]		-	-	DATA[10]	BD	MII(2)_TX_D[0]			GPO[14]	O	MII(2)_TX_D[0]		GPO[14]	O	MII(2)_TX_D[0]		MII(2)_TX_D[0]	
		PDI[35]	G1	WD_TRIG	O	MII(2)_RX_ERR		MII(2)_RX_ERR		WD_TRIG	O	MII(2)_RX_ERR		MII(2)_RX_ERR		MII(2)_RX_ERR		MII(2)_RX_ERR			-	-	DATA[11]	BD	MII(2)_RX_ERR		-	-	DATA[11]	BD	MII(2)_RX_ERR			GPO[15]	O	MII(2)_RX_ERR		GPO[15]	O	MII(2)_RX_ERR		MII(2)_RX_ERR	
		PDI[36]	G2	LATCH_IN	I	MII(2)_RX_CLK		MII(2)_RX_CLK		LATCH_IN	I	MII(2)_RX_CLK		MII(2)_RX_CLK		MII(2)_RX_CLK		MII(2)_RX_CLK			-	-	DATA[12]	BD	MII(2)_RX_CLK		-	-	DATA[12]	BD	MII(2)_RX_CLK			GPI[12]	I	MII(2)_RX_CLK		GPI[12]	I	MII(2)_RX_CLK		MII(2)_RX_CLK	
		PDI[37]	H2	OE_CONF	I	MII(2)_RX_D[0]		MII(2)_RX_D[0]		OE_CONF	I	MII(2)_RX_D[0]		MII(2)_RX_D[0]		MII(2)_RX_D[0]		MII(2)_RX_D[0]			-	-	DATA[13]	BD	MII(2)_RX_D[0]		-	-	DATA[13]	BD	MII(2)_RX_D[0]			GPI[13]	I	MII(2)_RX_D[0]		GPI[13]	I	MII(2)_RX_D[0]		MII(2)_RX_D[0]	
		PDI[38]	J2	EEPROM_LOADED	O	MII(2)_RX_D[2]		MII(2)_RX_D[2]		EEPROM_LOADED	O	MII(2)_RX_D[2]		MII(2)_RX_D[2]		MII(2)_RX_D[2]		MII(2)_RX_D[2]			-	-	DATA[14]	BD	MII(2)_RX_D[2]		-	-	DATA[14]	BD	MII(2)_RX_D[2]			GPI[14]	I	MII(2)_RX_D[2]		GPI[14]	I	MII(2)_RX_D[2]		MII(2)_RX_D[2]	
		PDI[39]	K10	-	-	MII(2)_RX_D[3]		MII(2)_RX_D[3]		/	/	MII(2)_RX_D[3]		MII(2)_RX_D[3]		MII(2)_RX_D[3]		MII(2)_RX_D[3]			-	-	DATA[15]	BD	MII(2)_RX_D[3]		-	-	DATA[15]	BD	MII(2)_RX_D[3]			GPI[15]	I	MII(2)_RX_D[3]		GPI[15]	I	MII(2)_RX_D[3]		MII(2)_RX_D[3]	
[object Object],[object Object]			F2	-		[object Object],[object Object]		[object Object],[object Object]		-		[object Object],[object Object]		[object Object],[object Object]		[object Object],[object Object]		[object Object],[object Object]			-		-		[object Object],[object Object]		-		-		[object Object],[object Object]			-		[object Object],[object Object]		-		[object Object],[object Object]		[object Object],[object Object]	
			E1	EBUS(2)_TX-		MII(2)_TX_D[1]		MII(2)_TX_D[1]		EBUS(2)_TX-		[object Object],[object Object]		[object Object],[object Object]		MII(2)_TX_D[1]		MII(2)_TX_D[1]			EBUS(2)_TX-		EBUS(2)_TX-		MII(2)_TX_D[1]		EBUS(2)_TX-		EBUS(2)_TX-		MII(2)_TX_D[1]			EBUS(2)_TX-		MII(2)_TX_D[1]		EBUS(2)_TX-		MII(2)_TX_D[1]		MII(2)_TX_D[1]	
			F1	EBUS(2)_TX+		MII(2)_TX_ENA		MII(2)_TX_ENA		EBUS(2)_TX+		[object Object],[object Object]		[object Object],[object Object]		MII(2)_TX_ENA		MII(2)_TX_ENA			EBUS(2)_TX+		EBUS(2)_TX+		MII(2)_TX_ENA		EBUS(2)_TX+		EBUS(2)_TX+		MII(2)_TX_ENA			EBUS(2)_TX+		MII(2)_TX_ENA		EBUS(2)_TX+		MII(2)_TX_ENA		MII(2)_TX_ENA	
			H1	EBUS(2)_RX-		MII(2)_RX_DV		MII(2)_RX_DV		EBUS(2)_RX-		[object Object],[object Object]		[object Object],[object Object]		MII(2)_RX_DV		MII(2)_RX_DV			EBUS(2)_RX-		EBUS(2)_RX-		MII(2)_RX_DV		EBUS(2)_RX-		EBUS(2)_RX-		MII(2)_RX_DV			EBUS(2)_RX-		MII(2)_RX_DV		EBUS(2)_RX-		MII(2)_RX_DV		MII(2)_RX_DV	
			J1	EBUS(2)_RX+		MII(2)_RX_D[1]		MII(2)_RX_D[1]		EBUS(2)_RX+		[object Object],[object Object]		[object Object],[object Object]		MII(2)_RX_D[1]		MII(2)_RX_D[1]			EBUS(2)_RX+		EBUS(2)_RX+		MII(2)_RX_D[1]		EBUS(2)_RX+		EBUS(2)_RX+		MII(2)_RX_D[1]			EBUS(2)_RX+		MII(2)_RX_D[1]		EBUS(2)_RX+		MII(2)_RX_D[1]		MII(2)_RX_D[1]	
LINK_MII(1)			K3	MII(1)_LINK_MII		MII(1)_LINK_MII		MII(1)_LINK_MII		MII(1)_LINK_MII		MII(1)_LINK_MII		MII(1)_LINK_MII		MII(1)_LINK_MII		MII(1)_LINK_MII			MII(1)_LINK_MII		MII(1)_LINK_MII		MII(1)_LINK_MII		MII(1)_LINK_MII		MII(1)_LINK_MII		MII(1)_LINK_MII			MII(1)_LINK_MII		MII(1)_LINK_MII		MII(1)_LINK_MII		MII(1)_LINK_MII		MII(1)_LINK_MII	
			K4	MII(1)_RX_CLK		MII(1)_RX_CLK		MII(1)_RX_CLK		MII(1)_RX_CLK		MII(1)_RX_CLK		MII(1)_RX_CLK		MII(1)_RX_CLK		MII(1)_RX_CLK			MII(1)_RX_CLK		MII(1)_RX_CLK		MII(1)_RX_CLK		MII(1)_RX_CLK		MII(1)_RX_CLK		MII(1)_RX_CLK			MII(1)_RX_CLK		MII(1)_RX_CLK		MII(1)_RX_CLK		MII(1)_RX_CLK		MII(1)_RX_CLK	
			M4	[object Object],[object Object]		MII(1)_RX_DV		MII(1)_RX_DV		[object Object],[object Object]		[object Object],[object Object]		[object Object],[object Object]		MII(1)_RX_DV		MII(1)_RX_DV			[object Object],[object Object]		[object Object],[object Object]		MII(1)_RX_DV		[object Object],[object Object]		[object Object],[object Object]		MII(1)_RX_DV			[object Object],[object Object]		MII(1)_RX_DV		[object Object],[object Object]		MII(1)_RX_DV		MII(1)_RX_DV	
			L4	MII(1)_RX_D[0]		MII(1)_RX_D[0]		MII(1)_RX_D[0]		MII(1)_RX_D[0]		MII(1)_RX_D[0]		MII(1)_RX_D[0]		MII(1)_RX_D[0]		MII(1)_RX_D[0]			MII(1)_RX_D[0]		MII(1)_RX_D[0]		MII(1)_RX_D[0]		MII(1)_RX_D[0]		MII(1)_RX_D[0]		MII(1)_RX_D[0]			MII(1)_RX_D[0]		MII(1)_RX_D[0]		MII(1)_RX_D[0]		MII(1)_RX_D[0]		MII(1)_RX_D[0]	
			M5	[object Object],[object Object]		MII(1)_RX_D[1]		MII(1)_RX_D[1]		[object Object],[object Object]		[object Object],[object Object]		[object Object],[object Object]		MII(1)_RX_D[1]		MII(1)_RX_D[1]			[object Object],[object Object]		[object Object],[object Object]		MII(1)_RX_D[1]		[object Object],[object Object]		[object Object],[object Object]		MII(1)_RX_D[1]			[object Object],[object Object]		MII(1)_RX_D[1]		[object Object],[object Object]		MII(1)_RX_D[1]		MII(1)_RX_D[1]	
			L5	MII(1)_RX_D[2]		MII(1)_RX_D[2]		MII(1)_RX_D[2]		MII(1)_RX_D[2]		MII(1)_RX_D[2]		MII(1)_RX_D[2]		MII(1)_RX_D[2]		MII(1)_RX_D[2]			MII(1)_RX_D[2]		MII(1)_RX_D[2]		MII(1)_RX_D[2]		MII(1)_RX_D[2]		MII(1)_RX_D[2]		MII(1)_RX_D[2]			MII(1)_RX_D[2]		MII(1)_RX_D[2]		MII(1)_RX_D[2]		MII(1)_RX_D[2]		MII(1)_RX_D[2]	
			M6	MII(1)_RX_D[3]		MII(1)_RX_D[3]		MII(1)_RX_D[3]		MII(1)_RX_D[3]		MII(1)_RX_D[3]		MII(1)_RX_D[3]		MII(1)_RX_D[3]		MII(1)_RX_D[3]			MII(1)_RX_D[3]		MII(1)_RX_D[3]		MII(1)_RX_D[3]		MII(1)_RX_D[3]		MII(1)_RX_D[3]		MII(1)_RX_D[3]			MII(1)_RX_D[3]		MII(1)_RX_D[3]		MII(1)_RX_D[3]		MII(1)_RX_D[3]		MII(1)_RX_D[3]	
			L6	MII(1)_RX_ERR		MII(1)_RX_ERR		MII(1)_RX_ERR		MII(1)_RX_ERR		MII(1)_RX_ERR		MII(1)_RX_ERR		MII(1)_RX_ERR		MII(1)_RX_ERR			MII(1)_RX_ERR		MII(1)_RX_ERR		MII(1)_RX_ERR		MII(1)_RX_ERR		MII(1)_RX_ERR		MII(1)_RX_ERR			MII(1)_RX_ERR		MII(1)_RX_ERR		MII(1)_RX_ERR		MII(1)_RX_ERR		MII(1)_RX_ERR	
			M3	[object Object],[object Object]		MII(1)_TX_ENA		MII(1)_TX_ENA		[object Object],[object Object]		[object Object],[object Object]		[object Object],[object Object]		MII(1)_TX_ENA		MII(1)_TX_ENA			[object Object],[object Object]		[object Object],[object Object]		MII(1)_TX_ENA		[object Object],[object Object]		[object Object],[object Object]		MII(1)_TX_ENA			[object Object],[object Object]		MII(1)_TX_ENA		[object Object],[object Object]		MII(1)_TX_ENA		MII(1)_TX_ENA	
TRANS_MODE_ENA			L3	MII(1)_TX_D[0]		MII(1)_TX_D[0]		MII(1)_TX_D[0]		MII(1)_TX_D[0]		MII(1)_TX_D[0]		MII(1)_TX_D[0]		MII(1)_TX_D[0]		MII(1)_TX_D[0]			MII(1)_TX_D[0]		MII(1)_TX_D[0]		MII(1)_TX_D[0]		MII(1)_TX_D[0]		MII(1)_TX_D[0]		MII(1)_TX_D[0]			MII(1)_TX_D[0]		MII(1)_TX_D[0]		MII(1)_TX_D[0]		MII(1)_TX_D[0]		MII(1)_TX_D[0]	
			M2	[object Object],[object Object]		MII(1)_TX_D[1]		MII(1)_TX_D[1]		[object Object],[object Object]		[object Object],[object Object]		[object Object],[object Object]		MII(1)_TX_D[1]		MII(1)_TX_D[1]			[object Object],[object Object]		[object Object],[object Object]		MII(1)_TX_D[1]		[object Object],[object Object]		[object Object],[object Object]		MII(1)_TX_D[1]			[object Object],[object Object]		MII(1)_TX_D[1]		[object Object],[object Object]		MII(1)_TX_D[1]		MII(1)_TX_D[1]	
P_MODE[0]【0xE00[0]】			L2	MII(1)_TX_D[2]		MII(1)_TX_D[2]		MII(1)_TX_D[2]		MII(1)_TX_D[2]		MII(1)_TX_D[2]		MII(1)_TX_D[2]		MII(1)_TX_D[2]		MII(1)_TX_D[2]			MII(1)_TX_D[2]		MII(1)_TX_D[2]		MII(1)_TX_D[2]		MII(1)_TX_D[2]		MII(1)_TX_D[2]		MII(1)_TX_D[2]			MII(1)_TX_D[2]		MII(1)_TX_D[2]		MII(1)_TX_D[2]		MII(1)_TX_D[2]		MII(1)_TX_D[2]	
P_MODE[1]【0xE00[1]】			M1	MII(1)_TX_D[3]		MII(1)_TX_D[3]		MII(1)_TX_D[3]		MII(1)_TX_D[3]		MII(1)_TX_D[3]		MII(1)_TX_D[3]		MII(1)_TX_D[3]		MII(1)_TX_D[3]			MII(1)_TX_D[3]		MII(1)_TX_D[3]		MII(1)_TX_D[3]		MII(1)_TX_D[3]		MII(1)_TX_D[3]		MII(1)_TX_D[3]			MII(1)_TX_D[3]		MII(1)_TX_D[3]		MII(1)_TX_D[3]		MII(1)_TX_D[3]		MII(1)_TX_D[3]	
LINK_MII(0)			L9	MII(0)_LINK_MII		MII(0)_LINK_MII		MII(0)_LINK_MII		MII(0)_LINK_MII		MII(0)_LINK_MII		MII(0)_LINK_MII		MII(0)_LINK_MII		MII(0)_LINK_MII			MII(0)_LINK_MII		MII(0)_LINK_MII		MII(0)_LINK_MII		MII(0)_LINK_MII		MII(0)_LINK_MII		MII(0)_LINK_MII			MII(0)_LINK_MII		MII(0)_LINK_MII		MII(0)_LINK_MII		MII(0)_LINK_MII		MII(0)_LINK_MII	
			L10	MII(0)_RX_CLK		MII(0)_RX_CLK		MII(0)_RX_CLK		MII(0)_RX_CLK		MII(0)_RX_CLK		MII(0)_RX_CLK		MII(0)_RX_CLK		MII(0)_RX_CLK			MII(0)_RX_CLK		MII(0)_RX_CLK		MII(0)_RX_CLK		MII(0)_RX_CLK		MII(0)_RX_CLK		MII(0)_RX_CLK			MII(0)_RX_CLK		MII(0)_RX_CLK		MII(0)_RX_CLK		MII(0)_RX_CLK		MII(0)_RX_CLK	
			M11	[object Object],[object Object]		MII(0)_RX_DV		MII(0)_RX_DV		[object Object],[object Object]		[object Object],[object Object]		[object Object],[object Object]		MII(0)_RX_DV		MII(0)_RX_DV			[object Object],[object Object]		[object Object],[object Object]		MII(0)_RX_DV		[object Object],[object Object]		[object Object],[object Object]		MII(0)_RX_DV			[object Object],[object Object]		MII(0)_RX_DV		[object Object],[object Object]		MII(0)_RX_DV		MII(0)_RX_DV	
			K10	MII(0)_RX_D[0]		MII(0)_RX_D[0]		MII(0)_RX_D[0]		MII(0)_RX_D[0]		MII(0)_RX_D[0]		MII(0)_RX_D[0]		MII(0)_RX_D[0]		MII(0)_RX_D[0]			MII(0)_RX_D[0]		MII(0)_RX_D[0]		MII(0)_RX_D[0]		MII(0)_RX_D[0]		MII(0)_RX_D[0]		MII(0)_RX_D[0]			MII(0)_RX_D[0]		MII(0)_RX_D[0]		MII(0)_RX_D[0]		MII(0)_RX_D[0]		MII(0)_RX_D[0]	
			M12	[object Object],[object Object]		MII(0)_RX_D[1]		MII(0)_RX_D[1]		[object Object],[object Object]		[object Object],[object Object]		[object Object],[object Object]		MII(0)_RX_D[1]		MII(0)_RX_D[1]			[object Object],[object Object]		[object Object],[object Object]		MII(0)_RX_D[1]		[object Object],[object Object]		[object Object],[object Object]		MII(0)_RX_D[1]			[object Object],[object Object]		MII(0)_RX_D[1]		[object Object],[object Object]		MII(0)_RX_D[1]		MII(0)_RX_D[1]	
			L11	MII(0)_RX_D[2]		MII(0)_RX_D[2]		MII(0)_RX_D[2]		MII(0)_RX_D[2]		MII(0)_RX_D[2]		MII(0)_RX_D[2]		MII(0)_RX_D[2]		MII(0)_RX_D[2]			MII(0)_RX_D[2]		MII(0)_RX_D[2]		MII(0)_RX_D[2]		MII(0)_RX_D[2]		MII(0)_RX_D[2]		MII(0)_RX_D[2]			MII(0)_RX_D[2]		MII(0)_RX_D[2]		MII(0)_RX_D[2]		MII(0)_RX_D[2]		MII(0)_RX_D[2]	
			L12	MII(0)_RX_D[3]		MII(0)_RX_D[3]		MII(0)_RX_D[3]		MII(0)_RX_D[3]		MII(0)_RX_D[3]		MII(0)_RX_D[3]		MII(0)_RX_D[3]		MII(0)_RX_D[3]			MII(0)_RX_D[3]		MII(0)_RX_D[3]		MII(0)_RX_D[3]		MII(0)_RX_D[3]		MII(0)_RX_D[3]		MII(0)_RX_D[3]			MII(0)_RX_D[3]		MII(0)_RX_D[3]		MII(0)_RX_D[3]		MII(0)_RX_D[3]		MII(0)_RX_D[3]	
			M10	MII(0)_RX_ERR		MII(0)_RX_ERR		MII(0)_RX_ERR		MII(0)_RX_ERR		MII(0)_RX_ERR		MII(0)_RX_ERR		MII(0)_RX_ERR		MII(0)_RX_ERR			MII(0)_RX_ERR		MII(0)_RX_ERR		MII(0)_RX_ERR		MII(0)_RX_ERR		MII(0)_RX_ERR		MII(0)_RX_ERR			MII(0)_RX_ERR		MII(0)_RX_ERR		MII(0)_RX_ERR		MII(0)_RX_ERR		MII(0)_RX_ERR	
			M9	[object Object],[object Object]		MII(0)_TX_ENA		MII(0)_TX_ENA		[object Object],[object Object]		[object Object],[object Object]		[object Object],[object Object]		MII(0)_TX_ENA		MII(0)_TX_ENA			[object Object],[object Object]		[object Object],[object Object]		MII(0)_TX_ENA		[object Object],[object Object]		[object Object],[object Object]		MII(0)_TX_ENA			[object Object],[object Object]		MII(0)_TX_ENA		[object Object],[object Object]		MII(0)_TX_ENA		MII(0)_TX_ENA	
C25_ENA			L8	MII(0)_TX_D[0]		MII(0)_TX_D[0]		MII(0)_TX_D[0]		MII(0)_TX_D[0]		MII(0)_TX_D[0]		MII(0)_TX_D[0]		MII(0)_TX_D[0]		MII(0)_TX_D[0]			MII(0)_TX_D[0]		MII(0)_TX_D[0]		MII(0)_TX_D[0]		MII(0)_TX_D[0]		MII(0)_TX_D[0]		MII(0)_TX_D[0]			MII(0)_TX_D[0]		MII(0)_TX_D[0]		MII(0)_TX_D[0]		MII(0)_TX_D[0]		MII(0)_TX_D[0]	
			M8	[object Object],[object Object]		MII(0)_TX_D[1]		MII(0)_TX_D[1]		[object Object],[object Object]		[object Object],[object Object]		[object Object],[object Object]		MII(0)_TX_D[1]		MII(0)_TX_D[1]			[object Object],[object Object]		[object Object],[object Object]		MII(0)_TX_D[1]		[object Object],[object Object]		[object Object],[object Object]		MII(0)_TX_D[1]			[object Object],[object Object]		MII(0)_TX_D[1]		[object Object],[object Object]		MII(0)_TX_D[1]		MII(0)_TX_D[1]	
C25_SHI[0]			L7	MII(0)_TX_D[2]		MII(0)_TX_D[2]		MII(0)_TX_D[2]		MII(0)_TX_D[2]		MII(0)_TX_D[2]		MII(0)_TX_D[2]		MII(0)_TX_D[2]		MII(0)_TX_D[2]			MII(0)_TX_D[2]		MII(0)_TX_D[2]		MII(0)_TX_D[2]		MII(0)_TX_D[2]		MII(0)_TX_D[2]		MII(0)_TX_D[2]			MII(0)_TX_D[2]		MII(0)_TX_D[2]		MII(0)_TX_D[2]		MII(0)_TX_D[2]		MII(0)_TX_D[2]	
C25_SHI[1]			M7	MII(0)_TX_D[3]		MII(0)_TX_D[3]		MII(0)_TX_D[3]		MII(0)_TX_D[3]		MII(0)_TX_D[3]		MII(0)_TX_D[3]		MII(0)_TX_D[3]		MII(0)_TX_D[3]			MII(0)_TX_D[3]		MII(0)_TX_D[3]		MII(0)_TX_D[3]		MII(0)_TX_D[3]		MII(0)_TX_D[3]		MII(0)_TX_D[3]			MII(0)_TX_D[3]		MII(0)_TX_D[3]		MII(0)_TX_D[3]		MII(0)_TX_D[3]		MII(0)_TX_D[3]	
[object Object],[object Object]			J12	[object Object],[object Object]																																							
[object Object],[object Object]			L1	[object Object],[object Object]																																							
[object Object],[object Object]			E3	[object Object],[object Object]																																							
[object Object],[object Object],[object Object],[object Object]			C3	[object Object],[object Object],[object Object],[object Object]																																							
[object Object],[object Object],[object Object],[object Object],[object Object]			K2	[object Object],[object Object],[object Object],[object Object],[object Object]																																							
[object Object],[object Object],[object Object],[object Object],[object Object]			J11	[object Object],[object Object],[object Object],[object Object],[object Object]																																							
RBIAS			C4	RBIAS																																							
SYNC[0]/LATCH[0]			E11	SYNC[0]/LATCH[0]																																							
SYNC[1]/LATCH[1]			E12	SYNC[1]/LATCH[1]																																							
EEPROM_CLK			G11	EEPROM_CLK																																							
EEPROM_DATA			F11	EEPROM_DATA																																							
OSC_IN			G12	OSC_IN																																							
OSC_OUT			F12	OSC_OUT																																							
TESTMODE			H3	TESTMODE																																							
MI_CLK/LINPOL			K11	MI_CLK/LINPOL	BD																																						
MI_DATA			K12	MI_DATA	BD																																						

===== [tab: PDI-CFG] =====

===== [tab: PDI-DIGI] =====
			2 ports, or 3 ports 
with min. 1xEBUS		3xMII, 
0xEBUS				 		3xMII, 
1xEBUS				4xMII			
PDI					CTRL_STATUS_MOVE=0		CTRL_STATUS_MOVE=1				CTRL_STATUS_MOVE=0		CTRL_STATUS_MOVE=1		CTRL_STATUS_MOVE=0		CTRL_STATUS_MOVE=1	
	number		signal	dir	signal	dir	signal	dir	signal	dir	signal	dir	signal	dir	signal	dir	signal	dir
Byte0	PDI[0]	D12	IO[0]	IO/BD	IO[0]	IO/BD	IO[0]	IO/BD	IO[0]	IO/BD	IO[0]	IO/BD	IO[0]	IO/BD	IO[0]	IO/BD	IO[0]	IO/BD
	PDI[1]	D11	IO[1]	IO/BD	IO[1]	IO/BD	IO[1]	IO/BD	IO[1]	IO/BD	IO[1]	IO/BD	IO[1]	IO/BD	IO[1]	IO/BD	IO[1]	IO/BD
	PDI[2]	C12	IO[2]	IO/BD	IO[2]	IO/BD	IO[2]	IO/BD	IO[2]	IO/BD	IO[2]	IO/BD	IO[2]	IO/BD	IO[2]	IO/BD	IO[2]	IO/BD
	PDI[3]	C11	IO[3]	IO/BD	IO[3]	IO/BD	IO[3]	IO/BD	IO[3]	IO/BD	IO[3]	IO/BD	IO[3]	IO/BD	IO[3]	IO/BD	IO[3]	IO/BD
	PDI[4]	B12	IO[4]	IO/BD	IO[4]	IO/BD	IO[4]	IO/BD	IO[4]	IO/BD	IO[4]	IO/BD	IO[4]	IO/BD	IO[4]	IO/BD	IO[4]	IO/BD
	PDI[5]	C10	IO[5]	IO/BD	IO[5]	IO/BD	IO[5]	IO/BD	IO[5]	IO/BD	IO[5]	IO/BD	IO[5]	IO/BD	IO[5]	IO/BD	IO[5]	IO/BD
	PDI[6]	A12	IO[6]	IO/BD	IO[6]	IO/BD	IO[6]	IO/BD	IO[6]	IO/BD	IO[6]	IO/BD	IO[6]	IO/BD	IO[6]	IO/BD	IO[6]	IO/BD
	PDI[7]	B11	[object Object],[object Object],[object Object]	IO/BD/O	[object Object],[object Object],[object Object]	IO/BD/O	[object Object],[object Object],[object Object]	IO/BD/O	[object Object],[object Object],[object Object]	IO/BD/O	[object Object],[object Object],[object Object]	IO/BD/O	[object Object],[object Object],[object Object]	IO/BD/O	[object Object],[object Object],[object Object]	IO/BD/O	[object Object],[object Object],[object Object]	IO/BD/O
Byte1	PDI[8]	A11	IO[8]	IO/BD	IO[8]	IO/BD	IO[8]	IO/BD	IO[8]	IO/BD	IO[8]	IO/BD	IO[8]	IO/BD	IO[8]	IO/BD	SOF	O
	PDI[9]	B10	IO[9]	IO/BD	IO[9]	IO/BD	IO[9]	IO/BD	IO[9]	IO/BD	IO[9]	IO/BD	IO[9]	IO/BD	IO[9]	IO/BD	OE_EXT	I
	PDI[10]	A10	IO[10]	IO/BD	IO[10]	IO/BD	IO[10]	IO/BD	IO[10]	IO/BD	IO[10]	IO/BD	IO[10]	IO/BD	IO[10]	IO/BD	OUTVALID	O
	PDI[11]	C9	IO[11]	IO/BD	IO[11]	IO/BD	IO[11]	IO/BD	IO[11]	IO/BD	IO[11]	IO/BD	IO[11]	IO/BD	IO[11]	IO/BD	WD_TRIG	O
	PDI[12]	A9	IO[12]	IO/BD	IO[12]	IO/BD	IO[12]	IO/BD	IO[12]	IO/BD	IO[12]	IO/BD	IO[12]	IO/BD	IO[12]	IO/BD	LATCH_IN	I
	PDI[13]	B9	IO[13]	IO/BD	IO[13]	IO/BD	IO[13]	IO/BD	IO[13]	IO/BD	IO[13]	IO/BD	IO[13]	IO/BD	IO[13]	IO/BD	OE_CONF	I
	PDI[14]	A8	IO[14]	IO/BD	IO[14]	IO/BD	IO[14]	IO/BD	IO[14]	IO/BD	IO[14]	IO/BD	IO[14]	IO/BD	IO[14]	IO/BD	EEPROM_LOADED	O
	PDI[15]	B8	IO[15]	IO/BD	IO[15]	IO/BD	IO[15]	IO/BD	IO[15]	IO/BD	IO[15]	IO/BD	IO[15]	IO/BD	IO[15]	IO/BD	-	-
Byte2	PDI[16]	A7	[object Object],[object Object],[object Object]	IO/BD	[object Object],[object Object],[object Object]	IO/BD	IO[16]	IO/BD	IO[16]	IO/BD	IO[16]	IO/BD	SOF	O	MII(3)_RX_ERR	IO/BD	MII(3)_RX_ERR	IO/BD
	PDI[17]	B7	[object Object],[object Object],[object Object]	IO/BD	[object Object],[object Object],[object Object]	IO/BD	IO[17]	IO/BD	IO[17]	IO/BD	IO[17]	IO/BD	OE_EXT	I	MII(3)_RX_CLK	IO/BD	MII(3)_RX_CLK	IO/BD
	PDI[18]	A6	[object Object],[object Object],[object Object]	IO/BD	[object Object],[object Object],[object Object]	IO/BD	IO[18]	IO/BD	IO[18]	IO/BD	IO[18]	IO/BD	OUTVALID	O	MII(3)_RX_D[0]	IO/BD	MII(3)_RX_D[0]	IO/BD
	PDI[19]	B6	[object Object],[object Object],[object Object]	IO/BD	[object Object],[object Object],[object Object]	IO/BD	IO[19]	IO/BD	IO[19]	IO/BD	IO[19]	IO/BD	WD_TRIG	O	MII(3)_RX_D[2]	IO/BD	MII(3)_RX_D[2]	IO/BD
	PDI[20]	A5	[object Object],[object Object],[object Object]	IO/BD	[object Object],[object Object],[object Object]	IO/BD	IO[20]	IO/BD	IO[20]	IO/BD	IO[20]	IO/BD	LATCH_IN	I	MII(3)_RX_D[3]	IO/BD	MII(3)_RX_D[3]	IO/BD
	PDI[21]	B5	[object Object],[object Object],[object Object]	IO/BD	[object Object],[object Object],[object Object]	IO/BD	IO[21]	IO/BD	IO[21]	IO/BD	IO[21]	IO/BD	OE_CONF	I	MII(3)_LINK_MII	IO/BD	MII(3)_LINK_MII	IO/BD
	PDI[22]	A4	[object Object],[object Object],[object Object]	IO/BD	[object Object],[object Object],[object Object]	IO/BD	IO[22]	IO/BD	IO[22]	IO/BD	IO[22]	IO/BD	EEPROM_LOADED	O	MII(3)_TX_D[3]	IO/BD	MII(3)_TX_D[3]	IO/BD
	PDI[23]	B4	[object Object],[object Object],[object Object]	IO/BD	[object Object],[object Object],[object Object]	IO/BD	IO[23]	IO/BD	IO[23]	IO/BD	IO[23]	IO/BD	-	-	MII(3)_TX_D[2]	IO/BD	MII(3)_TX_D[2]	IO/BD
Byte3	PDI[24]	A3	[object Object],[object Object],[object Object],[object Object],[object Object]	IO/BD	[object Object],[object Object],[object Object]	IO/BD	SOF	O	EBUS(3)_TX-	O	EBUS(3)_TX-	O	EBUS(3)_TX-	O	MII(3)_TX_D[1]	IO/BD	MII(3)_TX_D[1]	IO/BD
	PDI[25]	B3	[object Object],[object Object],[object Object]	IO/BD	[object Object],[object Object],[object Object]	IO/BD	OE_EXT	I	-	-	-	-	-	-	MII(3)_TX_D[0]	IO/BD	MII(3)_TX_D[0]	IO/BD
	PDI[26]	A2	[object Object],[object Object],[object Object],[object Object],[object Object]	IO/BD	[object Object],[object Object],[object Object]	IO/BD	OUTVALID	O	EBUS(3)_TX+	O	EBUS(3)_TX+	O	EBUS(3)_TX+	O	MII(3)_RX_ENA	IO/BD	MII(3)_RX_ENA	IO/BD
	PDI[27]	A1	[object Object],[object Object],[object Object],[object Object],[object Object]	IO/BD	[object Object],[object Object],[object Object]	IO/BD	WD_TRIG	O	EBUS(3)_RX-	I	EBUS(3)_RX-	I	EBUS(3)_RX-	I	MII(3)_RX_DV	IO/BD	MII(3)_RX_DV	IO/BD
	PDI[28]	B2	IO[28]	IO/BD	IO[28]	IO/BD	LATCH_IN	I	-	-	-	-	-	-	-	IO/BD	-	IO/BD
	PDI[29]	B1	[object Object],[object Object],[object Object],[object Object],[object Object]	IO/BD	[object Object],[object Object],[object Object]	IO/BD	OE_CONF	I	EBUS(3)_RX+	I	EBUS(3)_RX+	I	EBUS(3)_RX+	I	MII(3)_RX_D[1]	IO/BD	MII(3)_RX_D[1]	IO/BD
	PDI[30]	C2	IO[30]	IO/BD	IO[30]	IO/BD	EEPROM_LOADED	O	-	-	-	-	-	-	-	IO/BD	-	IO/BD
	PDI[31]	C1	[object Object],[object Object],[object Object]	IO/BD/O	[object Object],[object Object],[object Object]	IO/BD/O	-	-	-	-	-	-	-	-	-	-	-	-
Byte4	PDI[32]	D1	SOF	O	MII(2)_TX_D[3]		MII(2)_TX_D[3]		SOF	O	MII(2)_TX_D[3]		MII(2)_TX_D[3]		MII(2)_TX_D[3]		MII(2)_TX_D[3]	
	PDI[33]	D2	OE_EXT	I	MII(2)_TX_D[2]		MII(2)_TX_D[2]		OE_EXT	I	MII(2)_TX_D[2]		MII(2)_TX_D[2]		MII(2)_TX_D[2]		MII(2)_TX_D[2]	
	PDI[34]	E2	OUTVALID	O	MII(2)_TX_D[0]		MII(2)_TX_D[0]		OUTVALID	O	MII(2)_TX_D[0]		MII(2)_TX_D[0]		MII(2)_TX_D[0]		MII(2)_TX_D[0]	
	PDI[35]	G1	WD_TRIG	O	MII(2)_RX_ERR		MII(2)_RX_ERR		WD_TRIG	O	MII(2)_RX_ERR		MII(2)_RX_ERR		MII(2)_RX_ERR		MII(2)_RX_ERR	
	PDI[36]	G2	LATCH_IN	I	MII(2)_RX_CLK		MII(2)_RX_CLK		LATCH_IN	I	MII(2)_RX_CLK		MII(2)_RX_CLK		MII(2)_RX_CLK		MII(2)_RX_CLK	
	PDI[37]	H2	OE_CONF	I	MII(2)_RX_D[0]		MII(2)_RX_D[0]		OE_CONF	I	MII(2)_RX_D[0]		MII(2)_RX_D[0]		MII(2)_RX_D[0]		MII(2)_RX_D[0]	
	PDI[38]	J2	EEPROM_LOADED	O	MII(2)_RX_D[2]		MII(2)_RX_D[2]		EEPROM_LOADED	O	MII(2)_RX_D[2]		MII(2)_RX_D[2]		MII(2)_RX_D[2]		MII(2)_RX_D[2]	
	PDI[39]	K10	-	-	MII(2)_RX_D[3]		MII(2)_RX_D[3]		/	/	MII(2)_RX_D[3]		MII(2)_RX_D[3]		MII(2)_RX_D[3]		MII(2)_RX_D[3]	

===== [tab: PDI-UC] =====
			8/16 Asynchronous UC controller						8/16 Synchronous UC controller					
			2 ports, or 3 ports 
with min. 1xEBUS				3xMII, 0xEBUS		2 ports, or 3 ports 
with min. 1xEBUS				3xMII, 0xEBUS	
PDI			8 bit		16 bit		8 bit		8 bit		16 bit		8 bit	
	number		signal	dir	signal	dir	signal	dir	signal	dir	signal	dir	signal	dir
Byte0	PDI[0]		CS	I	CS	I	CS	I	CS	I	CS	I	CS	I
	PDI[1]		RD	I	RD	I	RD	I	TS	I	TS	I	TS	I
	PDI[2]		WR	I	WR	I	WR	I	RD_nWR	I	RD_nWR	I	RD_nWR	I
	PDI[3]		BUSY	O	BUSY	O	BUSY	O	TA	O	TA	O	TA	O
	PDI[4]		IRQ	O	IRQ	O	IRQ	O	IRQ	O	IRQ	O	IRQ	O
	PDI[5]		BHE	I	BHE	I	BHE	I	BHE	I	BHE	I	BHE	I
	PDI[6]		EEPROM_LOADED	O	EEPROM_LOADED	O	EEPROM_LOADED	O	EEPROM_LOADED	O	EEPROM_LOADED	O	EEPROM_LOADED	O
	PDI[7]		[object Object],[object Object],[object Object]	I/O	[object Object],[object Object],[object Object]	I/O	[object Object],[object Object],[object Object]	I/O	[object Object],[object Object],[object Object]	I/O	[object Object],[object Object],[object Object]	I/O	[object Object],[object Object],[object Object]	I/O
Byte1	PDI[8]		ADR[14]	I	ADR[14]	I	ADR[14]	I	ADR[14]	I	ADR[14]	I	ADR[14]	I
	PDI[9]		ADR[13]	I	ADR[13]	I	ADR[13]	I	ADR[13]	I	ADR[13]	I	ADR[13]	I
	PDI[10]		ADR[12]	I	ADR[12]	I	ADR[12]	I	ADR[12]	I	ADR[12]	I	ADR[12]	I
	PDI[11]		ADR[11]	I	ADR[11]	I	ADR[11]	I	ADR[11]	I	ADR[11]	I	ADR[11]	I
	PDI[12]		ADR[10]	I	ADR[10]	I	ADR[10]	I	ADR[10]	I	ADR[10]	I	ADR[10]	I
	PDI[13]		ADR[9]	I	ADR[9]	I	ADR[9]	I	ADR[9]	I	ADR[9]	I	ADR[9]	I
	PDI[14]		ADR[8]	I	ADR[8]	I	ADR[8]	I	ADR[8]	I	ADR[8]	I	ADR[8]	I
	PDI[15]		ADR[7]	I	ADR[7]	I	ADR[7]	I	ADR[7]	I	ADR[7]	I	ADR[7]	I
Byte2	PDI[16]		ADR[6]	I	ADR[6]	I	ADR[6]	I	ADR[6]	I	ADR[6]	I	ADR[6]	I
	PDI[17]		ADR[5]	I	ADR[5]	I	ADR[5]	I	ADR[5]	I	ADR[5]	I	ADR[5]	I
	PDI[18]		ADR[4]	I	ADR[4]	I	ADR[4]	I	ADR[4]	I	ADR[4]	I	ADR[4]	I
	PDI[19]		ADR[3]	I	ADR[3]	I	ADR[3]	I	ADR[3]	I	ADR[3]	I	ADR[3]	I
	PDI[20]		ADR[2]	I	ADR[2]	I	ADR[2]	I	ADR[2]	I	ADR[2]	I	ADR[2]	I
	PDI[21]		ADR[1]	I	ADR[1]	I	ADR[1]	I	ADR[1]	I	ADR[1]	I	ADR[1]	I
	PDI[22]		ADR[0]	I	ADR[0]	I	ADR[0]	I	ADR[0]	I	ADR[0]	I	ADR[0]	I
	PDI[23]		DATA[0]	BD	DATA[0]	BD	DATA[0]	BD	DATA[0]	BD	DATA[0]	BD	DATA[0]	BD
Byte3	PDI[24]		DATA[1]	BD	DATA[1]	BD	DATA[1]	BD	DATA[1]	BD	DATA[1]	BD	DATA[1]	BD
	PDI[25]		DATA[2]	BD	DATA[2]	BD	DATA[2]	BD	DATA[2]	BD	DATA[2]	BD	DATA[2]	BD
	PDI[26]		DATA[3]	BD	DATA[3]	BD	DATA[3]	BD	DATA[3]	BD	DATA[3]	BD	DATA[3]	BD
	PDI[27]		DATA[4]	BD	DATA[4]	BD	DATA[4]	BD	DATA[4]	BD	DATA[4]	BD	DATA[4]	BD
	PDI[28]		DATA[5]	BD	DATA[5]	BD	DATA[5]	BD	DATA[5]	BD	DATA[5]	BD	DATA[5]	BD
	PDI[29]		DATA[6]	BD	DATA[6]	BD	DATA[6]	BD	DATA[6]	BD	DATA[6]	BD	DATA[6]	BD
	PDI[30]		DATA[7]	BD	DATA[7]	BD	DATA[7]	BD	DATA[7]	BD	DATA[7]	BD	DATA[7]	BD
	PDI[31]		[object Object],[object Object]	-/O	[object Object],[object Object]	-/O	[object Object],[object Object]	-/O	CPU_CLK_IN	I	CPU_CLK_IN	I	CPU_CLK_IN	I
Byte4	PDI[32]		-	-	DATA[8]	BD	MII(2)		-	-	DATA[8]	BD	MII(2)	
	PDI[33]		-	-	DATA[9]	BD			-	-	DATA[9]	BD		
	PDI[34]		-	-	DATA[10]	BD			-	-	DATA[10]	BD		
	PDI[35]		-	-	DATA[11]	BD			-	-	DATA[11]	BD		
	PDI[36]		-	-	DATA[12]	BD			-	-	DATA[12]	BD		
	PDI[37]		-	-	DATA[13]	BD			-	-	DATA[13]	BD		
	PDI[38]		-	-	DATA[14]	BD			-	-	DATA[14]	BD		
	PDI[39]		-	-	DATA[15]	BD			-	-	DATA[15]	BD		

===== [tab: PDI-SPI] =====
			Mapping of SPI Interface to Port (1)				Mapping of SPI Interface to Port (2)					
			2 ports, or 3 ports 
with min. 1xEBUS		3xMII, 0xEBUS		4 ports, 
min. 2x EBUS		3xMII, 1xEBUS		4xMII	
PDI												
	number		signal	dir	signal	dir	signal	dir	signal	dir	signal	dir
Byte0	PDI[0]		SPI_CLK	I	SPI_CLK	I	SPI_CLK	I	SPI_CLK	I	SPI_CLK	I
	PDI[1]		SPI_SEL	I	SPI_SEL	I	SPI_SEL	I	SPI_SEL	I	SPI_SEL	I
	PDI[2]		SPI_DI	I	SPI_DI	I	SPI_DI	I	SPI_DI	I	SPI_DI	I
	PDI[3]		SPI_DO	O	SPI_DO	O	SPI_DO	O	SPI_DO	O	SPI_DO	O
	PDI[4]		SPI_IRQ	O	SPI_IRQ	O	SPI_IRQ	O	SPI_IRQ	O	SPI_IRQ	O
	PDI[5]		-	-	-	-	-	-	-	-	-	-
	PDI[6]		EEPROM_LOADED	O	EEPROM_LOADED	O	EEPROM_LOADED	O	EEPROM_LOADED	O	EEPROM_LOADED	O
	PDI[7]		[object Object],[object Object],[object Object]	-/O	[object Object],[object Object],[object Object]	-/O	[object Object],[object Object],[object Object]	-/O	[object Object],[object Object],[object Object]	-/O	[object Object],[object Object],[object Object]	-/O
Byte1	PDI[8]		GPO[0]	O	GPO[0]	O	GPO[0]	O	GPO[0]	O	GPO[0]	O
	PDI[9]		GPO[1]	O	GPO[1]	O	GPO[1]	O	GPO[1]	O	GPO[1]	O
	PDI[10]		GPO[2]	O	GPO[2]	O	GPO[2]	O	GPO[2]	O	GPO[2]	O
	PDI[11]		GPO[3]	O	GPO[3]	O	GPO[3]	O	GPO[3]	O	GPO[3]	O
	PDI[12]		GPI[0]	I	GPI[0]	I	GPI[0]	I	GPI[0]	I	GPI[0]	I
	PDI[13]		GPI[1]	I	GPI[1]	I	GPI[1]	I	GPI[1]	I	GPI[1]	I
	PDI[14]		GPI[2]	I	GPI[2]	I	GPI[2]	I	GPI[2]	I	GPI[2]	I
	PDI[15]		GPI[3]	I	GPI[3]	I	GPI[3]	I	GPI[3]	I	GPI[3]	I
Byte2	PDI[16]		GPO[4]	O	GPO[4]	O	GPO[4]	O	GPO[4]	O	MII(3)_RX_ERR	IO/BD
	PDI[17]		GPO[5]	O	GPO[5]	O	GPO[5]	O	GPO[5]	O	MII(3)_RX_CLK	IO/BD
	PDI[18]		GPO[6]	O	GPO[6]	O	GPO[6]	O	GPO[6]	O	MII(3)_RX_D[0]	IO/BD
	PDI[19]		GPO[7]	O	GPO[7]	O	GPO[7]	O	GPO[7]	O	MII(3)_RX_D[2]	IO/BD
	PDI[20]		GPI[4]	I	GPI[4]	I	GPI[4]	I	GPI[4]	I	MII(3)_RX_D[3]	IO/BD
	PDI[21]		GPI[5]	I	GPI[5]	I	GPI[5]	I	GPI[5]	I	MII(3)_LINK_MII	IO/BD
	PDI[22]		GPI[6]	I	GPI[6]	I	GPI[6]	I	GPI[6]	I	MII(3)_TX_D[3]	IO/BD
	PDI[23]		GPI[7]	I	GPI[7]	I	GPI[7]	I	GPI[7]	I	MII(3)_TX_D[2]	IO/BD
Byte3	PDI[24]		GPO[8]	O	GPO[8]	O	EBUS(3)_TX-	O	EBUS(3)_TX-	O	MII(3)_TX_D[1]	IO/BD
	PDI[25]		GPO[9]	O	GPO[9]	O	-	-	-	-	MII(3)_TX_D[0]	IO/BD
	PDI[26]		GPO[10]	O	GPO[10]	O	EBUS(3)_TX+	O	EBUS(3)_TX+	O	MII(3)_RX_ENA	IO/BD
	PDI[27]		GPO[11]	O	GPO[11]	O	EBUS(3)_RX-	I	EBUS(3)_RX-	I	MII(3)_RX_DV	IO/BD
	PDI[28]		GPI[8]	I	GPI[8]	I	-	-	-	-	-	IO/BD
	PDI[29]		GPI[9]	I	GPI[9]	I	EBUS(3)_RX+	I	EBUS(3)_RX+	I	MII(3)_RX_D[1]	IO/BD
	PDI[30]		GPI[10]	I	GPI[10]	I	-	-	-	-	-	IO/BD
	PDI[31]		GPI[11]	I	[object Object],[object Object],[object Object]	I/O	-	-	-	-	-	-
Byte4	PDI[32]		GPO[12]	O	MII(2)_TX_D[3]		GPO[12]	O	MII(2)_TX_D[3]		MII(2)_TX_D[3]	
	PDI[33]		GPO[13]	O	MII(2)_TX_D[2]		GPO[13]	O	MII(2)_TX_D[2]		MII(2)_TX_D[2]	
	PDI[34]		GPO[14]	O	MII(2)_TX_D[0]		GPO[14]	O	MII(2)_TX_D[0]		MII(2)_TX_D[0]	
	PDI[35]		GPO[15]	O	MII(2)_RX_ERR		GPO[15]	O	MII(2)_RX_ERR		MII(2)_RX_ERR	
	PDI[36]		GPI[12]	I	MII(2)_RX_CLK		GPI[12]	I	MII(2)_RX_CLK		MII(2)_RX_CLK	
	PDI[37]		GPI[13]	I	MII(2)_RX_D[0]		GPI[13]	I	MII(2)_RX_D[0]		MII(2)_RX_D[0]	
	PDI[38]		GPI[14]	I	MII(2)_RX_D[2]		GPI[14]	I	MII(2)_RX_D[2]		MII(2)_RX_D[2]	
	PDI[39]		GPI[15]	I	MII(2)_RX_D[3]		GPI[15]	I	MII(2)_RX_D[3]		MII(2)_RX_D[3]	

===== [tab: PowerOnValue（POV）] =====
Power_On_Value	bit		instcat内参数	top内参数	top接口	
	15	1bit	0			
	14	1bit	LINKPOL_REG	LINKPOL	K11_MICLK_LINKPOL	
	13	1bit	PHYAD_OFF_REG	PP2_IN[4]	C3_PERR2_TRANS2_PHYAD_OFF	
	12	1bit	Ctrl_Status_Move_REG	PDI_IN[34]	E2_PDI34_TXD20_CTRLSTATUSMOVE	
	11	1bit	Trans_Mode_Ena_REG	P1_IN1	L3_TXD10_TRANSMODEENA	
	10	1bit	C25_ENA_REG	P0_IN1	L8_TXD00_C25ENA	
	[9:8]	2bit	C25_SHI_REG[1]
C25_SHI_REG[0]	P0_IN3
P0_IN4	L7_TXD02_C25SHI0
M7_TXD03_C25SHI1	
	[7:6]	2bit	CLK_MODE_REG[1]
CLK_MODE_REG[0]	P1_IN13
P0_IN13	K2_PERR1_TRANS1_CLKMODE1
J11_PERR0_TRANS0_CLKMODE0	
	[5:2]	4bit	P_CONF_REG[3]
P_CONF_REG[2]
P_CONF_REG[1]
P_CONF_REG[0]	PDI_IN[30]
PP2_IN[5]
P1_IN14
P0_IN14	C2_PDI30_LINKACT3_PCONF3
E3_LINKACT2_PCONF2
L1_LINKACT1_PCONF1
J12_LINKACT0_PCONF0	PDI[30]
xx
xx
xx
	[1:0]	2bit	P_MODE_REG[1]
P_MODE_REG[0]	P1_IN3
P1_IN4	L2_TXD12_PMODE0
M1_TXD13_PMODE1	

===== [tab: MII] =====
	instcat内参数	top内参数	top接口
MII_LINK0	~POV[14]/LINKPOL		
MII_RX0_CLK			
MII_RX0_DV			
MII_RX0_D[0]			
MII_RX0_D[1]			
MII_RX0_D[2]			
MII_RX0_D[3]			
MII_RX0_ERR			
MII_TX0_ENA			
MII_TX0_D[0]			
MII_TX0_D[1]			
MII_TX0_D[2]			
MII_TX0_D[3]			

===== [tab: Sheet1] =====
P_MODE[1:0]		PORT0	PORT1	PORT2	PORT3			P_CONF[3:0]	PORTs	PORT0	PORT1	PORT2	PORT3		SPI	Digital	Async8	Async16	MII0	MII1	MII2	MII3	EBUS0	EBUS1	EBUS2	EBUS3
00	2 ports	√	√	X	X		F-1	4'bx000	2 ports	EBUS(0)	EBUS(1)	X	X		√		√		不涉及	不涉及	不涉及	不涉及			不涉及	不涉及
01	3 ports	√	√	√	X		F-2	4'bx001		MII(0)	EBUS(1)	X	X		√		√			不涉及	不涉及	不涉及		不涉及	不涉及	不涉及
10	3 ports	√	√	X	√		F-3	4'bx010		MII(0)	EBUS(1)	X	X		√		❌			不涉及	不涉及	不涉及		不涉及	不涉及	不涉及
11	4 ports	√	√	√	√		F-4	4'bx011		MII(0)	MII(1)	X	X		√		√	√			不涉及	不涉及	不涉及	不涉及	不涉及	不涉及
							F-5	4'bx000	3 ports	EBUS(0)	EBUS(1)	EBUS(2)	X		√		√		不涉及	不涉及	不涉及	不涉及				不涉及
							F-6	4'bx001		MII(0)	EBUS(1)	EBUS(2)	X		√		√			不涉及	不涉及	不涉及			不涉及	不涉及
							F-7	4'bx010		MII(0)	EBUS(1)	EBUS(2)	X		√		❌			不涉及	不涉及	不涉及			不涉及	不涉及
							F-8	4'bx011		MII(0)	MII(1)	EBUS(2)	X		√		√				不涉及	不涉及		不涉及	不涉及	不涉及
							F-9	4'bx100		MII(0)	EBUS(1)	EBUS(2)	X		√		❌			不涉及	不涉及	不涉及			不涉及	不涉及
							F-10	4'bx101		MII(0)	MII(1)	EBUS(2)	X		√		❌				不涉及	不涉及		不涉及	不涉及	不涉及
							F-11	4'bx110		MII(0)	MII(1)	EBUS(2)	X		√		❌				不涉及	不涉及		不涉及	不涉及	不涉及
							F-12	4'bx111		MII(0)	MII(1)	MII(2)	X		√		√					不涉及	不涉及	不涉及	不涉及	不涉及
							F-13	4'bx000	3 ports	EBUS(0)	EBUS(1)	X	EBUS(3)		√		❌		不涉及	不涉及	不涉及	不涉及				不涉及
							F-14	4'bx001		MII(0)	EBUS(1)	X	EBUS(3)		√		❌			不涉及	不涉及	不涉及			不涉及	不涉及
							F-15	4'bx010		MII(0)	EBUS(1)	X	EBUS(3)		√		❌			不涉及	不涉及	不涉及			不涉及	不涉及
							F-16	4'bx011		MII(0)	MII(1)	X	EBUS(3)		√		❌				不涉及	不涉及		不涉及	不涉及	不涉及
							F-17	4'bx100		MII(0)	EBUS(1)	X	EBUS(3)		√		❌			不涉及	不涉及	不涉及		不涉及	不涉及	不涉及
							F-18	4'bx101		MII(0)	MII(1)	X	EBUS(3)		√		❌				不涉及	不涉及		不涉及	不涉及	不涉及
							F-19	4'bx110		MII(0)	MII(1)	X	EBUS(3)		√		❌				不涉及	不涉及		不涉及	不涉及	不涉及
							F-20	4'bx111		MII(0)	MII(1)	X	MII(3)		√		❌					不涉及	不涉及	不涉及	不涉及	不涉及
							F-21	4'b0000	4 ports	EBUS(0)	EBUS(1)	EBUS(2)	EBUS(3)		√		❌									
							F-22	4'b0001		MII(0)	EBUS(1)	EBUS(2)	EBUS(3)		√		❌									
							F-23	4'b0010		MII(0)	EBUS(1)	EBUS(2)	EBUS(3)		√		❌									
							F-24	4'b0011		MII(0)	MII(1)	EBUS(2)	EBUS(3)		√		❌									
							F-25	4'b0100		MII(0)	EBUS(1)	EBUS(2)	EBUS(3)		√		√									
							F-26	4'b0101		MII(0)	MII(1)	EBUS(2)	EBUS(3)		√		√									
							F-27	4'b0110		MII(0)	MII(1)	EBUS(2)	EBUS(3)		√		√									
							F-28	4'b0111		MII(0)	MII(1)	MII(2)	EBUS(3)		√		√									
							F-29	4'b1000		MII(0)	EBUS(1)	EBUS(2)	EBUS(3)		√		√									
							F-30	4'b1001		MII(0)	MII(1)	EBUS(2)	EBUS(3)		√		√									
							F-31	4'b1010		MII(0)	MII(1)	EBUS(2)	EBUS(3)		√		√									
							F-32	4'b1011		MII(0)	MII(1)	MII(2)	EBUS(3)		√		√									
							F-33	4'b1100		MII(0)	MII(1)	EBUS(2)	EBUS(3)		√		√									
							F-34	4'b1101		MII(0)	MII(1)	MII(2)	EBUS(3)		√		√									
							F-35	4'b1110		MII(0)	MII(1)	MII(2)	EBUS(3)		√		√									
							F-36	4'b1111		MII(0)	MII(1)	MII(2)	MII(3)		√		√									
