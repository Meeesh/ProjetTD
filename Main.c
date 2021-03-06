//************
//* INCLUDES *
//************
#include <p18lf46k22.h>
#include "head.h"
#include "xlcd.h"
#include "boutons.h"
#include "affi.h"



// **************************
// * DIRECTIVES COMPILATION *
// **************************
#pragma config FOSC = INTIO67			
#pragma config PLLCFG = OFF
#pragma config PRICLKEN = OFF
#pragma config FCMEN = OFF
#pragma config PWRTEN = ON
#pragma config BOREN = OFF
#pragma config WDTEN = OFF
#pragma config LVP = OFF				
#pragma config MCLRE = EXTMCLR  		
#pragma config IESO = OFF


//**********
//* DEFINE *
//**********


//**************
//* PROTOTYPES *
//**************
	//INTERRUPTIONS
void interrupt high_priority IntHaute(void);
void interrupt low_priority IntBasse(void);
	//AUTRES

//********
//* MAIN *
//********
void main(void)
{
	//VARAIBLES LOCALES
	
	
	//CONFIG PIC
	OSCCONbits.IRCF = 0b111;	// on defini la frequence de l'oscillateur à 16 mHz
	
	
	//CONFIG PIN
		//SELECTION AN/DI		(ANSEL)
		
	ANSELA = NUM;		//on place toutes les pins en numérique, XC8 se fout des pins qu'on ne peut pas définir
	ANSELB = NUM;
	ANSELC = NUM;
	ANSELD = NUM;
	ANSELE = NUM;
	
		//SELECTION IN/OUT		(TRIS)
		
		
	
		//ETAT REPOS DES PINS 	(PORT)
		
	initLCD();
        initBout();

        OpenXLCD(FOUR_BIT & LINES_5X7);
        while(BusyXLCD());
        putrsXLCD("Hullo");
        while(BusyXLCD());
        SetDDRamAddr(0x04);
		
		
	//BOUCLE PRINCIPALE
	while(1)
	{
		
	}
}


//************
//* FONCTIONS *
//************
	//INTERRUPTIONS
void interrupt high_priority IntHaute(void)
{
	
}
void interrupt low_priority IntBasse(void)
{
	
}
	
	//AUTRES