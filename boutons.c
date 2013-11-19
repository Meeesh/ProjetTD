#include <p18lf46k22.h>
#include "boutons.h"
#include "head.h"

//********************************************
//* PERMET D'INITIALISER L'ETAT DES BOUTTONS *
//********************************************
void initBout()
{
	TRISEbits.TRISE0 = IN;
	TRISEbits.TRISE1 = IN;
	TRISEbits.TRISE2 = IN;
	TRISCbits.TRISC0 = IN;
	TRISCbits.TRISC1 = IN;

        INTCONbits.INT0IE = 1;
        BT_FL = 0;
        INTCON2bits.INTEDG0 = 0;
}
