#line 1 "B:/ELEKTRONÝK/deneme/nexnumber/nexnumber.c"
#line 46 "B:/ELEKTRONÝK/deneme/nexnumber/nexnumber.c"
int i=0,arttir=0,azalt=0,sayi=66;
char rx_array[20];


 char txt1[10];




 void sendCommand2(char cmd[20])
 {
 int x=0;


 while(cmd[x] != '\0')
 {
 UART3_Write(cmd[x]);
 x++;
 }

 UART3_Write(0xFF);
 UART3_Write(0xFF);
 UART3_Write(0xFF);
 x=0;

 }


 void getCommand(int i)
 {




 if (rx_array[0]==0x65)
 {
 delay_ms(1);

 if (rx_array[2]==0x01)
 {
 arttir=1;
 }
 if (rx_array[2]==0x02)
 {
 azalt=1;
 }
 }




 if (rx_array[0]==0x71)
 {

 }


 if (rx_array[0]==0x70)
 {

 }
 }



void main()
{


 UART3_Init_Advanced(57600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT,
 &_GPIO_MODULE_USART3_PD89);

 EnableInterrupts();
 USART3_CR1bits.RXNEIE = 1;
 NVIC_IntEnable(IVT_INT_USART3);



while(1)
 {

 if(i)
 {
 getCommand(i);
 i=0;
 }

 if(arttir)
 {

 sayi++;

 txt1[0] = 0x6E;
 txt1[1] = 0x30;
 txt1[2] = 0x2E;
 txt1[3] = 0x76;
 txt1[4] = 0x61;
 txt1[5] = 0x6C;
 txt1[6] = 0x3D;
 txt1[7]=((sayi/10)%10)+48;
 txt1[8]=(sayi%10)+48;


 sendCommand2(txt1);

 delay_ms(1);

 arttir=0;
 }


 if(azalt)
 {
 sayi--;

 txt1[0] = 0x6E;
 txt1[1] = 0x30;
 txt1[2] = 0x2E;
 txt1[3] = 0x76;
 txt1[4] = 0x61;
 txt1[5] = 0x6C;
 txt1[6] = 0x3D;
 txt1[7]=((sayi/10)%10)+48;
 txt1[8]=(sayi%10)+48;


 sendCommand2(txt1);


 delay_ms(1);

 azalt=0;
 }

 }
}
#line 189 "B:/ELEKTRONÝK/deneme/nexnumber/nexnumber.c"
void interrupt_usart3() iv IVT_INT_USART3 ics ICS_AUTO
{





 if(UART3_Data_Ready()&& i<=20)
 {
 rx_array[i]=Uart3_Read();
 i++;
 }
}
