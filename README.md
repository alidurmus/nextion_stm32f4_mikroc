# MIKROC ARM, STM32F4, NEXTION

**************************************************
IDE: MIKROC ARM

CHIP: STM32F407VG 

BOARD: STM32F4 DISCOVERY

SHIELD: STM32F4 DISCOVERY SHIELD

TFT: NEXTION



**************************************************





Nextion Instruction Set
https://www.itead.cc/wiki/Nextion_Instruction_Set




		Nextion Return Data 

		Touch event return data
		0X65+Page ID+Component ID+TouchEvent+End
		
		0x65 0x00 0x01 0x00 0xFF 0xFF 0xFF
		Meaning: Page: 0, Component: 1 , TouchEvent: Press=1, Release=0
	
	
		String variable data returns
		0X70+Variable Content in ASCII code+End
		Instance: 0X70 0X61 0X62 0X63 0XFF 0XFF 0XFF
		Meaning:  abc
		
		
		Numeric variable data returns
		0X71+variable binary data(4 bytes little endian mode, low in front)+End
		Instance:0X71 0X66 0X00 0X00 0X00 0XFF 0XFF 0XFF
		Meaning: 102
		
		
		