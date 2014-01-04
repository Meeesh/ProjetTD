#ifndef _BOUTONS_H_
#define _BOUTONS_H_

#define BT_DO	PORTEbits.RE0
#define BT_LE	PORTEbits.RE1
#define BT_EN	PORTEbits.RE2
#define BT_RI	PORTCbits.RC0
#define BT_UP	PORTCbits.RC1
//#define BT_FL   INTCONbits.INT0IF
#define INT_BT  INTCONbits.INT0IF

//**************************************************
//* PROROTYPES POUR INITALISER L'ETAT DES BOUTTONS *
//**************************************************
void initBout(void);

		//placer initBout(); à la config des pins
		
#endif