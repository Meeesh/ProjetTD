#include "head.h"

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
#define IO_LED  PORTCbits.RC6
#define IO_REL  PORTBbits.RB4

//**********************
//* VARIABLES GLOBALES *
//**********************
unsigned char rfid[10];     //utiliser dans la construction de la trame pour l'envoi de onnées au module RFID
unsigned float temper;      //utiliser pour la lecture de la temperature
unsigned volatile char affiLCD[15];     //variable temporaire pour afficher des valeurs au lcd
unsigned volatile char etat=0;

//**************
//* PROTOTYPES *
//**************
void rfidLect(char);
/*
 * APPEL :  rfidLect([SECTEUR]);
 * Descr :  Envoi la demande de lecture au module RFID
 * INPUT :  [SECTEUR] : Numéro du secteur dont on souhaite en lire le contenu
 * OUTPUT:  N/A
 */
void rfidEcri(char, char, char, char, char);
/*
 * APPEL :  rfidEcri([SECTEUR], [DATA1], [DATA2], [DATA3], [DATA4]);
 * Descr :  Envoi le demande d'écriture au module RFID
 * INPUT :  [SECTEUR] : Numéro du  secteur dans lequel on veut placer les données
 *          [DATAx]   : Octets a envoyer
 * OUPUT :  N/A
 */
void LiczCRC2(unsigned char *, unsigned short *, unsigned char);
/*
 * Fcontion utiliser pour l'envoi de données au RFID, PAS UTILE POUR L'UTILISSATEUR !
 */
void LectTEMP(void);
/*
 * APPEL : UNIQUEMENT pour le call back
 * Descr : Lecture de la temperature via call back
 * INPUT : N/A
 * OUTPUT: N/A
 */
void gestionBT(char);
/*
 * APPEL : UNIQUEMENT pour le call back
 * Descr : Permet la gestion lors d'un appuy d'un boutton
 * INPUT : Quel bouton a été appuyer
 * OUTPUT: N/A
 */
void gestionETH(void);
/*
 * APPEL : UNIQUEMENT pour le call back
 * Descr : Permet la gestion d'envoi de données via l'eth
 * INPUT : N/A
 * OUTPUT: N/A
 */
void gestionRFID(char);
/*
 * APPEL : UNIQUEMENT pour le call back
 * Descr : Permet la gestion lors d'une interruption du rfid
 * INPUT : char: caractère recu par le rfid
 * OUTPUT: N/A
 */
void gestionUSART(char);
/*
 * APPEL : UNIQUEMENT pour le call back
 * Descr : Permet de gèrer lors d'une interruption de l'usart en récéption
 * INPUT : char: caractère reçus par l'usart
 * OUTPUT: N/A
 */

//****************** fonction principale *****************
void main (void)
{   
    

    // Initialisation de l'OS (appel des Callbacks)
    TIOSInitialiser();

    // Initialisation des Callbacks
    TIOSEnregistrerCB_Bout(&gestionBT);
    TIOSEnregistrerCB_ETH(&gestionETH);
    TIOSEnregistrerCB_RFID(&gestionRFID);
    TIOSEnregistrerCB_USART(&gestionUSART);
    

    // Lancement OS (Boucle infinie)
    TIOSStart();
}

void rfidLect(char sec)
{
    char tmp;
    //reset du tableau RFID
    for(tmp = 0; tmp <= 9; tmp++)
        rfid[tmp] = 0;
    tmp = 0;
    //LECTURE
    //------------------
    rfid[0] = 0xFF;        //on selectionne toutes les cartes
    rfid[1] = 0x06;        //longueure de la tramme
    rfid[2] = 0x12;        //envoie de la commande de lecture
    rfid[3] = sec;        //selection du secteur
    LiczCRC2(rfid, (unsigned short *)&rfid[4], 4);    //calcul des bits CRCH et CRCL
    tmp = rfid[4]; rfid[4] = rfid[5]; rfid[5] = tmp;    //inversion par rapport a la fonction
    //------------------
    tmp = 0;
    TXREG2 = rfid[tmp];
    tmp++;
    while(tmp <= 5)      //envoi des données un a un sur l'USART2
    {
        while(TXSTA2bits.TRMT != 1);
        TXREG2 = rfid[tmp];
        tmp++;
    }
}

void rfidEcri(char sec, char dt1, char dt2, char dt3, char dt4)
{
    char tmp;
    //reset du tableau RFID
    for(tmp = 0; tmp <= 9; tmp++)
        rfid[tmp] = 0;
    tmp = 0;
    //ECRITURE
    //------------------
    rfid[0] = 0xFF;         //on ne connait pas la carte
    rfid[1] = 0x0A;         //longueure de la trame
    rfid[2] = 0x10;         //commande d'ecriture
    rfid[3] = dt1;         //DATA1
    rfid[4] = dt2;         //DATA2
    rfid[5] = dt3;         //DATA3
    rfid[6] = dt4;         //DATA4
    rfid[7] = sec;         //Secteur
    LiczCRC2(rfid, (unsigned short *)&rfid[8], 8);    //calcul des bits CRCH et CRCL
    tmp = rfid[8]; rfid[8] = rfid[9]; rfid[9] = tmp;    //inversion par rapport a la fonction
    //------------------
    tmp = 0;
    TXREG2 = rfid[tmp];
    tmp++;
    while(tmp <= 9)      //envoi des données un a un sur l'USART2
    {
        while(TXSTA2bits.TRMT != 1);
        TXREG2 = rfid[tmp];
        tmp++;
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

void gestionBT(char bt)
{
    
}
void gestionETH(void)
{

}
void gestionRFID(char recu)
{

}
void gestionUSART(char recu)
{
    
}