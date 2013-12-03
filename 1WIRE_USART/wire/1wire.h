#ifndef __1WIRE_H
#define __1WIRE_H

/******************************************************************
** 	        		  FUNCTION PROTOTYPES	    	  			 **
******************************************************************/

int OWInit (void);

void OWWriteBit (int bit1);

int OWReadBit (void);

void OWWriteByte (int byte);

int OWReadByte (void);

void Convert_Temperature (void);

float Read_Temperature (void);

#endif
