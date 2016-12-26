
/*      Program Adý            : PC-STM32F407 UART Ýletiþim
        Donaným                 : STM32F4 Discovery kit
        Derleyici Sürümü    : MikroC Pro for ARM 4.9.0
        MCU Frekansý        : 140Mhz.
*/


int  i=0,j=0;
char gelen,rx_array[10],rx_array2[10];     
 // "gelen" isminde bir deðiþken ve "i" isminde bir sayaç tanýmlanýyor.

void main()
{
 UART2_Init_Advanced(57600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT,
  &_GPIO_MODULE_USART2_PA23);
  
  UART3_Init_Advanced(57600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT,
     &_GPIO_MODULE_USART3_PD89);
     
  Delay_ms(200);
  UART2_Write_Text("ali"); //

  EnableInterrupts(); // enable core interrupts
USART3_CR1bits.RXNEIE = 1; // enable uart rx interrupt
  NVIC_IntEnable(IVT_INT_USART3); // enable interrupt vector
 USART2_CR1bits.RXNEIE = 1; // enable uart rx interrupt
  NVIC_IntEnable(IVT_INT_USART2); // enable interrupt vector

while(1)                                 //Sonsuz döngü.
        {

     // If the previous data has been shifted out, send next data:
/*if (UART2_Tx_Idle() == 1) {
  UART2_Write(_data);
 }*/

        // UART4_Write_text("merhaba"); // gelen veriyi tekrar gönder.



         
          if(i==6)   // Eðer UART3'e veri gelmiþ ise
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
         
         
          if(j==8)   // Eðer UART3'e veri gelmiþ ise
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
         

        } //while
}

 //******************************************



void interrupt_usart3() iv IVT_INT_USART3 ics ICS_AUTO {
   // Gelmesini beklediðim bilgi
  //0x65 0x00 0x01 0x00 0xFF 0xFF 0xFF
    
      if(UART3_Data_Ready()&& i<=6) // If data is received
  {
    rx_array[i]=Uart3_Read();
    i++;
  }
}
    
    
    



void interrupt() iv IVT_INT_USART2 ics ICS_AUTO {
   if(UART2_Data_Ready()&& j<=8) // If data is received
  {
    rx_array2[j]=Uart2_Read();
    j++;
  }
}