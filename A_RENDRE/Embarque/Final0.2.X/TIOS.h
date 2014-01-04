#ifndef __TIOS_H
#define __TIOS_H


#define MAXCALLBACKCHRONO   10
//DÃ©finit le nombre maximal de callback de type Chrono

//**********************************************************
//********** FONCTIONS POUR LE MOTEUR OS *******************
//**********************************************************
//RFID vérification présence de carte
void TIOSEnregistrerCB_RFID(void(*ptFonction)(char , char, char, char));

//Usart en reception
void TIOSEnregistrerCB_USARTRECEPT(void(*ptFonction)(char *));

//Initialisation de TIOS
void TIOSInitialiser(void);

//Enregistrer des fonctions callback liï¿½es au temps
//Retourne un ID associï¿½ ï¿½ l'enregistrement
unsigned char TIOSEnregistrerCB_TIMER(void(*ptFonction)(void), unsigned int temps); 

//Retirer des fonctions callback liï¿½es au temps, prend l'ID du CallBack comme argument
void TIOSRetirerCB_TIMER(unsigned char IDCB);

//Dï¿½marrage de la boucle principale
void TIOSStart(void);

//interruption haute
void HighInterrupt(void);

//interuption basse
void LowInterrupt(void);


#endif