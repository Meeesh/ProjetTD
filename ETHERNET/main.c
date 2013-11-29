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

#pragma config FOSC = INTIO67	//Fosc=1000 S�lection oscillateur interne, I/O sur RA6 and RA7
#pragma config PLLCFG = ON		//4xPLL
#pragma config PRICLKEN = ON	//primary clock
#pragma config FCMEN = OFF		//Fail-Safe Clock Monitor

#pragma config LVP = OFF  //Programmation in situ (ICSP) en basse tension
#pragma config PWRTEN = OFF //Timer de d�marrage
#pragma config WDTEN = OFF  //Chien de garde d�sactiv�
#pragma config BOREN = OFF  //D�tection de fluctuation d'alimentation (Brown-out)
#pragma config IESO = OFF	//apres PWRT et POR voir datasheet page42

//DEFINE


//VARIABLES GLOBALES ETHERNET
APP_CONFIG AppConfig; //Structure d�clar�e dans StackTsk.h -> Sans ca pas de compilation
BYTE DonneEnvoi[30]="Hello world\0"; //Donn�es � envoyer en utilisant TCPPutArray
static TCP_SOCKET skt = INVALID_SOCKET; //Initialisation du socket TCP
BOOL connectTCP=0;
WORD verifPut=0;

//FONCTIONS INTERNES
void HAUTEPRIORITEInterrupt(void);
void BASSEPRIORITEInterrupt(void);
void DelayFor18TCY(void);

void DelayPORXLCD(void);

void DelayXLCD(void);

// ************* PLACEMENT DU CODE DE L'INTERRUPTION  HAUTE PRIORITE  *************
// 		On d�clare que lors d'une interruption on doit ex�cuter
// 		le code de la fonction HAUTEPRIORITEInterrupt
// ********************************************************************************
#pragma code toto=0x0008
void tata(void)
 {
  _asm GOTO HAUTEPRIORITEInterrupt _endasm
 }
#pragma code // retour � la zone de code


// ************* PLACEMENT DU CODE DE L'INTERRUPTION  BASSE PRIORITE  *************
// 		On d�clare que lors d'une interruption on doit ex�cuter
// 		le code de la fonction BASSEPRIORITEInterrupt
// ********************************************************************************
#pragma code tutu=0x0018
void titi(void)
 {
  _asm GOTO BASSEPRIORITEInterrupt _endasm
 }
#pragma code // retour � la zone de code



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

    //Module ethernet
    ENC_CS_TRIS=0; //Configuration de la pile
    ENC_CS_IO=1; //Configuration de la pile
    TickInit(); //Initialisation de l'horloge de la pile TCPIP var utiliser le TMR0
    //skt = TCPOpen((DWORD)(IP_ADDR)"10.1.1.3",TCP_OPEN_IP_ADDRESS,80,TCP_PURPOSE_DEFAULT); //Ouverture d'un nouveau socket CLIENT ici TCP sur une certaine IP
    //Ou alors
    skt = TCPOpen((DWORD)(IP_ADDR)"10.1.1.3",TCP_OPEN_IP_ADDRESS,45684,TCP_PURPOSE_GENERIC_TCP_CLIENT);
    StackInit(); //Initialisation de la pile

    while(1)
    {
        StackTask();
        StackApplications();
        ////ApplicationTask(); //Notre application
        connectTCP = TCPIsConnected(skt); //V�rifie si on a une connexion �tablie avec le noeud suivant
        if(connectTCP == TRUE){
            verifPut TCPIsPutReady(skt); //Retourne le nombre d'octets qui peuvent �tre envoy�s dans le tampon TX TCP
            if(verifPut == 0){
                StackTask();
                StackApplications();
                verifPut TCPIsPutReady(skt);
                TCPPutArray(skt, DonneEnvoi, 30);
            }
        }
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
    TickUpdate();
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