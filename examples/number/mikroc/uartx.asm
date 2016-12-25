_hextostr:
;uartx.c,33 :: 		void hextostr(char eleman)
; eleman start address is: 0 (R0)
SUB	SP, SP, #4
UXTB	R2, R0
; eleman end address is: 0 (R0)
; eleman start address is: 8 (R2)
;uartx.c,36 :: 		sol=(eleman>>4)&0x0F; //0000 0001 dört basamak kaydýr 0001 0000 ve 0000 11111
LSRS	R1, R2, #4
UXTB	R1, R1
AND	R1, R1, #15
UXTB	R1, R1
; sol start address is: 0 (R0)
UXTB	R0, R1
;uartx.c,37 :: 		if(sol>=10)
CMP	R1, #10
IT	CC
BCC	L_hextostr0
;uartx.c,39 :: 		sol+=55;
ADDW	R1, R0, #55
UXTB	R0, R1
;uartx.c,40 :: 		}
IT	AL
BAL	L_hextostr1
L_hextostr0:
;uartx.c,42 :: 		sol+=48; //  0001 => 1 + 48
ADDW	R1, R0, #48
UXTB	R0, R1
; sol end address is: 0 (R0)
L_hextostr1:
;uartx.c,44 :: 		sag=eleman&0x0F;  // 0001 0000 ve 0000 1111
; sol start address is: 0 (R0)
AND	R1, R2, #15
UXTB	R1, R1
; eleman end address is: 8 (R2)
; sag start address is: 8 (R2)
UXTB	R2, R1
;uartx.c,46 :: 		if(sag>=10)
CMP	R1, #10
IT	CC
BCC	L_hextostr2
;uartx.c,48 :: 		sag+=55;
ADDW	R1, R2, #55
; sag end address is: 8 (R2)
; sag start address is: 12 (R3)
UXTB	R3, R1
;uartx.c,49 :: 		}
; sag end address is: 12 (R3)
IT	AL
BAL	L_hextostr3
L_hextostr2:
;uartx.c,51 :: 		sag+=48;
; sag start address is: 8 (R2)
ADDW	R1, R2, #48
; sag end address is: 8 (R2)
; sag start address is: 12 (R3)
UXTB	R3, R1
; sag end address is: 12 (R3)
L_hextostr3:
;uartx.c,52 :: 		txt[0]='0';
; sag start address is: 12 (R3)
MOVS	R2, #48
MOVW	R1, #lo_addr(_txt+0)
MOVT	R1, #hi_addr(_txt+0)
STRB	R2, [R1, #0]
;uartx.c,53 :: 		txt[1]='x';
MOVS	R2, #120
MOVW	R1, #lo_addr(_txt+1)
MOVT	R1, #hi_addr(_txt+1)
STRB	R2, [R1, #0]
;uartx.c,54 :: 		txt[2]=sol;
MOVW	R1, #lo_addr(_txt+2)
MOVT	R1, #hi_addr(_txt+2)
STRB	R0, [R1, #0]
; sol end address is: 0 (R0)
;uartx.c,55 :: 		txt[3]=sag;
MOVW	R1, #lo_addr(_txt+3)
MOVT	R1, #hi_addr(_txt+3)
STRB	R3, [R1, #0]
; sag end address is: 12 (R3)
;uartx.c,56 :: 		}
L_end_hextostr:
ADD	SP, SP, #4
BX	LR
; end of _hextostr
_main:
;uartx.c,101 :: 		void main()
SUB	SP, SP, #4
;uartx.c,104 :: 		&_GPIO_MODULE_USART2_PA23);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART2_PA23+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART2_PA23+0)
PUSH	(R0)
;uartx.c,103 :: 		UART2_Init_Advanced(57600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT,
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOVW	R0, #57600
;uartx.c,104 :: 		&_GPIO_MODULE_USART2_PA23);
BL	_UART2_Init_Advanced+0
ADD	SP, SP, #4
;uartx.c,106 :: 		Delay_ms(200);
MOVW	R7, #27219
MOVT	R7, #142
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
NOP
;uartx.c,108 :: 		EnableInterrupts();// enable interrupts.
BL	_EnableInterrupts+0
;uartx.c,109 :: 		USART2_CR1bits.RXNEIE = 1; // enable uart rx interrupt
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R1, [R0, #0]
;uartx.c,110 :: 		NVIC_IntEnable(IVT_INT_USART2); // enable interrupt vector
MOVW	R0, #54
BL	_NVIC_IntEnable+0
;uartx.c,114 :: 		while(1) //Sonsuz döngü.
L_main6:
;uartx.c,124 :: 		Delay_ms(200);
MOVW	R7, #27219
MOVT	R7, #142
NOP
NOP
L_main8:
SUBS	R7, R7, #1
BNE	L_main8
NOP
NOP
NOP
NOP
;uartx.c,127 :: 		if (rx_array[0] == 0x65&& i==6){
MOVW	R0, #lo_addr(_rx_array+0)
MOVT	R0, #hi_addr(_rx_array+0)
LDRB	R0, [R0, #0]
CMP	R0, #101
IT	NE
BNE	L__main34
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #6
IT	NE
BNE	L__main33
L__main32:
;uartx.c,128 :: 		if (rx_array[1] == 0x00){
MOVW	R0, #lo_addr(_rx_array+1)
MOVT	R0, #hi_addr(_rx_array+1)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main13
;uartx.c,129 :: 		if (rx_array[2] == 0x01){
MOVW	R0, #lo_addr(_rx_array+2)
MOVT	R0, #hi_addr(_rx_array+2)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main14
;uartx.c,130 :: 		if (rx_array[3] == 0x00){
MOVW	R0, #lo_addr(_rx_array+3)
MOVT	R0, #hi_addr(_rx_array+3)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main15
;uartx.c,131 :: 		if (rx_array[4] == 0xFF){
MOVW	R0, #lo_addr(_rx_array+4)
MOVT	R0, #hi_addr(_rx_array+4)
LDRB	R0, [R0, #0]
CMP	R0, #255
IT	NE
BNE	L_main16
;uartx.c,132 :: 		if (rx_array[5] == 0xFF){
MOVW	R0, #lo_addr(_rx_array+5)
MOVT	R0, #hi_addr(_rx_array+5)
LDRB	R0, [R0, #0]
CMP	R0, #255
IT	NE
BNE	L_main17
;uartx.c,133 :: 		if (rx_array[6] == 0xFF){
MOVW	R0, #lo_addr(_rx_array+6)
MOVT	R0, #hi_addr(_rx_array+6)
LDRB	R0, [R0, #0]
CMP	R0, #255
IT	NE
BNE	L_main18
;uartx.c,134 :: 		USART2_CR1bits.RXNEIE = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R1, [R0, #0]
;uartx.c,135 :: 		UART2_Write_Text("n0.val=44"); //
MOVW	R0, #lo_addr(?lstr1_uartx+0)
MOVT	R0, #hi_addr(?lstr1_uartx+0)
BL	_UART2_Write_Text+0
;uartx.c,136 :: 		UART2_Write(0xFF);
MOVS	R0, #255
BL	_UART2_Write+0
;uartx.c,137 :: 		UART2_Write(0xFF);
MOVS	R0, #255
BL	_UART2_Write+0
;uartx.c,138 :: 		UART2_Write(0xFF);
MOVS	R0, #255
BL	_UART2_Write+0
;uartx.c,139 :: 		USART2_CR1bits.RXNEIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R1, [R0, #0]
;uartx.c,140 :: 		i=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
;uartx.c,141 :: 		}
L_main18:
;uartx.c,142 :: 		}
L_main17:
;uartx.c,143 :: 		}
L_main16:
;uartx.c,144 :: 		}
L_main15:
;uartx.c,145 :: 		}
L_main14:
;uartx.c,146 :: 		}
L_main13:
;uartx.c,127 :: 		if (rx_array[0] == 0x65&& i==6){
L__main34:
L__main33:
;uartx.c,149 :: 		if (rx_array[0] == 0x65&& i==6){
MOVW	R0, #lo_addr(_rx_array+0)
MOVT	R0, #hi_addr(_rx_array+0)
LDRB	R0, [R0, #0]
CMP	R0, #101
IT	NE
BNE	L__main36
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #6
IT	NE
BNE	L__main35
L__main31:
;uartx.c,150 :: 		if (rx_array[1] == 0x00){
MOVW	R0, #lo_addr(_rx_array+1)
MOVT	R0, #hi_addr(_rx_array+1)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main22
;uartx.c,151 :: 		if (rx_array[2] == 0x02){
MOVW	R0, #lo_addr(_rx_array+2)
MOVT	R0, #hi_addr(_rx_array+2)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_main23
;uartx.c,152 :: 		if (rx_array[3] == 0x00){
MOVW	R0, #lo_addr(_rx_array+3)
MOVT	R0, #hi_addr(_rx_array+3)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main24
;uartx.c,153 :: 		if (rx_array[4] == 0xFF){
MOVW	R0, #lo_addr(_rx_array+4)
MOVT	R0, #hi_addr(_rx_array+4)
LDRB	R0, [R0, #0]
CMP	R0, #255
IT	NE
BNE	L_main25
;uartx.c,154 :: 		if (rx_array[5] == 0xFF){
MOVW	R0, #lo_addr(_rx_array+5)
MOVT	R0, #hi_addr(_rx_array+5)
LDRB	R0, [R0, #0]
CMP	R0, #255
IT	NE
BNE	L_main26
;uartx.c,155 :: 		if (rx_array[6] == 0xFF){
MOVW	R0, #lo_addr(_rx_array+6)
MOVT	R0, #hi_addr(_rx_array+6)
LDRB	R0, [R0, #0]
CMP	R0, #255
IT	NE
BNE	L_main27
;uartx.c,156 :: 		USART2_CR1bits.RXNEIE = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R1, [R0, #0]
;uartx.c,157 :: 		UART2_Write_Text("n0.val=55"); //
MOVW	R0, #lo_addr(?lstr2_uartx+0)
MOVT	R0, #hi_addr(?lstr2_uartx+0)
BL	_UART2_Write_Text+0
;uartx.c,158 :: 		UART2_Write(0xFF);
MOVS	R0, #255
BL	_UART2_Write+0
;uartx.c,159 :: 		UART2_Write(0xFF);
MOVS	R0, #255
BL	_UART2_Write+0
;uartx.c,160 :: 		UART2_Write(0xFF);
MOVS	R0, #255
BL	_UART2_Write+0
;uartx.c,161 :: 		USART2_CR1bits.RXNEIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R1, [R0, #0]
;uartx.c,162 :: 		i=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
;uartx.c,163 :: 		}
L_main27:
;uartx.c,164 :: 		}
L_main26:
;uartx.c,165 :: 		}
L_main25:
;uartx.c,166 :: 		}
L_main24:
;uartx.c,167 :: 		}
L_main23:
;uartx.c,168 :: 		}
L_main22:
;uartx.c,149 :: 		if (rx_array[0] == 0x65&& i==6){
L__main36:
L__main35:
;uartx.c,173 :: 		}
IT	AL
BAL	L_main6
;uartx.c,174 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_interrupt:
;uartx.c,177 :: 		void interrupt() iv IVT_INT_USART2 ics ICS_AUTO {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;uartx.c,182 :: 		if(UART2_Data_Ready()&& i<=6) // If data is received
BL	_UART2_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L__interrupt39
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #6
IT	GT
BGT	L__interrupt38
L__interrupt37:
;uartx.c,184 :: 		rx_array[i]=Uart2_Read();
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STR	R0, [SP, #8]
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_rx_array+0)
MOVT	R0, #hi_addr(_rx_array+0)
ADDS	R0, R0, R1
STR	R0, [SP, #4]
BL	_UART2_Read+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;uartx.c,185 :: 		i++;
LDR	R1, [SP, #8]
MOV	R0, R1
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;uartx.c,182 :: 		if(UART2_Data_Ready()&& i<=6) // If data is received
L__interrupt39:
L__interrupt38:
;uartx.c,187 :: 		}
L_end_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _interrupt
