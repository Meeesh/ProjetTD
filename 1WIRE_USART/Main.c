#include <p18f46k22.h>
#include <delays.h>
#include "wire/1wire.h"
#include "ftoa/ftoa.h"
#include "head.h"
#include "boutons.h"
#include "affi.h"


#pragma config FOSC = INTIO67	//Fosc=1000 Sélection oscillateur interne, I/O sur RA6 and RA7
#pragma config PLLCFG = ON	//4xPLL
#pragma config PRICLKEN = ON	//primary clock
#pragma config FCMEN = OFF	//Fail-Safe Clock Monitor

#pragma config LVP = OFF    //Programmation in situ (ICSP) en basse tension
#pragma config PWRTEN = OFF //Timer de démarrage
#pragma config WDTEN = OFF  //Chien de garde désactivé
#pragma config BOREN = OFF  //Détection de fluctuation d'alimentation (Brown-out)
#pragma config IESO = OFF   //apres PWRT et POR voir datasheet page42


//Prototypes
void myInterruptLow(void);
void myInterruptHigh(void);


// Déclaration de la fonction qu'on va devoir utiliser quand on a une interuption basse
#pragma code lowVector=0x0018
void atInterruptLow(void)
 {
  _asm GOTO myInterruptLow _endasm
 }
#pragma code // retour à la zone de code

// Déclaration de la fonction qu'on va devoir utiliser quand on a une interuption haute
#pragma code highVector=0x0008
void atInterruptHigh(void)
 {
  _asm GOTO myInterruptHigh _endasm
 }
#pragma code // retour à la zone de code

void DelayFor18TCY(void);
void DelayPORXLCD(void);
void DelayXLCD(void);
void envoyerMessage (void);
void sendToUsart(char);
//Variables Globales
volatile char capteur[5];
volatile float temp;
volatile int flagtimer, i ;
char bouton='0';

void main(void){

    OSCCONbits.IRCF=0b111;

    //Analogique/numérique
    ANSELA=0;
    ANSELB=0;
    ANSELC=0;
    ANSELD=0;
    ANSELE=0;
    ANSELDbits.ANSD4=0;
    ANSELCbits.ANSC6=0;
    ANSELCbits.ANSC7=0;

    //Entrée Sortie

    TRISBbits.TRISB1=1;
    TRISEbits.RE0=1; //Bouton
    TRISEbits.RE1=1;
    TRISEbits.RE2=1;
    TRISCbits.RC0=1;
    TRISCbits.RC1=1;
    TRISCbits.RC2=0; //LED en Output
    TRISBbits.RB4=0; //Relais en Output
    TRISCbits.RC6=1; //USART : Pin en en Input car dans datasheet.
    TRISCbits.RC7=1;
    TRISDbits.RD4=1; //Photodiode
    TRISBbits.RB0=1; //Interruption en Input
    TRISBbits.TRISB5=1;

    //Led allumé/eteint
    PORTCbits.RC2=0;

    //Configuration du timer

    INTCONbits.GIE=1;
    INTCONbits.PEIE=1;
    RCONbits.IPEN=1;
    T1CONbits.TMR1CS=0b00;
    T1CONbits.T1CKPS=0b01;
    T1CONbits.T1SYNC=1;
    T1CONbits.TMR1ON=1;
    T1GCONbits.TMR1GE=0;
    PIE1bits.TMR1IE=1;
    PIR1bits.TMR1IF=1;
    IPR1bits.TMR1IP=1;
    TMR1H=0x3C;
    TMR1L=0xAF;


    // Initialiser le timer 0
    INTCONbits.TMR0IE=1;
    INTCONbits.TMR0IF=0;
    INTCON2bits.TMR0IP=1;
    T0CONbits.T08BIT=0;
    T0CONbits.T0CS=0;
    T0CONbits.PSA=0;
    T0CONbits.T0PS=0b101;
    TMR0H:TMR0L=0x0BDB;
    T0CONbits.TMR0ON=1;

    //Activer les interruptions

    INTCON2bits.INTEDG0=0;
    INTCONbits.INT0E=1;
    INTCONbits.INT0F=0;

    //9600 baut

    TXSTA1bits.SYNC = 0;
    TXSTA1bits.BRGH = 0;
    BAUDCON1bits.BRG16 = 0;
    TXSTA1bits.TXEN = 1;
    TXSTA1bits.TX9 = 0;
    SPBRG1 = 25;
    RCSTA1bits.SPEN = 1;
    RCSTA1bits.CREN = 1;





    //initialisation one wire
    initLCD();
    initBout();
    //capteur = OWInit();

    //1 wire
    Convert_Temperature();
    Delay10KTCYx(200);
    Delay10KTCYx(200);
    temp = Read_Temperature();
    ftoa (temp, &capteur[0], 2, 'f');



    while(1){

        if (bouton == 'g'){
            envoyerMessage();

        }

        if (flagtimer){
            flagtimer=0;
            if (i>4){
                Convert_Temperature();
                temp = Read_Temperature();
                Convert_Temperature();
                ftoa (temp, &capteur[0], 2, 'f');
                PORTCbits.RC2=0;
                i=0;
                }

            }
        }
}

void myInterruptLow(void) {

}

#pragma interrupt myInterruptHigh
void myInterruptHigh(void) {
    if(PIR1bits.TMR1IF){
        flagtimer = 1;
        TMR1H=0x3C;
        TMR1L=0xAF;
        i++;
        PIR1bits.TMR1IF=0;
    }

      if (INTCONbits.TMR0IF == 1)
    {
        bouton = 'g';
        TMR0H:TMR0L=0x0BDB;
        INTCONbits.TMR0IF=0;
    }
}

void envoyerMessage (void) {
    sendToUsart(capteur[0]);
    sendToUsart(capteur[1]);
    sendToUsart(capteur[2]);
    sendToUsart(capteur[3]);
    sendToUsart(capteur[4]);
    bouton = 'n';
}

void sendToUsart (char lettre){
    while (TXSTA1bits.TRMT == 0);       // Tant que le registre d'envoi est rempli
    TXREG1 = lettre;
}