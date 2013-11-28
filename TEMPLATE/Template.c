//************
//* INCLUDES *
//************
#include <p18lf46k22.h>



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



//**********************
//* VARIABLES GLOBALES *
//**********************
enum {NUM, ANA};
enum {OUT, IN};
enum {OFF, ON};

//**************
//* PROTOTYPES *
//**************
	//INTERRUPTIONS
void IntHaute(void);
void IntBasse(void);
	//AUTRES
	
	
//******************
//* ROUTINES D'INT *
//******************

#pragma code lowVector=0x0018
void atInterruptLow(void)
{
	_asm GOTO IntBasse _endasm
}
#pragma code

#pragma code hightVector=0x0008
void atInterruptHight(void)
{
	_asm GOTO IntHaute _endasm
}
#pragma code

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
		
		
		
		
	//BOUCLE PRINCIPALE
	while(1)
	{
		
	}
}


//************
//* FONCTIONS *
//************
	//INTERRUPTIONS
void IntHaute(void)
{
	
}
void IntBasse(void)
{
	
}