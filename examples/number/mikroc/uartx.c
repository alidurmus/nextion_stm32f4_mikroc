/*
Program Ad�            : PC-STM32F407 UART �leti�im
Donan�m                 : STM32F4 Discovery kit
Derleyici S�r�m�    : MikroC Pro for ARM 3.3.5
MCU Frekans�        : 140Mhz.
*/



char gelen;      // "gelen" isminde bir de�i�ken ve "i" isminde bir saya� tan�mlan�yor.
long page,component;
char rx_buffer,rx_array[8]; // change value to adjust for buffer size
int i=0,j=0;
char txt[4];


////////////////////////////////////////////////////////////
 /*
    Hex olarak gelen veri 0x32 gibi
     bunu istenilen format ba�ka olabilir
     string format�na d�n��t�rmek i�in
      10 dan b�y�kse +55
      10 dan k���kse + 48 konmal�
        �rnek gelen veri 0x01 ise
        a��l�m� binary olarak 0000 0001
        str olarak 1 ise 0011 0001
        yani 32+16 = 48 olacakt�r
        birinci buton 0x01 g�nderecek


 */

void hextostr(char eleman)
{
  char sol,sag;
  sol=(eleman>>4)&0x0F; //0000 0001 d�rt basamak kayd�r 0001 0000 ve 0000 11111
  if(sol>=10)
  {
   sol+=55;
  }
  else
    sol+=48; //  0001 => 1 + 48

    sag=eleman&0x0F;  // 0001 0000 ve 0000 1111

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
////////////////////////////////////////////////////////////




/*void getValue(number)
{
    String cmd = String("get ");
    cmd += getObjName();
    cmd += ".val";
    sendCommand(cmd.c_str());
    return recvRetNumber(number);


 }
  void setValue(number)
{
    char buf[10] = {0};
    String cmd;

    utoa(number, buf, 10);
    cmd += getObjName();
    cmd += ".val=";
    cmd += buf;

    sendCommand(cmd.c_str());
    return recvRetCommandFinished();


 }
void Deger_al(void *ptr)
{
    uint32_t number;

    dbSerialPrintln("b0PopCallback");

    n0.getValue(&number);

    number += 1;

    n0.setValue(number);
}*/


void main()
{
  UART2_Init_Advanced(57600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT,
  &_GPIO_MODULE_USART2_PA23);

  Delay_ms(200);

  EnableInterrupts();// enable interrupts.
 USART2_CR1bits.RXNEIE = 1; // enable uart rx interrupt
  NVIC_IntEnable(IVT_INT_USART2); // enable interrupt vector



  while(1) //Sonsuz d�ng�.
  {

/*if(UART2_Data_Ready()) // If data is received
  {
    rx_array[i]=Uart2_Read();

    i++;
  }*/

      Delay_ms(200);


    if (rx_array[0] == 0x65&& i==6){
      if (rx_array[1] == 0x00){
        if (rx_array[2] == 0x01){
          if (rx_array[3] == 0x00){
            if (rx_array[4] == 0xFF){
              if (rx_array[5] == 0xFF){
                if (rx_array[6] == 0xFF){
                  USART2_CR1bits.RXNEIE = 0;
                  UART2_Write_Text("n0.val=44"); //
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
                  UART2_Write_Text("n0.val=55"); //
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
  //////////////////////////////////////////////////////

 void interrupt() iv IVT_INT_USART2 ics ICS_AUTO {
// Gelmesini bekledi�im bilgi
//0x65 0x00 0x01 0x00 0xFF 0xFF 0xFF


  if(UART2_Data_Ready()&& i<=6) // If data is received
  {
    rx_array[i]=Uart2_Read();
    i++;
  }
}