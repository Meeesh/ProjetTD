#ifndef USART_H
#define	USART_H

void initRFID(void);

#define INT_RFID    PIR3bits.RC2IF
#define INT_USART   PIR1bits.RC1IF


#endif

