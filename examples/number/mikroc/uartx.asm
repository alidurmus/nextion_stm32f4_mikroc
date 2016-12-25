_main:
;uartx.c,12 :: 		void main()
;uartx.c,15 :: 		&_GPIO_MODULE_USART2_PA23);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART2_PA23+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART2_PA23+0)
PUSH	(R0)
;uartx.c,14 :: 		UART2_Init_Advanced(57600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT,
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOVW	R0, #57600
;uartx.c,15 :: 		&_GPIO_MODULE_USART2_PA23);
BL	_UART2_Init_Advanced+0
ADD	SP, SP, #4
;uartx.c,18 :: 		&_GPIO_MODULE_USART3_PD89);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART3_PD89+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART3_PD89+0)
PUSH	(R0)
;uartx.c,17 :: 		UART3_Init_Advanced(57600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT,
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOVW	R0, #57600
;uartx.c,18 :: 		&_GPIO_MODULE_USART3_PD89);
BL	_UART3_Init_Advanced+0
ADD	SP, SP, #4
;uartx.c,20 :: 		Delay_ms(200);
MOVW	R7, #27219
MOVT	R7, #142
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
NOP
;uartx.c,21 :: 		UART2_Write_Text("ali"); //
MOVW	R0, #lo_addr(?lstr1_uartx+0)
MOVT	R0, #hi_addr(?lstr1_uartx+0)
BL	_UART2_Write_Text+0
;uartx.c,23 :: 		EnableInterrupts(); // enable core interrupts
BL	_EnableInterrupts+0
;uartx.c,26 :: 		USART2_CR1bits.RXNEIE = 1; // enable uart rx interrupt
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R1, [R0, #0]
;uartx.c,27 :: 		NVIC_IntEnable(IVT_INT_USART2); // enable interrupt vector
MOVW	R0, #54
BL	_NVIC_IntEnable+0
;uartx.c,30 :: 		while(1)                                 //Sonsuz döngü.
L_main2:
;uartx.c,43 :: 		if(i==6)   // Eðer UART3'e veri gelmiþ ise
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #6
IT	NE
BNE	L_main4
;uartx.c,45 :: 		Delay_ms(200);
MOVW	R7, #27219
MOVT	R7, #142
NOP
NOP
L_main5:
SUBS	R7, R7, #1
BNE	L_main5
NOP
NOP
NOP
NOP
;uartx.c,46 :: 		UART2_Write(rx_array[0]);
MOVW	R0, #lo_addr(_rx_array+0)
MOVT	R0, #hi_addr(_rx_array+0)
LDRB	R0, [R0, #0]
BL	_UART2_Write+0
;uartx.c,47 :: 		UART2_Write(rx_array[1]);
MOVW	R0, #lo_addr(_rx_array+1)
MOVT	R0, #hi_addr(_rx_array+1)
LDRB	R0, [R0, #0]
BL	_UART2_Write+0
;uartx.c,48 :: 		UART2_Write(rx_array[2]);
MOVW	R0, #lo_addr(_rx_array+2)
MOVT	R0, #hi_addr(_rx_array+2)
LDRB	R0, [R0, #0]
BL	_UART2_Write+0
;uartx.c,49 :: 		UART2_Write(rx_array[3]);
MOVW	R0, #lo_addr(_rx_array+3)
MOVT	R0, #hi_addr(_rx_array+3)
LDRB	R0, [R0, #0]
BL	_UART2_Write+0
;uartx.c,50 :: 		UART2_Write(rx_array[4]);
MOVW	R0, #lo_addr(_rx_array+4)
MOVT	R0, #hi_addr(_rx_array+4)
LDRB	R0, [R0, #0]
BL	_UART2_Write+0
;uartx.c,51 :: 		UART2_Write(rx_array[5]);
MOVW	R0, #lo_addr(_rx_array+5)
MOVT	R0, #hi_addr(_rx_array+5)
LDRB	R0, [R0, #0]
BL	_UART2_Write+0
;uartx.c,52 :: 		UART2_Write(rx_array[6]);
MOVW	R0, #lo_addr(_rx_array+6)
MOVT	R0, #hi_addr(_rx_array+6)
LDRB	R0, [R0, #0]
BL	_UART2_Write+0
;uartx.c,53 :: 		i=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
;uartx.c,54 :: 		}
L_main4:
;uartx.c,57 :: 		if(j==8)   // Eðer UART3'e veri gelmiþ ise
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRSH	R0, [R0, #0]
CMP	R0, #8
IT	NE
BNE	L_main7
;uartx.c,59 :: 		Delay_ms(200);
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
;uartx.c,60 :: 		UART3_Write(rx_array2[0]);
MOVW	R0, #lo_addr(_rx_array2+0)
MOVT	R0, #hi_addr(_rx_array2+0)
LDRB	R0, [R0, #0]
BL	_UART3_Write+0
;uartx.c,61 :: 		UART3_Write(rx_array2[1]);
MOVW	R0, #lo_addr(_rx_array2+1)
MOVT	R0, #hi_addr(_rx_array2+1)
LDRB	R0, [R0, #0]
BL	_UART3_Write+0
;uartx.c,62 :: 		UART3_Write(rx_array2[2]);
MOVW	R0, #lo_addr(_rx_array2+2)
MOVT	R0, #hi_addr(_rx_array2+2)
LDRB	R0, [R0, #0]
BL	_UART3_Write+0
;uartx.c,63 :: 		UART3_Write(rx_array2[3]);
MOVW	R0, #lo_addr(_rx_array2+3)
MOVT	R0, #hi_addr(_rx_array2+3)
LDRB	R0, [R0, #0]
BL	_UART3_Write+0
;uartx.c,64 :: 		UART3_Write(rx_array2[4]);
MOVW	R0, #lo_addr(_rx_array2+4)
MOVT	R0, #hi_addr(_rx_array2+4)
LDRB	R0, [R0, #0]
BL	_UART3_Write+0
;uartx.c,65 :: 		UART3_Write(rx_array2[5]);
MOVW	R0, #lo_addr(_rx_array2+5)
MOVT	R0, #hi_addr(_rx_array2+5)
LDRB	R0, [R0, #0]
BL	_UART3_Write+0
;uartx.c,66 :: 		UART3_Write(rx_array2[6]);
MOVW	R0, #lo_addr(_rx_array2+6)
MOVT	R0, #hi_addr(_rx_array2+6)
LDRB	R0, [R0, #0]
BL	_UART3_Write+0
;uartx.c,67 :: 		UART3_Write(rx_array2[7]);
MOVW	R0, #lo_addr(_rx_array2+7)
MOVT	R0, #hi_addr(_rx_array2+7)
LDRB	R0, [R0, #0]
BL	_UART3_Write+0
;uartx.c,68 :: 		UART3_Write(rx_array2[8]);
MOVW	R0, #lo_addr(_rx_array2+8)
MOVT	R0, #hi_addr(_rx_array2+8)
LDRB	R0, [R0, #0]
BL	_UART3_Write+0
;uartx.c,69 :: 		UART3_Write(0xFF);
MOVS	R0, #255
BL	_UART3_Write+0
;uartx.c,70 :: 		UART3_Write(0xFF);
MOVS	R0, #255
BL	_UART3_Write+0
;uartx.c,71 :: 		UART3_Write(0xFF);
MOVS	R0, #255
BL	_UART3_Write+0
;uartx.c,72 :: 		j=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
STRH	R1, [R0, #0]
;uartx.c,73 :: 		}
L_main7:
;uartx.c,76 :: 		} //while
IT	AL
BAL	L_main2
;uartx.c,77 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_interrupt:
;uartx.c,90 :: 		void interrupt() iv IVT_INT_USART2 ics ICS_AUTO {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;uartx.c,91 :: 		if(UART2_Data_Ready()&& j<=8) // If data is received
BL	_UART2_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L__interrupt15
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRSH	R0, [R0, #0]
CMP	R0, #8
IT	GT
BGT	L__interrupt14
L__interrupt13:
;uartx.c,93 :: 		rx_array2[j]=Uart2_Read();
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
STR	R0, [SP, #8]
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_rx_array2+0)
MOVT	R0, #hi_addr(_rx_array2+0)
ADDS	R0, R0, R1
STR	R0, [SP, #4]
BL	_UART2_Read+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;uartx.c,94 :: 		j++;
LDR	R1, [SP, #8]
MOV	R0, R1
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;uartx.c,91 :: 		if(UART2_Data_Ready()&& j<=8) // If data is received
L__interrupt15:
L__interrupt14:
;uartx.c,96 :: 		}
L_end_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _interrupt
