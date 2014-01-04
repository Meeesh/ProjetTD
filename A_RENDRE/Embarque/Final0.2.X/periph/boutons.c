#include "../head.h"

//********************************************
//* PERMET D'INITIALISER L'ETAT DES BOUTTONS *
//********************************************
void initBout()
{
//boutons
    TRISEbits.TRISE0 = IN;
    TRISEbits.TRISE1 = IN;
    TRISEbits.TRISE2 = IN;
    TRISCbits.TRISC0 = IN;
    TRISCbits.TRISC1 = IN;
//interruption INT0
    TRISBbits.TRISB0 = IN;
//interruptions
    INTCONbits.INT0IE = 1;
    INT_BT = 0;
    INTCON2bits.INTEDG0 = 0;
}