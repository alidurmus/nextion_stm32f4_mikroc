
/*      Program Adý            : PC-STM32F407 Nextion Number
        Donaným                 : STM32F4 Discovery kit  and Discovery Shield
        Derleyici Sürümü    : MikroC Pro for ARM 4.9.0
        MCU Frekansý        : 140Mhz.

 ********************* NEXTION NOTLAR************************************

   come from Nextion
   //Variable name invalid
   //0x1A 0xFF 0xFF 0xFF

   //Invalid instruction
   //0x00 0xFF 0xFF 0xFF



  //touch button
  
  //0x65 0x00 0x01 0x00 0xFF 0xFF 0xFF
  //0X65+Page ID+Component ID+TouchEvent+End



    get command
    get n0.val
  //0x71 0x2C 0x00 0x00 0x00 0xFF 0xFF 0xFF

 ********************* MÝKROC NOTLAR************************************

iki char birleþtirme
char txt = "mikroElektronika";
char txt_sub = "mikro";
char *result;

txt[5] = 0;
result = strncat(txt,txt_sub,4);  // routine appends first
4 characters from the string 'txt_sub' at
the place of first null character in the 'txt' string



*/


int  i=0,arttir=0,azalt=0,sayi=66;
char rx_array[20];


 char txt1[10];


//***********************************************************

  void sendCommand2(char cmd[20])
 {
    int x=0;


  while(cmd[x] != '\0')
  {
     UART3_Write(cmd[x]);
      x++;
   }
    //UART3_Write_Text(cmd);
    UART3_Write(0xFF);
    UART3_Write(0xFF);
    UART3_Write(0xFF);
    x=0;

 }

//***********************************************************
 void getCommand(int i)
  {

  //0x65 0x00 0x01 0x00 0xFF 0xFF 0xFF
  //0X65+Page ID+Component ID+TouchEvent+End

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

      //0x71 0x2C 0x00 0x00 0x00 0xFF 0xFF 0xFF
     // get number ile dönen sayý deðerleri

    if (rx_array[0]==0x71)
       {

      }

        // get text command
      if (rx_array[0]==0x70)
       {

      }
  }

 //*******************************************

void main()
{

    //changed 9600 baud nextion
    UART3_Init_Advanced(57600, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT,
    &_GPIO_MODULE_USART3_PD89);

    EnableInterrupts(); // enable core interrupts
    USART3_CR1bits.RXNEIE = 1; // enable uart rx interrupt
    NVIC_IntEnable(IVT_INT_USART3); // enable interrupt vector



while(1)   //Sonsuz döngü.
   {

  if(i)   // Eðer UART3'e veri gelmiþ ise
     {
      getCommand(i);
      i=0;
     }

     if(arttir)
    {

     sayi++;

      txt1[0] = 0x6E; //n
      txt1[1] = 0x30; //0
      txt1[2] = 0x2E; //.
      txt1[3] = 0x76; // v
      txt1[4] = 0x61; // a
      txt1[5] = 0x6C; // l
      txt1[6] = 0x3D; // =
      txt1[7]=((sayi/10)%10)+48;
      txt1[8]=(sayi%10)+48;


      sendCommand2(txt1);
    // sendCommand2(txt1);
     delay_ms(1);

     arttir=0;
    }


     if(azalt)
    {
     sayi--;

      txt1[0] = 0x6E; //n
      txt1[1] = 0x30; //0
      txt1[2] = 0x2E; //.
      txt1[3] = 0x76; // v
      txt1[4] = 0x61; // a
      txt1[5] = 0x6C; // l
      txt1[6] = 0x3D; // =
      txt1[7]=((sayi/10)%10)+48;
      txt1[8]=(sayi%10)+48;


      sendCommand2(txt1);


      delay_ms(1);

     azalt=0;
    }

   } //while
}//void main()

   /******************

      nextion giden gelen

    *****************/

void interrupt_usart3() iv IVT_INT_USART3 ics ICS_AUTO
{
  //Gelmesini beklediðim bilgi
  //0x65 0x00 0x01 0x00 0xFF 0xFF 0xFF
  //0X65+Page ID+Component ID+TouchEvent+End
  //0x71 0x2C 0x00 0x00 0x00 0xFF 0xFF 0xFF

  if(UART3_Data_Ready()&& i<=20) // If data is received
  {
    rx_array[i]=Uart3_Read();  //nextion response value
    i++;
  }
}