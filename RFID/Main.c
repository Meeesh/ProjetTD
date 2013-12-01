//************
//* INCLUDES *
//************
#include <p18lf46k22.h>
#include "head.h"
#include "xlcd.h"
#include "boutons.h"
#include "affi.h"
#include <delays.h>



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
#define IO_REL  PORTBbits.RB4


//**************
//* PROTOTYPES *
//**************
	//INTERRUPTIONS
void IntHaute(void);
void IntBasse(void);
	//AUTRES
void envoiLectureRFID(void);
void LiczCRC2(unsigned char *, unsigned short *, unsigned char);


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


//*************
//* VARIABLES *
//*************
volatile char TabRecuRFID[15], TabData[5];
volatile char i=0, FlagLecture=0, FlagEcriture=0, j ;

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
		
        TRISCbits.TRISC2 = OUT;     //definition de la LED en sortie
        TRISBbits.TRISB4 = OUT;     //definition du relais en sortie
	
		//ETAT REPOS DES PINS 	(PORT)
		
	initBout();     //initialisation des bouttons
        initLCD();      //initialisation de l'écrans LCD
        IO_LED = OFF;
        IO_REL = OFF;
        
        
                //CONF INT
        INTCONbits.GIE = 1;     //activation des iterruptions hautes
        INTCONbits.GIEL = 1;    //activation des interruptions basses
        RCONbits.IPEN = 1;      //activation des priorité des interruptions


        //Config USART
            //RX & TX en entrée
        TRISDbits.TRISD7 = IN;
        TRISDbits.TRISD6 = IN;
            //Transmission
        TXSTA2bits.SYNC = 0;        //mode asynchrone
        TXSTA2bits.BRGH = 0;        //selection du registre du generateur de bauds
        BAUDCON2bits.BRG16 = 0;     //desactivation du registre haut du selecteur de bauds
        SPBRG2 = 25;                //selection du baud 9600
        
        TXSTA2bits.TX9 = 0;         //désacivation du 9eme bit à la reception
            //Reception
        RCSTA2bits.RX9 = 0;         //déasactivation du 9eme bit a l'envoi       
        IPR3bits.RC2IP = 1;         //selection de la priorité en haute de l'interruption
        INT_RFID = 0;               //mise a zero du flag d'interruption
        PIE3bits.RC2IE = 1;         //activation de l'interruption de la reception de l'USART2
            //Activation finale
        RCSTA2bits.CREN = 1;        //activation du module de reception de l'USART2
        RCSTA2bits.SPEN = 1;        //definitions des ports TX et RX en tant que communicateur serie
        TXSTA2bits.TXEN = 1;        //activation du module d'envoie USART2
        
        
	envoiLectureRFID();         //creation et envoi des bytes a envoyer pour selectionner la lecture pour le module RFID
		
	//BOUCLE PRINCIPALE
	while(1)
	{
            
            if(FlagLecture == 1)        //on a recu une info de la part du module RFID
            {
                IO_REL = ON;
                if(i >= 9)          //si on a tout recu
                {
                    if(TabRecuRFID[7] == 0xFF)  //si la lecture c'est bien passer
                    {
                        while(BusyXLCD());
                        SetDDRamAddr(0x00);
                        while(BusyXLCD());
                        putrsXLCD("Lecture WIN");
                        
//                        for(x = 0; x <= 4; x++){            //transfert des data recu vers a tableau pour ne pas perdre d'info si le RFID renvoi des données
//                            TabData[x] = TabRecuRFID[x+3];
//                        }
//                        TabData[4] = 0;                     //la fonction puts s'attend a un 0 pour terminer l'envoi
//                        while(BusyXLCD());
//                        SetDDRamAddr(0x40);
//                        while(BusyXLCD());
//                        putsXLCD(&TabRecuRFID[3]);
//                         i=0;
//                        for(j = 0 ; j <= 10 ; j++){
//                            TabRecuRFID[j] = 0;             //nettoyage du tableau
//                        }
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
                    while(BusyXLCD());
                    SetDDRamAddr(0x00);
                    while(BusyXLCD());
                    putrsXLCD("Ecriture WIN !");
                }
            }
	}
}


//************
//* FONCTIONS *
//************
	//INTERRUPTIONS
void IntHaute(void)
{
    if(INT_RFID == 1)
    {
        IO_LED = ON;            //on a recu quelque chose du RFID
        TabRecuRFID[i]=RCREG2;
        i++;
        if(TabRecuRFID[2] == 0x13)          //(c'est une lecture) il faut vider le tableau
            FlagLecture = 1;
        if(TabRecuRFID[2] == 0x11)          //c'est une ecriture, il ne faut rien faire
            FlagEcriture = 1;
        INT_RFID = 0;
    }
    if(BT_FL == 1)
    {
        IO_LED = OFF;
        IO_REL = OFF;
        BT_FL = 0;
    }

}
void IntBasse(void)
{
	
}

void envoiLectureRFID(void)
{
    char tmp;
    char send;
    unsigned char envoi[6];
    envoi[0] = 0xFF;        //on selectionne toutes les cartes
    envoi[1] = 0x06;        //longueure de la tramme
    envoi[2] = 0x12;        //envoie de la commande de lecture
    envoi[3] = 0x02;        //selection du secteur no 2
    LiczCRC2(envoi, (unsigned short *)&envoi[4], 4);    //calcul des bits CRCH et CRCL
    tmp = envoi[4]; envoi[4] = envoi[5]; envoi[5] = tmp;    //inversion par rapport a la fonction
    while(BusyXLCD());
    SetDDRamAddr(0x40);
    while(BusyXLCD());
    putrsXLCD("ENVOI");
    send = 0;
    TXREG2 = envoi[send];
    send++;
    while(send <= 5)      //envoi des données un a un sur l'USART2
    {
        if(TXSTA2bits.TRMT != 1)
        {
            TXREG2 = envoi[send];
            send++;
        }
    }
    while(BusyXLCD());
    putrsXLCD("...OK");
}

//void envoiEcritureRFID(void)
//{
//    char envoi[10];
//    char temp, send;
//    envoi[0] = 0xFF;        //on selectionne la carte
//    envoi[1] = 0x0A;        //longueure de la trame
//    envoi[2] = 0x10;        //commande d'ecriture
//    envoi[3] = 0x01;        //DATA1
//    envoi[4] = 0x02;        //DATA2
//    envoi[5] = 0x03;        //DATA3
//    envoi[6] = 0x04;        //DATA4
//    envoi[7] = 0x02;        //secteur a ecrire
//    LiczCRC2(envoi, (unsigned short *)&envoi[8], 8);    //calcul des bits CRCH et CRCL
//    temp = envoi[8]; envoi[8] = envoi[9]; envoi[9] = temp;    //inversion par rapport a la fonction
//    send = 0;
//    while(send <= 9)      //envoi des données un a un sur l'USART2
//    {
//
//        if(TXSTA2bits.TRMT2 != 1)
//        {
//            TXREG2 = envoi[send];
//            send++;
//        }
//    }
//}

void LiczCRC2(unsigned char *ZAdr, unsigned short *DoAdr, unsigned char Ile)        //calcul des bits CRCL & CRCH
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