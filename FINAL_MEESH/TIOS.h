#ifndef __TIOS_H
#define __TIOS_H


#define MAXCALLBACKCHRONO   10
//Définit le nombre maximal de callback de type Chrono

//**********************************************************
//********** FONCTIONS POUR LE MOTEUR OS *******************
//**********************************************************

//Initialisation de TIOS
void TIOSInitialiser(void);

//Enregistrer des fonctions callback li�es au temps
//Retourne un ID associ� � l'enregistrement
unsigned char TIOSEnregistrerCB_TIMER(void(*ptFonction)(void), unsigned int temps); 

//Retirer des fonctions callback li�es au temps, prend l'ID du CallBack comme argument
void TIOSRetirerCB_TIMER(unsigned char IDCB);

//D�marrage de la boucle principale
void TIOSStart(void);

//interruption haute
void HighInterrupt(void);

//interuption basse
void LowInterrupt(void);

void TIOSEnregistrerCB_Bout(void(*ptFonction)(char));
void TIOSEnregistrerCB_ETH(void(*ptFonction)(void));
void TIOSEnregistrerCB_RFID(void(*ptFonction)(char));
void TIOSEnregistrerCB_USART(void(*ptFonction)(char));


#endif