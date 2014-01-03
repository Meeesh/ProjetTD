#include "head.h"


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
// Initialise l'OS: initialise les variables et d�marre le Timer
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
// Sauve l'adresse de la fonction � rappeler. Lorsque le nombre d'interruptions
// aura atteint temps millisecondes, le syst�me rappellera la fonction
// *************************************************************************
unsigned char TIOSEnregistrerCB_TIMER(void(*ptFonction)(void), unsigned int tps)
{
 	unsigned int i=1; // on commence � 1 car les IDCB sont initialis�s � 0 !!
 	while (MaCB[i]!=0 && i<MAXCALLBACKCHRONO) i++;
	 //S'il reste de la place on enregistre et on retourne 0 (op�ration r�ussie)
 	if (i<MAXCALLBACKCHRONO)
 	{
  		 MaCB[i] = ptFonction;
  		 TempsCB[i] = tps; 
  		 TickCB[i] = 0; //Initialiser le compteur � 0;
   			return i; // ID du call back
  	}
 	else return 255; //Il n'y a plus de place pour enregistrer un callback
}


// ****************  Retirer fonction de rappel ******************************
// Lib�re l'emplacement de la callback
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
// Boucle infinie qui attend des �v�nement li�s aux interruptions pour 
// appeler les fonctions enregistr�es
// *************************************************************************
void TIOSStart()
{
    unsigned char idx;

    // Initialisation des interruptions, on autorise toutes les interruptions
    // Pour les interruptions particuli�res, voir chaque fonction


    //Cr�ation, configuration et d�marrage de Timer1 pour g�n�rer une interruption toutes les mS en priorit� haute
    TIMER1_Init_1ms(); //A partir d'ici, interruption toutes les ms par Timer1


    //Boucle principale de l'OS d'o� on ne sort jamais
     while(1)
     {
             // Check les conditions pour rappeler les fonctions li�es au temps
             for (idx = 0; idx < MAXCALLBACKCHRONO; idx++)
     {
                    if (MaCB[idx]) //Si on a l'adresse d'une fonction CB � cet index
            //Si on est arriv� au nombre de mS demand�, on appelle la fonction
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
// Code a placer en interruption prioritaire
void HighInterrupt(void)
{
    unsigned char i;
    TMR1H = 0xFE;
    TMR1L = 0x0B;
    
    for (i = 0; i < MAXCALLBACKCHRONO; i++) TickCB[i]++;
}
	

#pragma interrupt LowInterrupt
void LowInterrupt(void)
{

}	



