#include "HeaderMain.h"


void InitADC(void){
    ADCON0bits.CHS=0b11000;
    ADCON0bits.ADON=1;
    ADCON2bits.ADFM=1;
    ADCON1bits.PVCFG=0b00;
    ADCON1bits.NVCFG=0b00;
    PMD2bits.ADCMD=1;
    ADCON2bits.ADCS=0b101;
    ADCON2bits.ACQT=0b010;
}

void Convertion(void){
    PORTCbits.RC2=1;
    volatile unsigned int adcRec=0;
    volatile float adc=0;
    volatile unsigned char tmp[5];
    while (BusyXLCD());
    SetDDRamAddr(0x00);
    while (BusyXLCD());
    putrsXLCD("Lux :");
    ADCON0bits.GO_DONE=1;
    while (ADCON0bits.GO_DONE);
    adcRec = ((unsigned int)ADRESH<<8)|(ADRESL);
    adc = (((float)adcRec)*5.0)/1024;
    ftoa(adc, tmp, 2, 'F');
    while (BusyXLCD());
    putsXLCD(tmp);
    
}
