//FONCTIONS TIMER1


//INCLUDE
#include "head.h"

//DECLARATION DES VARIABLES GLOGALES


//PROTOTYPE FONCTIONS INTERNES


//CONTENU FONCTIONS EXTERNES


void TIMER1_Init_1ms(void)
{
//configuration du timer1
    TMR1H = 0xFE;
    TMR1L = 0x0B;
    T1CONbits.TMR1CS = 0b00;
    T1CONbits.T1CKPS = 0b11;
    T1CONbits.T1SYNC = 1;
    T1GCONbits.TMR1GE = 0;
//interruptions du timer
    INT_TMR1 = 0;
    IPR1bits.TMR1IP = 1;
    PIE1bits.TMR1IE = 1;
//activation du timer 1
    T1CONbits.TMR1ON = 1;
}



