
===== [tab: 【FrameFormat】] =====

===== [tab: FrameFormat] =====
							[object Object],[object Object]								
	Ethernet frame						Ethernet Header			Ethernet Data				Pading	FCS
							[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]				[object Object],[object Object]	[object Object],[object Object]
	Basic EtherCAT frame						Destination	Source	EtherType
（0x88A4）	EtherCAT Data				Pading	FCS
							MAC地址	MAC地址							
							[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]			[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]
0	Basic EtherCAT frame						Destination	Source	EtherType
（0x88A4）	EtherCAT Header			Datagrams	Pading	FCS
						[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]			[object Object],[object Object]	[object Object],[object Object],[object Object],[object Object]	[object Object],[object Object]
1	Basic EtherCAT frame
(with VALN)					Destination	Source	VALN Tag	EtherType
（0x88A4）	EtherCAT Header			Datagrams	Pading	FCS
			[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]		[object Object],[object Object]		[object Object],[object Object]			[object Object],[object Object],[object Object],[object Object]	[object Object],[object Object],[object Object],[object Object]	[object Object],[object Object]
2	Basic EtherCAT frame
(in UDP/IP)		Destination	Source	[object Object],[object Object],[object Object]	IP Header		UDP Header
dest port 0x88A4		EtherCAT Header			Datagrams	Pading	FCS
		[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]		[object Object],[object Object]		[object Object],[object Object]			[object Object],[object Object],[object Object],[object Object]	[object Object],[object Object],[object Object],[object Object]	[object Object],[object Object]
3	Basic EtherCAT frame
(in UDP/IP with VLAN)	Destination	Source	VALN Tag	[object Object],[object Object],[object Object]	IP Header		UDP Header
dest port 0x88A4		EtherCAT Header			Datagrams	Pading	FCS
										[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]			
										EtherCAT Header					
										Length	Res	Type			

===== [tab: MAC地址] =====

===== [tab: EtherCAT Header] =====

===== [tab: Datagrams] =====
								[object Object],[object Object]									[object Object],[object Object]			[object Object],[object Object]
							Datagrams	Header									Data			WorkCounter
								[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]		[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]				
								Cmd	Idx	Address		Len	R	C	M	IRQ	Data			WKC
										[object Object],[object Object]	[object Object],[object Object]									
								EtherCAT命令类型	该索引是一个由主站使用的数字标识符，用于识别重复/丢失的数据报文，EtherCAT从站不得更改该索引	[object Object],[object Object],[object Object]	Offset	Position Addressing								
										[object Object],[object Object]	[object Object],[object Object]									
										Address	Offset	Node Addressing								
										[object Object],[object Object]										
										Logical Address		Logical Addressing								
							1	[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]		[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]			[object Object],[object Object]
								Cmd	Idx	Address		Len	R	C	M	IRQ	Data			WKC
							N	[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]		[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]	[object Object],[object Object]			[object Object],[object Object]
								Cmd	Idx	Address		Len	R	C	M	IRQ	Data			WKC
										地址
1、自动递增
2、配置站地址
3、逻辑地址										

===== [tab: Cmd] =====

===== [tab: Address] =====

===== [tab: C] =====

===== [tab: WKC] =====

===== [tab: IRQ] =====
