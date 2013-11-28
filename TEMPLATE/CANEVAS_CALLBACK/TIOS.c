// OS

#include "TIOS.h"


//Variables pour CallBack Chrono
void (*MaCB[MAXCALLBACKCHRONO])(void);
unsigned int TempsCB[MAXCALLBACKCHRONO];
volatile unsigned int TickCB[MAXCALLBACKCHRONO];

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
// Initialise l'OS: initialise les variables et démarre le Timer
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


// ****************  EnregistrerFonctionDeRappel ******************************
// Sauve l'adresse de la fonction à rappeler. Lorsque le nombre d'interruptions
// aura atteint temps millisecondes, le système rappellera la fonction
// *************************************************************************
unsigned char TIOSEnregistrerCB_TIMER(void(*ptFonction)(void), unsigned int tps)
{
 	unsigned int i=1; // on commence à 1 car les IDCB sont initialisés à 0 !!
 	while (MaCB[i]!=0 && i<MAXCALLBACKCHRONO) i++;
	 //S'il reste de la place on enregistre et on retourne 0 (opération réussie)
 	if (i<MAXCALLBACKCHRONO)
 	{
  		 MaCB[i] = ptFonction;
  		 TempsCB[i] = tps; 
  		 TickCB[i] = 0; //Initialiser le compteur à 0;
   			return i; // ID du call back
  	}
 	else return 255; //Il n'y a plus de place pour enregistrer un callback
}


// ****************  Retirer fonction de rappel ******************************
// Libère l'emplacement de la callback
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
// Boucle infinie qui attend des événement liés aux interruptions pour 
// appeler les fonctions enregistrées
// *************************************************************************
void TIOSStart()
{
	unsigned char idx;

 	// Initialisation des interruptions, on autorise toutes les interruptions
	// Pour les interruptions particulières, voir chaque fonction

  
	//Création, configuration et démarrage de Timer1 pour générer une interruption toutes les mS en priorité haute
 	TIMER1_Init_1ms(); //A partir d'ici, interruption toutes les ms par Timer1


 	//Boucle principale de l'OS d'où on ne sort jamais
	 while(1)
 	 {
  		 // Check les conditions pour rappeler les fonctions liées au temps 
  		 for (idx = 0; idx < MAXCALLBACKCHRONO; idx++)
    	 {
	 		if (MaCB[idx]) //Si on a l'adresse d'une fonction CB à cet index
     		//Si on est arrivé au nombre de mS demandé, on appelle la fonction 
     		if (TickCB[idx] >= TempsCB[idx])
      		{ 
	  			 TickCB[idx] = 0;
      			 MaCB[idx]();  //Rappel de la fonction enregistrée!
	 		}
  		 }
  	 }
}


// Routines INTERRUPTIONS
           
#pragma interrupt HighInterrupt
// ***********************
// INTERRUPTION TIMER
// **********************
// Code à placer en interruption prioritaire
void HighInterrupt(void)
{
	// reconfiguration du Timer0
	// Ajourner tous les ticks
	unsigned char i;
  	for (i = 0; i < MAXCALLBACKCHRONO; i++) TickCB[i]++;
}
	

#pragma interrupt LowInterrupt
void LowInterrupt(void)
{

}	



