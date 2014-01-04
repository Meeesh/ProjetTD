#include "../head.h"


void initRFID(void)
{
    //Config USART
        //RX & TX en entrÃ©e
    TRISDbits.TRISD7 = IN;
    TRISDbits.TRISD6 = IN;
        //Transmission
    TXSTA2bits.SYNC = 0;        //mode asynchrone
    TXSTA2bits.BRGH = 0;        //selection du registre du generateur de bauds
    BAUDCON2bits.BRG16 = 0;     //desactivation du registre haut du selecteur de bauds
    SPBRG2 = 25;                //selection du baud 9600

    TXSTA2bits.TX9 = 0;         //dÃ©sactivation du 9eme bit Ã  la reception
        //Reception
    RCSTA2bits.RX9 = 0;         //dÃ©sactivation du 9eme bit a l'envoi
    IPR3bits.RC2IP = 1;         //selection de la prioritÃ© en haute de l'interruption
    INT_RFID = 0;               //mise a zero du flag d'interruption
    PIE3bits.RC2IE = 1;         //activation de l'interruption de la reception de l'USART2
        //Activation finale
    RCSTA2bits.CREN = 1;        //activation du module de reception de l'USART2 en continue
    RCSTA2bits.SPEN = 1;        //definitions des ports TX et RX en tant que communicateur serie
    TXSTA2bits.TXEN = 1;        //activation du module d'envoie USART2

     //Config USART PC
    //RX & TX en entrée
    TRISCbits.TRISC7 = IN;
    TRISCbits.TRISC6 = IN;
        //Transmission
    TXSTA1bits.SYNC = 0;        //mode asynchrone
    TXSTA1bits.BRGH = 0;        //selection du registre du generateur de bauds
    BAUDCON1bits.BRG16 = 0;     //desactivation du registre haut du selecteur de bauds
    SPBRG1 = 25;                //selection du baud 9600

    TXSTA1bits.TX9 = 0;         //désactivation du 9eme bit à la reception
        //Reception
    RCSTA1bits.RX9 = 0;         //désactivation du 9eme bit a l'envoi
    IPR1bits.RC1IP = 1;         //selection de la priorité en haute de l'interruption
    INT_USART = 0;               //mise a zero du flag d'interruption
    PIE1bits.RC1IE = 1;         //activation de l'interruption de la reception de l'USART2
        //Activation finale
    RCSTA1bits.CREN = 1;        //activation du module de reception de l'USART2 en continue
    RCSTA1bits.SPEN = 1;        //definitions des ports TX et RX en tant que communicateur serie
    TXSTA1bits.TXEN = 1;        //activation du module d'envoie USART2
}