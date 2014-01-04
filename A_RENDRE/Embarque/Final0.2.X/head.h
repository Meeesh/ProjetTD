#ifndef _HEAD_H_
#define _HEAD_H_

#include <p18lf46k22.h>
#include <delays.h>
#include "periph/affi.h"
#include "periph/boutons.h"
#include "periph/usart.h"
#include "periph/1wire.h"
#include "ftoa/ftoa.h"
#include "xlcd.h"
#include "TIMERS.h"
#include "TIOS.h"
#include "usart.h"

//**********************
//* VARIABLES GLOBALES *
//**********************
enum {NUM, ANA};
enum {OUT, IN};
enum {OFF, ON};

//**********
//* DEFINE *
//**********
#define IO_LED  PORTCbits.RC6
#define IO_REL  PORTBbits.RB4

#endif