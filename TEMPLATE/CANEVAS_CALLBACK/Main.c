//CANEVAS CALLBAK 

// INCLUDE

#include "TIOS.h"


// Mes variables globales

unsigned char IDCB_LED = 0; // mémorisation de l'identificateur créé lors de l'enregistrement de la Callback Clignote_LED


// Prototype des fonctions

//********************************************************
// Fonctions dont on passe les adresses à TIOS 

void Clignote_LED(void);


//****************** fonction principale *****************
int main (void)
{ 
 	// Initialisation de l'OS (appel des Callbacks)
	TIOSInitialiser();

	// Initialisation des Callbacks
 	TIOSEnregistrerCB_TIMER(/*pointeur de fonction*/, /*temps d'appel en MS*/
 		
 	// Lancement OS (Boucle infinie)
	TIOSStart();

	return 0;
}

