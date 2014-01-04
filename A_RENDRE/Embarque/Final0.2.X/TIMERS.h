// TIMER0.h

#ifndef _TIMERS_H_
#define _TIMERS_H_



//DEFINE
#define INT_TMR1 PIR1bits.TMR1IF

//PROTOTYPE FONCTIONS EXTERNES
//Cr�ation, configuration et d�marrage de Timer1 pour g�n�rer une interruption toutes les mS en priorit� haute
void TIMER1_Init_1ms(void);


#endif /* _TIMERS_H */
