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
#define INT_RFID    PIR3bits.RC2IF
#define IO_LED  PORTCbits.RC2

//**************
//* PROTOTYPES *
//**************
	//INTERRUPTIONS
void interrupt high_priority IntHaute(void);
void interrupt low_priority IntBasse(void);
	//AUTRES
void envoiLectureRFID(void);
void LiczCRC2(unsigned char *, unsigned short *, unsigned char);


//*************
//* VARIABLES *
//*************
volatile char TabRecuRFID[12], TabData[5];
volatile char i=0, FlagLecture=0, FlagEcriture=0, j ;

//********
//* MAIN *
//********
void main(void)
{
    unsigned char x ;
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
		
        TRISCbits.TRISC2 = OUT;
	
		//ETAT REPOS DES PINS 	(PORT)
		
		initBout();
        initLCD();
        
                //CONF INT
        INTCONbits.GIE = 1;
        INTCONbits.GIEL = 1;
        RCONbits.IPEN = 1;


        //Config USART
            //Transmission
        TXSTA2bits.SYNC = 0;
        TXSTA2bits.BRGH = 0;
        BAUDCON2bits.BRG16 = 0;
        TXSTA2bits.TXEN = 1;
        TXSTA2bits.TX9 = 0;
            //Reception
        RCSTA2bits.RX9 = 0;
        RCSTA2bits.CREN = 1;
        IPR3bits.RC2IP = 1;
        INT_RFID = 0;
        PIE3bits.RC2IE = 1;

        envoiLectureRFID();
	
		
	//BOUCLE PRINCIPALE
	while(1)
	{
            if(FlagLecture == 1)
            {
                if(i >= 9)
                {
                    if(TabRecuRFID[7] == 0xFF)
                    {
                        while(BusyXLCD());
                        SetDDRamAddr(0x00);
                        while(BusyXLCD());
                        putrsXLCD("Lecture WIN");
                        
                        for(x = 0; x <= 4; x++){
                            TabData[x] = TabRecuRFID[x+3];
                        }
                        TabData[4] = 0;
                        while(BusyXLCD());
                        SetDDRamAddr(0x40);
                        while(BusyXLCD());
                        putrsXLCD(&TabRecuRFID[3]);
                        i=0;
                        for(j = 0 ; j <= 10 ; j++){
                            TabRecuRFID[j] = 0;
                        }
                    }
                    else
                    {
                        while(BusyXLCD());
                        SetDDRamAddr(0x00);
                        while(BusyXLCD());
                        putrsXLCD("Lecture FAIL !");
                    }
                }
            }
            if(FlagEcriture == 1)
            {
                if(i >= 5)
                {
                    i = 0;
                    for(j = 0; j<= 10; j++)
                    {
                        TabRecuRFID[j] = 0;
                    }
                }
            }
	}
}


//************
//* FONCTIONS *
//************
	//INTERRUPTIONS
void interrupt high_priority IntHaute(void)
{
    IO_LED = ON;
    if(INT_RFID == 1)
    {
        TabRecuRFID[i]=RCREG;
        i++;
        if(TabRecuRFID[2] == 0x13)        //(c'est une lecture) il faut vider le tableau
            FlagLecture = 1;
        if(TabRecuRFID[2] == 0x11)
            FlagEcriture = 1;
        INT_RFID = 0;
    }

}
void interrupt low_priority IntBasse(void)
{
	
}

void envoiLectureRFID(void)
{
    char tmp;
    unsigned char envoi[6];
    envoi[0] = 0xff;
    envoi[1] = 0x06;
    envoi[2] = 0x12;
    envoi[3] = 0x02;
    LiczCRC2(envoi, (unsigned short *)&envoi[4], 4);
    tmp = envoi[4]; envoi[4] = envoi[5]; envoi[5] = tmp;
    TXREG2 = envoi;
}

void LiczCRC2(unsigned char *ZAdr, unsigned short *DoAdr, unsigned char Ile)
{
    int i,NrBajtu;
    unsigned short C;
    *DoAdr=0;
    for (NrBajtu=1;NrBajtu<=Ile;NrBajtu++,ZAdr++)
    {
    C=((*DoAdr>>8)^*ZAdr)<<8;
    for (i=0;i<8;i++)
    if (C&0x8000) C=(C<<1)^0x1021;
    else C=C<<1;
    *DoAdr=C^(*DoAdr<<8);
}
}