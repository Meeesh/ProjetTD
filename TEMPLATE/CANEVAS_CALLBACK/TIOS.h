#ifndef __TIOS_H
#define __TIOS_H

//D�finit le nombre maximal de callback de type Chrono
#define	MAXCALLBACKCHRONO		10


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


#endif //__TIOS_H
