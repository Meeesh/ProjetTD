#ifndef ETHERNET_H
#define	ETHERNET_H

#include "ETHERNET/TCPIP Stack/TCPIP.h"
#include "ETHERNET/TCPIPConfig.h"
#include "ETHERNET/HardwareProfile.h"
//#include "ETHERNET/TCPIP Stack/Tick.h"
#include "ETHERNET/TCPIP Stack/StackTsk.h"

void initEthernet(void);
static void InitAppConfig(void);

#endif	/* ETHERNET_H */

