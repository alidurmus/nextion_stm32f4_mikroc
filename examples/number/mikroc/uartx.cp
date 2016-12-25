#line 1 "B:/ELEKTRONÝK/deneme/uartxx_calisan/uartxx/uartx.c"
#line 9 "B:/ELEKTRONÝK/deneme/uartxx_calisan/uartxx/uartx.c"
int i=0,j=0;
char gelen,rx_array[10],rx_array2[10];

void main()
{
 UART2_Init_Advanced(57600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT,
 &_GPIO_MODULE_USART2_PA23);

 UART3_Init_Advanced(57600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT,
 &_GPIO_MODULE_USART3_PD89);

 Delay_ms(200);
 UART2_Write_Text("ali");

 EnableInterrupts();
#line 26 "B:/ELEKTRONÝK/deneme/uartxx_calisan/uartxx/uartx.c"
 USART2_CR1bits.RXNEIE = 1;
 NVIC_IntEnable(IVT_INT_USART2);


while(1)
 {
#line 43 "B:/ELEKTRONÝK/deneme/uartxx_calisan/uartxx/uartx.c"
 if(i==6)
 {
 Delay_ms(200);
 UART2_Write(rx_array[0]);
 UART2_Write(rx_array[1]);
 UART2_Write(rx_array[2]);
 UART2_Write(rx_array[3]);
 UART2_Write(rx_array[4]);
 UART2_Write(rx_array[5]);
 UART2_Write(rx_array[6]);
 i=0;
 }


 if(j==8)
 {
 Delay_ms(200);
 UART3_Write(rx_array2[0]);
 UART3_Write(rx_array2[1]);
 UART3_Write(rx_array2[2]);
 UART3_Write(rx_array2[3]);
 UART3_Write(rx_array2[4]);
 UART3_Write(rx_array2[5]);
 UART3_Write(rx_array2[6]);
 UART3_Write(rx_array2[7]);
 UART3_Write(rx_array2[8]);
 UART3_Write(0xFF);
 UART3_Write(0xFF);
 UART3_Write(0xFF);
 j=0;
 }


 }
}
#line 90 "B:/ELEKTRONÝK/deneme/uartxx_calisan/uartxx/uartx.c"
void interrupt() iv IVT_INT_USART2 ics ICS_AUTO {
 if(UART2_Data_Ready()&& j<=8)
 {
 rx_array2[j]=Uart2_Read();
 j++;
 }
}
