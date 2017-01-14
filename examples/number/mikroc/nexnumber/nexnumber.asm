_sendCommand2:
;nexnumber.c,55 :: 		void sendCommand2(char cmd[20])
; cmd start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R1, R0
; cmd end address is: 0 (R0)
; cmd start address is: 4 (R1)
;nexnumber.c,57 :: 		int x=0;
; x start address is: 0 (R0)
MOVW	R0, #0
SXTH	R0, R0
; cmd end address is: 4 (R1)
; x end address is: 0 (R0)
MOV	R4, R1
SXTH	R5, R0
;nexnumber.c,60 :: 		while(cmd[x] != '\0')
L_sendCommand20:
; x start address is: 20 (R5)
; cmd start address is: 16 (R4)
ADDS	R1, R4, R5
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_sendCommand21
;nexnumber.c,62 :: 		UART3_Write(cmd[x]);
ADDS	R1, R4, R5
LDRB	R1, [R1, #0]
UXTH	R0, R1
BL	_UART3_Write+0
;nexnumber.c,63 :: 		x++;
ADDS	R5, R5, #1
SXTH	R5, R5
;nexnumber.c,64 :: 		}
; cmd end address is: 16 (R4)
; x end address is: 20 (R5)
IT	AL
BAL	L_sendCommand20
L_sendCommand21:
;nexnumber.c,66 :: 		UART3_Write(0xFF);
MOVS	R0, #255
BL	_UART3_Write+0
;nexnumber.c,67 :: 		UART3_Write(0xFF);
MOVS	R0, #255
BL	_UART3_Write+0
;nexnumber.c,68 :: 		UART3_Write(0xFF);
MOVS	R0, #255
BL	_UART3_Write+0
;nexnumber.c,71 :: 		}
L_end_sendCommand2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _sendCommand2
_getCommand:
;nexnumber.c,74 :: 		void getCommand(int i)
;nexnumber.c,80 :: 		if (rx_array[0]==0x65)
MOVW	R1, #lo_addr(_rx_array+0)
MOVT	R1, #hi_addr(_rx_array+0)
LDRB	R1, [R1, #0]
CMP	R1, #101
IT	NE
BNE	L_getCommand2
;nexnumber.c,82 :: 		delay_ms(1);
MOVW	R7, #46665
MOVT	R7, #0
NOP
NOP
L_getCommand3:
SUBS	R7, R7, #1
BNE	L_getCommand3
NOP
NOP
;nexnumber.c,84 :: 		if (rx_array[2]==0x01)
MOVW	R1, #lo_addr(_rx_array+2)
MOVT	R1, #hi_addr(_rx_array+2)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_getCommand5
;nexnumber.c,86 :: 		arttir=1;
MOVS	R2, #1
SXTH	R2, R2
MOVW	R1, #lo_addr(_arttir+0)
MOVT	R1, #hi_addr(_arttir+0)
STRH	R2, [R1, #0]
;nexnumber.c,87 :: 		}
L_getCommand5:
;nexnumber.c,88 :: 		if (rx_array[2]==0x02)
MOVW	R1, #lo_addr(_rx_array+2)
MOVT	R1, #hi_addr(_rx_array+2)
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_getCommand6
;nexnumber.c,90 :: 		azalt=1;
MOVS	R2, #1
SXTH	R2, R2
MOVW	R1, #lo_addr(_azalt+0)
MOVT	R1, #hi_addr(_azalt+0)
STRH	R2, [R1, #0]
;nexnumber.c,91 :: 		}
L_getCommand6:
;nexnumber.c,92 :: 		}
L_getCommand2:
;nexnumber.c,97 :: 		if (rx_array[0]==0x71)
MOVW	R1, #lo_addr(_rx_array+0)
MOVT	R1, #hi_addr(_rx_array+0)
LDRB	R1, [R1, #0]
CMP	R1, #113
IT	NE
BNE	L_getCommand7
;nexnumber.c,100 :: 		}
L_getCommand7:
;nexnumber.c,103 :: 		if (rx_array[0]==0x70)
MOVW	R1, #lo_addr(_rx_array+0)
MOVT	R1, #hi_addr(_rx_array+0)
LDRB	R1, [R1, #0]
CMP	R1, #112
IT	NE
BNE	L_getCommand8
;nexnumber.c,106 :: 		}
L_getCommand8:
;nexnumber.c,107 :: 		}
L_end_getCommand:
BX	LR
; end of _getCommand
_main:
;nexnumber.c,111 :: 		void main()
;nexnumber.c,116 :: 		&_GPIO_MODULE_USART3_PD89);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART3_PD89+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART3_PD89+0)
PUSH	(R0)
;nexnumber.c,115 :: 		UART3_Init_Advanced(57600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT,
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOVW	R0, #57600
;nexnumber.c,116 :: 		&_GPIO_MODULE_USART3_PD89);
BL	_UART3_Init_Advanced+0
ADD	SP, SP, #4
;nexnumber.c,118 :: 		EnableInterrupts(); // enable core interrupts
BL	_EnableInterrupts+0
;nexnumber.c,119 :: 		USART3_CR1bits.RXNEIE = 1; // enable uart rx interrupt
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(USART3_CR1bits+0)
MOVT	R0, #hi_addr(USART3_CR1bits+0)
STR	R1, [R0, #0]
;nexnumber.c,120 :: 		NVIC_IntEnable(IVT_INT_USART3); // enable interrupt vector
MOVW	R0, #55
BL	_NVIC_IntEnable+0
;nexnumber.c,124 :: 		while(1)   //Sonsuz döngü.
L_main9:
;nexnumber.c,127 :: 		if(i)   // Eðer UART3'e veri gelmiþ ise
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main11
;nexnumber.c,129 :: 		getCommand(i);
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
BL	_getCommand+0
;nexnumber.c,130 :: 		i=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
;nexnumber.c,131 :: 		}
L_main11:
;nexnumber.c,133 :: 		if(arttir)
MOVW	R0, #lo_addr(_arttir+0)
MOVT	R0, #hi_addr(_arttir+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main12
;nexnumber.c,136 :: 		sayi++;
MOVW	R1, #lo_addr(_sayi+0)
MOVT	R1, #hi_addr(_sayi+0)
LDRSH	R0, [R1, #0]
ADDS	R3, R0, #1
SXTH	R3, R3
STRH	R3, [R1, #0]
;nexnumber.c,138 :: 		txt1[0] = 0x6E; //n
MOVS	R1, #110
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
STRB	R1, [R0, #0]
;nexnumber.c,139 :: 		txt1[1] = 0x30; //0
MOVS	R1, #48
MOVW	R0, #lo_addr(_txt1+1)
MOVT	R0, #hi_addr(_txt1+1)
STRB	R1, [R0, #0]
;nexnumber.c,140 :: 		txt1[2] = 0x2E; //.
MOVS	R1, #46
MOVW	R0, #lo_addr(_txt1+2)
MOVT	R0, #hi_addr(_txt1+2)
STRB	R1, [R0, #0]
;nexnumber.c,141 :: 		txt1[3] = 0x76; // v
MOVS	R1, #118
MOVW	R0, #lo_addr(_txt1+3)
MOVT	R0, #hi_addr(_txt1+3)
STRB	R1, [R0, #0]
;nexnumber.c,142 :: 		txt1[4] = 0x61; // a
MOVS	R1, #97
MOVW	R0, #lo_addr(_txt1+4)
MOVT	R0, #hi_addr(_txt1+4)
STRB	R1, [R0, #0]
;nexnumber.c,143 :: 		txt1[5] = 0x6C; // l
MOVS	R1, #108
MOVW	R0, #lo_addr(_txt1+5)
MOVT	R0, #hi_addr(_txt1+5)
STRB	R1, [R0, #0]
;nexnumber.c,144 :: 		txt1[6] = 0x3D; // =
MOVS	R1, #61
MOVW	R0, #lo_addr(_txt1+6)
MOVT	R0, #hi_addr(_txt1+6)
STRB	R1, [R0, #0]
;nexnumber.c,145 :: 		txt1[7]=((sayi/10)%10)+48;
MOVS	R0, #10
SXTH	R0, R0
SDIV	R2, R3, R0
SXTH	R2, R2
MOVS	R1, #10
SXTH	R1, R1
SDIV	R0, R2, R1
MLS	R0, R1, R0, R2
SXTH	R0, R0
ADDW	R1, R0, #48
MOVW	R0, #lo_addr(_txt1+7)
MOVT	R0, #hi_addr(_txt1+7)
STRB	R1, [R0, #0]
;nexnumber.c,146 :: 		txt1[8]=(sayi%10)+48;
MOVS	R1, #10
SXTH	R1, R1
SDIV	R0, R3, R1
MLS	R0, R1, R0, R3
SXTH	R0, R0
ADDW	R1, R0, #48
MOVW	R0, #lo_addr(_txt1+8)
MOVT	R0, #hi_addr(_txt1+8)
STRB	R1, [R0, #0]
;nexnumber.c,149 :: 		sendCommand2(txt1);
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_sendCommand2+0
;nexnumber.c,151 :: 		delay_ms(1);
MOVW	R7, #46665
MOVT	R7, #0
NOP
NOP
L_main13:
SUBS	R7, R7, #1
BNE	L_main13
NOP
NOP
;nexnumber.c,153 :: 		arttir=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_arttir+0)
MOVT	R0, #hi_addr(_arttir+0)
STRH	R1, [R0, #0]
;nexnumber.c,154 :: 		}
L_main12:
;nexnumber.c,157 :: 		if(azalt)
MOVW	R0, #lo_addr(_azalt+0)
MOVT	R0, #hi_addr(_azalt+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main15
;nexnumber.c,159 :: 		sayi--;
MOVW	R1, #lo_addr(_sayi+0)
MOVT	R1, #hi_addr(_sayi+0)
LDRSH	R0, [R1, #0]
SUBS	R3, R0, #1
SXTH	R3, R3
STRH	R3, [R1, #0]
;nexnumber.c,161 :: 		txt1[0] = 0x6E; //n
MOVS	R1, #110
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
STRB	R1, [R0, #0]
;nexnumber.c,162 :: 		txt1[1] = 0x30; //0
MOVS	R1, #48
MOVW	R0, #lo_addr(_txt1+1)
MOVT	R0, #hi_addr(_txt1+1)
STRB	R1, [R0, #0]
;nexnumber.c,163 :: 		txt1[2] = 0x2E; //.
MOVS	R1, #46
MOVW	R0, #lo_addr(_txt1+2)
MOVT	R0, #hi_addr(_txt1+2)
STRB	R1, [R0, #0]
;nexnumber.c,164 :: 		txt1[3] = 0x76; // v
MOVS	R1, #118
MOVW	R0, #lo_addr(_txt1+3)
MOVT	R0, #hi_addr(_txt1+3)
STRB	R1, [R0, #0]
;nexnumber.c,165 :: 		txt1[4] = 0x61; // a
MOVS	R1, #97
MOVW	R0, #lo_addr(_txt1+4)
MOVT	R0, #hi_addr(_txt1+4)
STRB	R1, [R0, #0]
;nexnumber.c,166 :: 		txt1[5] = 0x6C; // l
MOVS	R1, #108
MOVW	R0, #lo_addr(_txt1+5)
MOVT	R0, #hi_addr(_txt1+5)
STRB	R1, [R0, #0]
;nexnumber.c,167 :: 		txt1[6] = 0x3D; // =
MOVS	R1, #61
MOVW	R0, #lo_addr(_txt1+6)
MOVT	R0, #hi_addr(_txt1+6)
STRB	R1, [R0, #0]
;nexnumber.c,168 :: 		txt1[7]=((sayi/10)%10)+48;
MOVS	R0, #10
SXTH	R0, R0
SDIV	R2, R3, R0
SXTH	R2, R2
MOVS	R1, #10
SXTH	R1, R1
SDIV	R0, R2, R1
MLS	R0, R1, R0, R2
SXTH	R0, R0
ADDW	R1, R0, #48
MOVW	R0, #lo_addr(_txt1+7)
MOVT	R0, #hi_addr(_txt1+7)
STRB	R1, [R0, #0]
;nexnumber.c,169 :: 		txt1[8]=(sayi%10)+48;
MOVS	R1, #10
SXTH	R1, R1
SDIV	R0, R3, R1
MLS	R0, R1, R0, R3
SXTH	R0, R0
ADDW	R1, R0, #48
MOVW	R0, #lo_addr(_txt1+8)
MOVT	R0, #hi_addr(_txt1+8)
STRB	R1, [R0, #0]
;nexnumber.c,172 :: 		sendCommand2(txt1);
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_sendCommand2+0
;nexnumber.c,175 :: 		delay_ms(1);
MOVW	R7, #46665
MOVT	R7, #0
NOP
NOP
L_main16:
SUBS	R7, R7, #1
BNE	L_main16
NOP
NOP
;nexnumber.c,177 :: 		azalt=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_azalt+0)
MOVT	R0, #hi_addr(_azalt+0)
STRH	R1, [R0, #0]
;nexnumber.c,178 :: 		}
L_main15:
;nexnumber.c,180 :: 		} //while
IT	AL
BAL	L_main9
;nexnumber.c,181 :: 		}//void main()
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_interrupt_usart3:
;nexnumber.c,189 :: 		void interrupt_usart3() iv IVT_INT_USART3 ics ICS_AUTO
SUB	SP, SP, #12
STR	LR, [SP, #0]
;nexnumber.c,196 :: 		if(UART3_Data_Ready()&& i<=20) // If data is received
BL	_UART3_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L__interrupt_usart323
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #20
IT	GT
BGT	L__interrupt_usart322
L__interrupt_usart321:
;nexnumber.c,198 :: 		rx_array[i]=Uart3_Read();  //nextion response value
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STR	R0, [SP, #8]
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_rx_array+0)
MOVT	R0, #hi_addr(_rx_array+0)
ADDS	R0, R0, R1
STR	R0, [SP, #4]
BL	_UART3_Read+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;nexnumber.c,199 :: 		i++;
LDR	R1, [SP, #8]
MOV	R0, R1
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;nexnumber.c,196 :: 		if(UART3_Data_Ready()&& i<=20) // If data is received
L__interrupt_usart323:
L__interrupt_usart322:
;nexnumber.c,201 :: 		}
L_end_interrupt_usart3:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _interrupt_usart3
