#include "head.h"


//Variables pour CallBack Chrono
void (*MaCB[MAXCALLBACKCHRONO])(void);
void (*CBETH) (void);
void (*CBUSART) (char);
void (*CBUSARTRECEPT) (char *);
void (*CBRFID) (char , char, char, char);
void (*CBBT) (char);
unsigned int TempsCB[MAXCALLBACKCHRONO];
volatile unsigned int TickCB[MAXCALLBACKCHRONO];
volatile unsigned char bout = 0, iRec = 0, FlagLecture = 0, FlagEcriture = 0;            //variable pour l'appuy d'un bouton
volatile unsigned char flagBout = 0;
volatile char TabRecuRFID[15];

volatile unsigned char flagusart=0;
char caractere[5];
int compteurUsart=0;

#pragma code highVector=0x0008
void atInterrupthigh(void){
	_asm GOTO HighInterrupt _endasm
}
#pragma code

#pragma code lowVector=0x0018
void atInterruptlow(void){
	_asm GOTO LowInterrupt _endasm
}
#pragma code




// ****************  TIOSInitialiser ******************************
// Initialise l'OS: initialise les variables et d?marre le Timer
// ****************************************************************
void TIOSInitialiser(void)
{
 	unsigned char i;
 	//Initialisation pour variables CallBack Chrono
 	for (i=0; i<MAXCALLBACKCHRONO; i++)
 	{
  		 MaCB[i] = 0;
  		 TempsCB[i] = 0;
  	}
}

//############# EnregistrerFonction de rappel sans temps #######################


//Gestion des boutons
void TIOSEnregistrerCB_Bout(void(*ptFonction)(char))
{
    CBBT = ptFonction;
}
//Gestion de l'envoi ethernet
void TIOSEnregistrerCB_ETH(void(*ptFonction)(void))
{
    CBETH = ptFonction;
}
//Gestion de la reception du module RFID
void TIOSEnregistrerCB_RFID(void(*ptFonction)(char , char, char, char))
{
    CBRFID = ptFonction;
}
//Gestion de la reception USART
void TIOSEnregistrerCB_USART(void(*ptFonction)(char))
{
    CBUSART = ptFonction;
}
void TIOSEnregistrerCB_USARTRECEPT(void(*ptFonction)(char *))
{
    CBUSARTRECEPT = ptFonction;
}

// ****************  EnregistrerFonctionDeRappel ******************************
// Sauve l'adresse de la fonction ? rappeler. Lorsque le nombre d'interruptions
// aura atteint temps millisecondes, le syst?me rappellera la fonction
// *************************************************************************
unsigned char TIOSEnregistrerCB_TIMER(void(*ptFonction)(void), unsigned int tps)
{
 	unsigned int i=1; // on commence ? 1 car les IDCB sont initialis?s ? 0 !!
 	while (MaCB[i]!=0 && i<MAXCALLBACKCHRONO) i++;
	 //S'il reste de la place on enregistre et on retourne 0 (op?ration r?ussie)
 	if (i<MAXCALLBACKCHRONO)
 	{
  		 MaCB[i] = ptFonction;
  		 TempsCB[i] = tps;
  		 TickCB[i] = 0; //Initialiser le compteur ? 0;
   			return i; // ID du call back
  	}
 	else return 255; //Il n'y a plus de place pour enregistrer un callback
}


// ****************  Retirer fonction de rappel ******************************
// Lib?re l'emplacement de la callback
// *************************************************************************
void TIOSRetirerCB_TIMER(unsigned char IDCB)
{
	 if ((IDCB >=0) && IDCB<MAXCALLBACKCHRONO)
  	 {
   		MaCB[IDCB] = 0;
  		 TempsCB[IDCB] = 0;
  	 }
}



// ****************  Boucle principale de l'OS ******************************
// Boucle infinie qui attend des ?v?nement li?s aux interruptions pour
// appeler les fonctions enregistr?es
// *************************************************************************
void TIOSStart()
{
    unsigned char idx;
    char j;

    for(j=0; j<14; j++)
    {
        TabRecuRFID[j] = 0;
        iRec = 0;
    }
    FlagLecture = 0;

    //VARAIBLES LOCALES
    //CONFIG PIC
    OSCCONbits.IRCF = 0b111;	// on defini la frequence de l'oscillateur ? 16 mHz
    //CONFIG PIN
            //SELECTION AN/DI		(ANSEL)
    ANSELA = NUM;		//on place toutes les pins en num?rique, XC8 se fout des pins qu'on ne peut pas d?finir
    ANSELB = NUM;
    ANSELC = NUM;
    ANSELD = NUM;
    ANSELE = NUM;
    ANSELDbits.ANSD4 = ANA;     //photodiode
            //SELECTION IN/OUT		(TRIS)
    TRISCbits.TRISC2 = OUT;     //LED en output
    TRISBbits.TRISB4 = OUT;     //RELAIS en output
    TRISDbits.TRISD4 = IN;      //photo diode en input
            //ETAT REPOS DES PINS 	(PORT)
    IO_LED = OFF;
    IO_REL = OFF;
    //Initialisation des périphériques
        //LCD
    initLCD();
        //Boutons
    initBout();
        //RFID
    initRFID();
        //ETHERNET
    ethernetInit();
        //Lumiere ADC
    InitADC();
        //USART
    //initUsart();
    
    INTCONbits.GIE = 1;
    INTCONbits.PEIE = 1;
    RCONbits.IPEN = 1;


    //Cr?ation, configuration et démarrage de Timer1 pour g?n?rer une interruption toutes les mS en priorité haute
    TIMER1_Init_1ms(); //A partir d'ici, interruption toutes les ms par Timer1


    //Boucle principale de l'OS d'o? on ne sort jamais
    while(1)
    {
        ethernetEnvoi();
        Delay10KTCYx(50);
        if(flagusart == 1){
            CBUSARTRECEPT(caractere);
            flagusart = 0;
            compteurUsart=0;
        }
        // Check les conditions pour rappeler les fonctions li?es au temps
        for (idx = 0; idx < MAXCALLBACKCHRONO; idx++)
        {
            if (MaCB[idx]) //Si on a l'adresse d'une fonction CB ? cet index
            //Si on est arriv? au nombre de mS demand?, on appelle la fonction
                if (TickCB[idx] >= TempsCB[idx])
                {
                     TickCB[idx] = 0;
                     MaCB[idx]();  //Rappel de la fonction enregistrée!
                }
        }
        if(flagBout)
        {
            CBBT(bout);
            flagBout = 0;
        }
        if(FlagLecture)
        {
            if(iRec >= 9)          //si on a tout recu
            {
                if(TabRecuRFID[7] == 0xFF)  //si la lecture c'est bien passer
                {
                    CBRFID(TabRecuRFID[3], TabRecuRFID[4], TabRecuRFID[5], TabRecuRFID[6]);
                    for(j=0; j<14; j++)
                    {
                        TabRecuRFID[j] = 0;
                        iRec = 0;
                    }
                    FlagLecture = 0;
                }
                else
                {
                    CBRFID(0,0,0,0);
                    FlagLecture = 0;
                    for(j=0; j<14; j++)
                    {
                        TabRecuRFID[j] = 0;
                        iRec = 0;
                    }
                }
            }
        }
        if(FlagEcriture)
        {
            if(iRec >= 5)
            {
                if(TabRecuRFID[3] == 0xFF)
                {
                    SetDDRamAddr(0x40);
                    while(BusyXLCD());
                    putrsXLCD("                ");
                    while(BusyXLCD());
                    SetDDRamAddr(0x40);
                    while(BusyXLCD());
                    putrsXLCD("Ecriture OK");
                    for(j=0; j<14; j++)
                    {
                        TabRecuRFID[j] = 0;
                        iRec = 0;
                    }
                }
            }
            
            FlagEcriture = 0;
        }
        //Delay10KTCYx(200);
     }
}


// Routines INTERRUPTIONS

#pragma interrupt HighInterrupt
// ***********************
// INTERRUPTION TIMER
// **********************
// Code a placer en interruption prioritaire
void HighInterrupt(void)
{
    if(INT_TMR1 == 1)
    {
        unsigned char i;
        TMR1H = 0xFE;
        TMR1L = 0x0B;
        for (i = 0; i < MAXCALLBACKCHRONO; i++) TickCB[i]++;
        INT_TMR1 = 0;
    }
    
    if (PIR1bits.RC1IF)
    {
        caractere[compteurUsart] = RCREG1; // Si interruption de EUSART1_RC
        if (caractere[compteurUsart]==0) flagusart = 1;
        compteurUsart++;
        PIR1bits.RC1IF = 0;		// Reconfigure le flag de EUSART1_RC à 0
    }
    if(INT_BT)
    {
        Delay10KTCYx(2); //attendre 5ms pour le rebond

        if(BT_DO == 0)
            bout = 'd';
        if(BT_UP == 0)
            bout = 'u';
        if(BT_LE == 0)
            bout = 'l';
        if(BT_RI == 0)
            bout = 'r';
        if(BT_EN == 0)
            bout = 'e';
        flagBout = 1;
        INT_BT = 0;
    }
    if(INT_RFID)
    {
        TabRecuRFID[iRec] = RCREG2;              //on enregistre se qu'on a recu
        iRec++;                                //on passe a la cellule suivante
        if(TabRecuRFID[2] == 0x13)          //(c'est une lecture) il faut vider le tableau
            FlagLecture = 1;
        if(TabRecuRFID[2] == 0x11)          //c'est une ecriture, il ne faut rien faire
            FlagEcriture = 1;
        INT_RFID = 0;
    }
}


#pragma interrupt LowInterrupt
void LowInterrupt(void)
{
    if(INTCONbits.TMR0IF == 1){
        TickUpdate();
        INTCONbits.TMR0IF = 0;
    }
}