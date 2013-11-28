// CANEVAS

// INCLUDES

// LIBRAIRIE STANDARD MPLABC18
#include <p18cxxx.h>
#include <p18f46k22.h>
#include <delays.h>
#include "xlcd.h"

#include "TCPIPConfig.h"
#include "HardwareProfile.h"
#include "TCPIP Stack/StackTsk.h"
#include <timers.h>
#include "TCPIP Stack/TCPIP.h"
#include <string.h>

// LIBRAIRIE PERSONNELLE



// DIRECTIVES COMPILATIONS
//osc=16MHz interne		//=> 250ns pour une instruction
//aller voir dans pic 18f46k22.INC

#pragma config FOSC = INTIO67	//Fosc=1000 Sélection oscillateur interne, I/O sur RA6 and RA7
#pragma config PLLCFG = ON		//4xPLL
#pragma config PRICLKEN = ON	//primary clock
#pragma config FCMEN = OFF		//Fail-Safe Clock Monitor

#pragma config LVP = OFF  //Programmation in situ (ICSP) en basse tension
#pragma config PWRTEN = OFF //Timer de démarrage
#pragma config WDTEN = OFF  //Chien de garde désactivé
#pragma config BOREN = OFF  //Détection de fluctuation d'alimentation (Brown-out)
#pragma config IESO = OFF	//apres PWRT et POR voir datasheet page42

//DEFINE


//VARIABLES GLOBALES
APP_CONFIG AppConfig;



//FONCTIONS INTERNES
void HAUTEPRIORITEInterrupt(void);
void BASSEPRIORITEInterrupt(void);
void DelayFor18TCY(void);

void DelayPORXLCD(void);

void DelayXLCD(void);

// ************* PLACEMENT DU CODE DE L'INTERRUPTION  HAUTE PRIORITE  *************
// 		On déclare que lors d'une interruption on doit exécuter
// 		le code de la fonction HAUTEPRIORITEInterrupt
// ********************************************************************************
#pragma code toto=0x0008
void tata(void)
 {
  _asm GOTO HAUTEPRIORITEInterrupt _endasm
 }
#pragma code // retour à la zone de code


// ************* PLACEMENT DU CODE DE L'INTERRUPTION  BASSE PRIORITE  *************
// 		On déclare que lors d'une interruption on doit exécuter
// 		le code de la fonction BASSEPRIORITEInterrupt
// ********************************************************************************
#pragma code tutu=0x0018
void titi(void)
 {
  _asm GOTO BASSEPRIORITEInterrupt _endasm
 }
#pragma code // retour à la zone de code



// PROGRAMME PRINCIPAL
void main()
{
    OSCCONbits.IRCF=0b111;
    //LCD
    ANSELD = 0;
    ANSELA = 0;
    TRISD = 0;
    TRISA = 0;
    while(BusyXLCD());
    OpenXLCD(FOUR_BIT & LINES_5X7);
    while(BusyXLCD());
    SetDDRamAddr(0x00);
    while(BusyXLCD());
    putrsXLCD("DESSANDE");
    while(BusyXLCD());
    SetDDRamAddr(0x40);
    while(BusyXLCD());
    putrsXLCD("Alexandre");
    while(BusyXLCD());

    while(1)
    {

    }
}


// ********************  HAUTEPRIORITEInterrupt *******************************
// 				ICI: GESTION DES INTERRUPTIONS DE HAUTE PRIORITE
// ****************************************************************************
#pragma interrupt HAUTEPRIORITEInterrupt
void HAUTEPRIORITEInterrupt(void)
{
 // *****************************************
 // INTERRUPTION DE TIMER0 (toutes les 1s)
 // *****************************************

}




// ******************** BASSEPRIORITEInterrupt ********************************
// 				ICI: GESTION DES INTERRUPTIONS DE BASSE PRIORITE
// ****************************************************************************
#pragma interrupt BASSEPRIORITEInterrupt
void BASSEPRIORITEInterrupt(void)
{

}

void DelayFor18TCY(void){
	Nop();
        Nop();
	Nop();
        Nop();
	Nop();
        Nop();
	Nop();
        Nop();
	Nop();
        Nop();
	Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
}

void DelayPORXLCD(void){
	Delay1KTCYx(60);
}

void DelayXLCD(void){
	Delay1KTCYx(20);
}