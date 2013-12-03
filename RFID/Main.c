//************
//* INCLUDES *
//************
#include <p18lf46k22.h>
#include "xlcd.h"
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
	//AUTRES
//void creaTabRFID(void);
void sendRFIDL(char);                                               //envoi d'une lecture au RFID (secteur)
void sendRFIDE(char, char, char, char, char);                       //envoi une ecriture au RFID (data1, data2, data3, data4, secteur)
void LiczCRC2(unsigned char *, unsigned short *, unsigned char);
void resetRFID(void);

//******************
//* ROUTINES D'INT *
//******************
#pragma code hightVector=0x0008
void atInterruptHigh(void)
{
	_asm GOTO IntHaute _endasm
}
#pragma code


//**********************
//* VARIABLES GLOBALES *
//**********************
enum {NUM, ANA};
enum {OUT, IN};
enum {OFF, ON};

volatile char TabRecuRFID[15], TabData[5];
volatile char iRec=0, FlagLecture=0, FlagEcriture=0, env = 0;
unsigned char lect[6], ecri[10];
volatile unsigned int cptTMR = 0;
unsigned char sendFlag = 0;

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
          //initialisation de l'écrans LCD
    IO_LED = OFF;
    IO_REL = OFF;

    //INIT LCD
    TRISDbits.TRISD0 = OUT;
    TRISDbits.TRISD1 = OUT;
    TRISDbits.TRISD2 = OUT;
    TRISDbits.TRISD3 = OUT;
                //LCD CONT
    TRISAbits.TRISA1 = OUT;
    TRISAbits.TRISA2 = OUT;
    TRISDbits.TRISD5 = OUT;
        

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

    TXSTA2bits.TX9 = 0;         //désactivation du 9eme bit à la reception
        //Reception
    RCSTA2bits.RX9 = 0;         //désactivation du 9eme bit a l'envoi
    IPR3bits.RC2IP = 1;         //selection de la priorité en haute de l'interruption
    INT_RFID = 0;               //mise a zero du flag d'interruption
    PIE3bits.RC2IE = 1;         //activation de l'interruption de la reception de l'USART2
        //Activation finale
    RCSTA2bits.CREN = 1;        //activation du module de reception de l'USART2 en continue
    RCSTA2bits.SPEN = 1;        //definitions des ports TX et RX en tant que communicateur serie
    TXSTA2bits.TXEN = 1;        //activation du module d'envoie USART2

    //configuration timer
    T1CONbits.TMR1CS = 0b00;
    T1CONbits.T1CKPS = 0b11;
    T1CONbits.T1SYNC = 1;
    T1GCONbits.TMR1GE = 0;
    TMR1H = 0xFE;
    TMR1L = 0x0B;
    T1CONbits.TMR1ON = 1;
        //interuptions
    IPR1bits.TMR1IP = 1;
    PIE1bits.TMR1IE = 1;
    PIR1bits.TMR1IF = 0;
   

    OpenXLCD(FOUR_BIT & LINES_5X7);
    while(BusyXLCD());
    putrsXLCD("Hello RFID");

    //BOUCLE PRINCIPALE
    while(1)
    {
        if(FlagLecture == 1)        //on a recu une info de la part du module RFID
        {
            if(iRec >= 9)          //si on a tout recu
            {
                if(TabRecuRFID[7] == 0xFF)  //si la lecture c'est bien passer
                {
                    while(BusyXLCD());
                    SetDDRamAddr(0x00);
                    while(BusyXLCD());
                    putrsXLCD("                ");
                    while(BusyXLCD());
                    SetDDRamAddr(0x00);
                    while(BusyXLCD());
                    putrsXLCD("Lecture WIN !");
                    TabData[0] = TabRecuRFID[3];
                    TabData[1] = TabRecuRFID[4];
                    TabData[2] = TabRecuRFID[5];
                    TabData[3] = TabRecuRFID[6];
                    TabData[4] = 0;
                    while(BusyXLCD());
                    SetDDRamAddr(0x40);
                    while(BusyXLCD());
                    putsXLCD(&TabData);
                    resetRFID();
                }
                else
                {
                    while(BusyXLCD());
                    SetDDRamAddr(0x00);
                    while(BusyXLCD());
                    putrsXLCD("                ");
                    while(BusyXLCD());
                    SetDDRamAddr(0x00);
                    while(BusyXLCD());
                    putrsXLCD("Lecture FAIL !");
                    resetRFID();                    
                }
            }
            FlagLecture = 0;
        }
        if(FlagEcriture == 1)
        {
            if(iRec >= 5)
            {
                if(TabRecuRFID[3] == 0xFF)
                {
                    while(BusyXLCD());
                    SetDDRamAddr(0x00);
                    while(BusyXLCD());
                    putrsXLCD("                ");
                    while(BusyXLCD());
                    SetDDRamAddr(0x00);
                    while(BusyXLCD());
                    putrsXLCD("Ecriture WIN !");
                    resetRFID();
                }
                else
                {
                    while(BusyXLCD());
                    SetDDRamAddr(0x00);
                    while(BusyXLCD());
                    putrsXLCD("                ");
                    while(BusyXLCD());
                    SetDDRamAddr(0x00);
                    while(BusyXLCD());
                    putrsXLCD("Ecriture FAIL !");
                    resetRFID();
                }
            }
            FlagEcriture = 0;
        }
        if(sendFlag == 1)
        {
            if(env == 1)
            {
                sendRFIDE(0x41, 0x42, 0x42, 0x41, 0x02);
            }
            else
                sendRFIDL(0x02);
            sendFlag = 0;
        }
    }
}


//************
//* FONCTIONS *
//************
	//INTERRUPTIONS
#pragma interrupt IntHaute
void IntHaute(void)
{
    if(INT_RFID == 1)
    {        
        TabRecuRFID[iRec]=RCREG2;              //on enregistre se qu'on a recu
        iRec++;                                //on passe a la cellule suivante
        if(TabRecuRFID[2] == 0x13)          //(c'est une lecture) il faut vider le tableau
            FlagLecture = 1;
        if(TabRecuRFID[2] == 0x11)          //c'est une ecriture, il ne faut rien faire
            FlagEcriture = 1;
        INT_RFID = 0;
    }
    if(PIR1bits.TMR1IF == 1)
    {
        if(cptTMR <= 2500)
        {
            cptTMR++;
        }
        else
        {
            cptTMR = 0;
            sendFlag = 1;
            IO_LED = !IO_LED;
            if(env == 0)
                env = 1;
            else
                env = 0;
        }
        TMR1H=0xFE;
        TMR1L=0x0B;
        PIR1bits.TMR1IF = 0;
    }
}

//void creaTabRFID()
//{
//    char tmp;
//    //LECTURE
//    //------------------
//    lect[0] = 0xFF;        //on selectionne toutes les cartes
//    lect[1] = 0x06;        //longueure de la tramme
//    lect[2] = 0x12;        //envoie de la commande de lecture
//    lect[3] = 0x02;        //selection du secteur no 2
//    LiczCRC2(lect, (unsigned short *)&lect[4], 4);    //calcul des bits CRCH et CRCL
//    tmp = lect[4]; lect[4] = lect[5]; lect[5] = tmp;    //inversion par rapport a la fonction
//    //------------------
//
//    //ECRITURE
//    //------------------
//    ecri[0] = 0xFF;         //on ne connait pas la carte
//    ecri[1] = 0x0A;         //longueure de la trame
//    ecri[2] = 0x10;         //commande d'ecriture
//    ecri[3] = 0x01;         //DATA1
//    ecri[4] = 0x02;         //DATA2
//    ecri[5] = 0x03;         //DATA3
//    ecri[6] = 0x04;         //DATA4
//    ecri[7] = 0x03;         //Secteur
//    LiczCRC2(ecri, (unsigned short *)&ecri[8], 8);    //calcul des bits CRCH et CRCL
//    tmp = ecri[8]; ecri[8] = ecri[9]; ecri[9] = tmp;    //inversion par rapport a la fonction
//    //------------------
//}

void sendRFIDL(char sect)
{
    char send = 0;
    char tmp;
    //LECTURE
    //------------------
    lect[0] = 0xFF;        //on selectionne toutes les cartes
    lect[1] = 0x06;        //longueure de la tramme
    lect[2] = 0x12;        //envoie de la commande de lecture
    lect[3] = sect;        //selection du secteur
    LiczCRC2(lect, (unsigned short *)&lect[4], 4);    //calcul des bits CRCH et CRCL
    tmp = lect[4]; lect[4] = lect[5]; lect[5] = tmp;    //inversion par rapport a la fonction
    //------------------
    TXREG2 = lect[send];
    send++;
    while(send <= 5)      //envoi des données un a un sur l'USART2
    {
        while(TXSTA2bits.TRMT != 1);
        TXREG2 = lect[send];
        send++;
    }
}

void sendRFIDE(char dt1, char dt2, char dt3, char dt4, char sect)
{
    char send = 0;
    char tmp;
    //ECRITURE
    //------------------
    ecri[0] = 0xFF;         //on ne connait pas la carte
    ecri[1] = 0x0A;         //longueure de la trame
    ecri[2] = 0x10;         //commande d'ecriture
    ecri[3] = dt1;         //DATA1
    ecri[4] = dt2;         //DATA2
    ecri[5] = dt3;         //DATA3
    ecri[6] = dt4;         //DATA4
    ecri[7] = sect;         //Secteur
    LiczCRC2(ecri, (unsigned short *)&ecri[8], 8);    //calcul des bits CRCH et CRCL
    tmp = ecri[8]; ecri[8] = ecri[9]; ecri[9] = tmp;    //inversion par rapport a la fonction
    //------------------
    TXREG2 = ecri[send];
    send++;
    while(send <= 9)      //envoi des données un a un sur l'USART2
    {
        while(TXSTA2bits.TRMT != 1);
        TXREG2 = ecri[send];
        send++;
    }
}

void resetRFID(){
    char j;
    for(j=0; j<14; j++)
    {
        TabRecuRFID[j] = 0;
        iRec = 0;
    }
}

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