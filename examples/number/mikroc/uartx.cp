#line 1 "B:/ELEKTRONÝK/deneme/number/uartx.c"
#line 10 "B:/ELEKTRONÝK/deneme/number/uartx.c"
char gelen;
long page,component;
char rx_buffer,rx_array[8];
int i=0,j=0;
char txt[4];
#line 33 "B:/ELEKTRONÝK/deneme/number/uartx.c"
void hextostr(char eleman)
{
 char sol,sag;
 sol=(eleman>>4)&0x0F;
 if(sol>=10)
 {
 sol+=55;
 }
 else
 sol+=48;

 sag=eleman&0x0F;

 if(sag>=10)
 {
 sag+=55;
 }
 else
 sag+=48;
 txt[0]='0';
 txt[1]='x';
 txt[2]=sol;
 txt[3]=sag;
}
#line 101 "B:/ELEKTRONÝK/deneme/number/uartx.c"
void main()
{
 UART2_Init_Advanced(57600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT,
 &_GPIO_MODULE_USART2_PA23);

 Delay_ms(200);

 EnableInterrupts();
 USART2_CR1bits.RXNEIE = 1;
 NVIC_IntEnable(IVT_INT_USART2);



 while(1)
 {
#line 124 "B:/ELEKTRONÝK/deneme/number/uartx.c"
 Delay_ms(200);


 if (rx_array[0] == 0x65&& i==6){
 if (rx_array[1] == 0x00){
 if (rx_array[2] == 0x01){
 if (rx_array[3] == 0x00){
 if (rx_array[4] == 0xFF){
 if (rx_array[5] == 0xFF){
 if (rx_array[6] == 0xFF){
 USART2_CR1bits.RXNEIE = 0;
 UART2_Write_Text("n0.val=44");
 UART2_Write(0xFF);
 UART2_Write(0xFF);
 UART2_Write(0xFF);
 USART2_CR1bits.RXNEIE = 1;
 i=0;
 }
 }
 }
 }
 }
 }
 }

 if (rx_array[0] == 0x65&& i==6){
 if (rx_array[1] == 0x00){
 if (rx_array[2] == 0x02){
 if (rx_array[3] == 0x00){
 if (rx_array[4] == 0xFF){
 if (rx_array[5] == 0xFF){
 if (rx_array[6] == 0xFF){
 USART2_CR1bits.RXNEIE = 0;
 UART2_Write_Text("n0.val=55");
 UART2_Write(0xFF);
 UART2_Write(0xFF);
 UART2_Write(0xFF);
 USART2_CR1bits.RXNEIE = 1;
 i=0;
 }
 }
 }
 }
 }
 }
 }



 }
}


 void interrupt() iv IVT_INT_USART2 ics ICS_AUTO {




 if(UART2_Data_Ready()&& i<=6)
 {
 rx_array[i]=Uart2_Read();
 i++;
 }
}
