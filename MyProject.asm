
_main:

;MyProject.c,33 :: 		void main()
;MyProject.c,35 :: 		TRISD = 0;
	CLRF        TRISD+0 
;MyProject.c,36 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;MyProject.c,38 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;MyProject.c,39 :: 		Delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       120
	MOVWF       R12, 0
	MOVLW       165
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
	NOP
;MyProject.c,40 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,41 :: 		Lcd_Out(1, 5, "Hello!!");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,42 :: 		Delay_ms(1000);
	MOVLW       25
	MOVWF       R11, 0
	MOVLW       240
	MOVWF       R12, 0
	MOVLW       77
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	DECFSZ      R11, 1, 1
	BRA         L_main1
	NOP
	NOP
;MyProject.c,43 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,44 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,47 :: 		do
L_main2:
;MyProject.c,49 :: 		adcResult0 = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _adcResult0+0 
	MOVF        R1, 0 
	MOVWF       _adcResult0+1 
;MyProject.c,50 :: 		adcResult1 = ADC_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+4 
	MOVF        R1, 0 
	MOVWF       FLOC__main+5 
	MOVF        FLOC__main+4, 0 
	MOVWF       _adcResult1+0 
	MOVF        FLOC__main+5, 0 
	MOVWF       _adcResult1+1 
;MyProject.c,52 :: 		measuredVoltage0 = (adcREsult0  * 5000.0) / 1023.0;
	MOVF        _adcResult0+0, 0 
	MOVWF       R0 
	MOVF        _adcResult0+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       64
	MOVWF       R5 
	MOVLW       28
	MOVWF       R6 
	MOVLW       139
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _measuredVoltage0+0 
	MOVF        R1, 0 
	MOVWF       _measuredVoltage0+1 
	MOVF        R2, 0 
	MOVWF       _measuredVoltage0+2 
	MOVF        R3, 0 
	MOVWF       _measuredVoltage0+3 
;MyProject.c,53 :: 		temp0 = measuredVoltage0 / 10.0; //Convert mV to Celsius
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        R2, 0 
	MOVWF       FLOC__main+2 
	MOVF        R3, 0 
	MOVWF       FLOC__main+3 
	MOVF        FLOC__main+0, 0 
	MOVWF       _temp0+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       _temp0+1 
	MOVF        FLOC__main+2, 0 
	MOVWF       _temp0+2 
	MOVF        FLOC__main+3, 0 
	MOVWF       _temp0+3 
;MyProject.c,55 :: 		measuredVoltage1 = (adcREsult1  * 5000.0) / 1023.0;
	MOVF        FLOC__main+4, 0 
	MOVWF       R0 
	MOVF        FLOC__main+5, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       64
	MOVWF       R5 
	MOVLW       28
	MOVWF       R6 
	MOVLW       139
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _measuredVoltage1+0 
	MOVF        R1, 0 
	MOVWF       _measuredVoltage1+1 
	MOVF        R2, 0 
	MOVWF       _measuredVoltage1+2 
	MOVF        R3, 0 
	MOVWF       _measuredVoltage1+3 
;MyProject.c,56 :: 		temp1 = measuredVoltage1 / 10.0;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _temp1+0 
	MOVF        R1, 0 
	MOVWF       _temp1+1 
	MOVF        R2, 0 
	MOVWF       _temp1+2 
	MOVF        R3, 0 
	MOVWF       _temp1+3 
;MyProject.c,58 :: 		avgTemp = (temp0 + temp1) / 2.0;
	MOVF        FLOC__main+0, 0 
	MOVWF       R4 
	MOVF        FLOC__main+1, 0 
	MOVWF       R5 
	MOVF        FLOC__main+2, 0 
	MOVWF       R6 
	MOVF        FLOC__main+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _avgTemp+0 
	MOVF        R1, 0 
	MOVWF       _avgTemp+1 
	MOVF        R2, 0 
	MOVWF       _avgTemp+2 
	MOVF        R3, 0 
	MOVWF       _avgTemp+3 
;MyProject.c,61 :: 		if((int)avgTemp > 30)
	CALL        _double2int+0, 0
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main14
	MOVF        R0, 0 
	SUBLW       30
L__main14:
	BTFSC       STATUS+0, 0 
	GOTO        L_main5
;MyProject.c,62 :: 		PORTD.RD6 = 1;
	BSF         PORTD+0, 6 
	GOTO        L_main6
L_main5:
;MyProject.c,64 :: 		if(avgTemp <= 25)
	MOVF        _avgTemp+0, 0 
	MOVWF       R4 
	MOVF        _avgTemp+1, 0 
	MOVWF       R5 
	MOVF        _avgTemp+2, 0 
	MOVWF       R6 
	MOVF        _avgTemp+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       72
	MOVWF       R2 
	MOVLW       131
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main7
;MyProject.c,65 :: 		PORTD.RD6 = 0;
	BCF         PORTD+0, 6 
L_main7:
L_main6:
;MyProject.c,67 :: 		if(PORTD.RD6 == 1)
	BTFSS       PORTD+0, 6 
	GOTO        L_main8
;MyProject.c,68 :: 		Lcd_Out(2, 10, "On ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	GOTO        L_main9
L_main8:
;MyProject.c,70 :: 		Lcd_Out(2, 10, "OFF");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_main9:
;MyProject.c,72 :: 		FloatToStr(temp0, tempValueText0);
	MOVF        _temp0+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _temp0+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _temp0+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _temp0+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _tempValueText0+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_tempValueText0+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;MyProject.c,73 :: 		tempValueText0[2] = 0;
	CLRF        _tempValueText0+2 
;MyProject.c,75 :: 		FloatToStr(temp1, tempValueText1);
	MOVF        _temp1+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _temp1+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _temp1+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _temp1+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _tempValueText1+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_tempValueText1+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;MyProject.c,76 :: 		tempValueText1[3] = 0;
	CLRF        _tempValueText1+3 
;MyProject.c,78 :: 		FloatToStr(avgTemp, avgTempText);
	MOVF        _avgTemp+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _avgTemp+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _avgTemp+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _avgTemp+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _avgTempText+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_avgTempText+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;MyProject.c,79 :: 		if((int)avgTemp > 99)
	MOVF        _avgTemp+0, 0 
	MOVWF       R0 
	MOVF        _avgTemp+1, 0 
	MOVWF       R1 
	MOVF        _avgTemp+2, 0 
	MOVWF       R2 
	MOVF        _avgTemp+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main15
	MOVF        R0, 0 
	SUBLW       99
L__main15:
	BTFSC       STATUS+0, 0 
	GOTO        L_main10
;MyProject.c,80 :: 		avgTempText[3] = 0;
	CLRF        _avgTempText+3 
	GOTO        L_main11
L_main10:
;MyProject.c,82 :: 		avgTempText[2] = 0;
	CLRF        _avgTempText+2 
L_main11:
;MyProject.c,84 :: 		Lcd_Out(1, 1, "Avg.Temp:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,85 :: 		Lcd_Out(1, 10, avgTempText);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _avgTempText+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_avgTempText+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,86 :: 		Lcd_Out(1, 15, "C");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,87 :: 		Lcd_Out(2, 6, "Fan");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,89 :: 		Delay_ms(300);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       123
	MOVWF       R12, 0
	MOVLW       252
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	DECFSZ      R11, 1, 1
	BRA         L_main12
	NOP
;MyProject.c,90 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,91 :: 		}while(1);
	GOTO        L_main2
;MyProject.c,94 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
