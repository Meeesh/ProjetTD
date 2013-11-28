#include "affi.h"
#include <delays.h>
#include <p18lf46k22.h>
#include "head.h"
	//attention les trois premieres fonction ne peuvent pas se mettre dans se fichier mais dans le main (CTRL-X CTRL-V)
	//ca fonctionne ???
	//
	//reste a voir, j'arrive a compiler en cc18 avec les fonctions dans un autre fichier
	void DelayFor18TCY(void)
{
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
void DelayPORXLCD(void)			//delais de 15ms
{
	Delay10KTCYx(6);
}
void DelayXLCD(void)			//delais de 5ms
{
	Delay10KTCYx(2);
}
void initLCD(void)				//permet de placer les pins en sortie
{
    TRISDbits.TRISD0 = OUT;
    TRISDbits.TRISD1 = OUT;
    TRISDbits.TRISD2 = OUT;
    TRISDbits.TRISD3 = OUT;
                //LCD CONT
    TRISAbits.TRISA1 = OUT;
    TRISAbits.TRISA2 = OUT;
    TRISDbits.TRISD5 = OUT;
}