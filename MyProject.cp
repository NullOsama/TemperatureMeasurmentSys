#line 1 "C:/Users/aaxxo/Desktop/TEMP/MyProject.c"
sbit LCD_RS at RD4_bit;
sbit LCD_EN at RD5_bit;
sbit LCD_D4 at RD0_bit;
sbit LCD_D5 at RD1_bit;
sbit LCD_D6 at RD2_bit;
sbit LCD_D7 at RD3_bit;

sbit LCD_RS_Direction at TRISD4_bit;
sbit LCD_EN_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD0_bit;
sbit LCD_D5_Direction at TRISD1_bit;
sbit LCD_D6_Direction at TRISD2_bit;
sbit LCD_D7_Direction at TRISD3_bit;

sbit A0 at RA0_bit;
sbit A1 at RA1_bit;


unsigned int adcResult0 = 0;
float measuredVoltage0;
float temp0;
char tempValueText0[15];

unsigned int adcResult1 = 0;
float measuredVoltage1;
float temp1;
char tempValueText1[15];

float avgTemp;
char avgTempText[15];


void main()
{
 TRISD = 0;
 ADC_Init();

 Lcd_Init();
 Delay_ms(500);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 5, "Hello!!");
 Delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);


 do
 {
 adcResult0 = ADC_Read(0);
 adcResult1 = ADC_Read(1);

 measuredVoltage0 = (adcREsult0 * 5000.0) / 1023.0;
 temp0 = measuredVoltage0 / 10.0;

 measuredVoltage1 = (adcREsult1 * 5000.0) / 1023.0;
 temp1 = measuredVoltage1 / 10.0;

 avgTemp = (temp0 + temp1) / 2.0;


 if((int)avgTemp > 30)
 PORTD.RD6 = 1;
 else
 if(avgTemp <= 25)
 PORTD.RD6 = 0;

 if(PORTD.RD6 == 1)
 Lcd_Out(2, 10, "On ");
 else
 Lcd_Out(2, 10, "OFF");

 FloatToStr(temp0, tempValueText0);
 tempValueText0[2] = 0;

 FloatToStr(temp1, tempValueText1);
 tempValueText1[3] = 0;

 FloatToStr(avgTemp, avgTempText);
 if((int)avgTemp > 99)
 avgTempText[3] = 0;
 else
 avgTempText[2] = 0;

 Lcd_Out(1, 1, "Avg.Temp:");
 Lcd_Out(1, 10, avgTempText);
 Lcd_Out(1, 15, "C");
 Lcd_Out(2, 6, "Fan");

 Delay_ms(300);
 Lcd_Cmd(_LCD_CLEAR);
 }while(1);


}
