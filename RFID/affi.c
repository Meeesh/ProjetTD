#include "affi.h"
#include <delays.h>
#include <p18lf46k22.h>
#include "head.h"
#include "xlcd.h"
	//attention les trois premieres fonction ne peuvent pas se mettre dans se fichier mais dans le main (CTRL-X CTRL-V)
	//ca fonctionne ???
	
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

    OpenXLCD(FOUR_BIT & LINES_5X7);
    while(BusyXLCD());
    putrsXLCD("Hello RFID");
    while(BusyXLCD());
    SetDDRamAddr(0x40);
}