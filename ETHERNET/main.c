// CANEVAS

// INCLUDES

// LIBRAIRIE STANDARD MPLABC18
#include <p18cxxx.h>
#include <p18f46k22.h>
#include <delays.h>
#include "xlcd.h"

#include "TCPIPConfig.h"
#include "HardwareProfile.h"
#include "TCPIP Stack/StackTsk.h"
#include <timers.h>
#include "TCPIP Stack/TCPIP.h"
#include <string.h>
#include "TCPIP Stack/TCP.h"

// LIBRAIRIE PERSONNELLE



// DIRECTIVES COMPILATIONS
//osc=16MHz interne		//=> 250ns pour une instruction
//aller voir dans pic 18f46k22.INC

#pragma config FOSC = INTIO67	//Fosc=1000 Sélection oscillateur interne, I/O sur RA6 and RA7
#pragma config PLLCFG = ON		//4xPLL
#pragma config PRICLKEN = ON	//primary clock
#pragma config FCMEN = OFF		//Fail-Safe Clock Monitor

#pragma config LVP = OFF  //Programmation in situ (ICSP) en basse tension
#pragma config PWRTEN = OFF //Timer de démarrage
#pragma config WDTEN = OFF  //Chien de garde désactivé
#pragma config BOREN = OFF  //Détection de fluctuation d'alimentation (Brown-out)
#pragma config IESO = OFF	//apres PWRT et POR voir datasheet page42

//DEFINE


//VARIABLES GLOBALES ETHERNET
APP_CONFIG AppConfig; //Structure déclarée dans StackTsk.h -> Sans ca pas de compilation
BYTE DonneEnvoi[30]="Hello world\0"; //Données à envoyer en utilisant TCPPutArray
static TCP_SOCKET MonSocket = INVALID_SOCKET; //Initialisation du socket TCP
WORD nbDonnee=0;
BOOL connectTCP=FALSE;
WORD verifPut=0;
WORD verifGet=0;
char messageLCD[16] = "Ethernet";
//char messageLCD[16] = "Initialisation..";

//FONCTIONS INTERNES
void HAUTEPRIORITEInterrupt(void);
void BASSEPRIORITEInterrupt(void);
void DelayFor18TCY(void);
void DelayPORXLCD(void);
void DelayXLCD(void);
static void InitAppConfig(void);

// ************* PLACEMENT DU CODE DE L'INTERRUPTION  HAUTE PRIORITE  *************
// 		On déclare que lors d'une interruption on doit exécuter
// 		le code de la fonction HAUTEPRIORITEInterrupt
// ********************************************************************************
#pragma code toto=0x0008
void tata(void)
 {
  _asm GOTO HAUTEPRIORITEInterrupt _endasm
 }
#pragma code // retour à la zone de code


// ************* PLACEMENT DU CODE DE L'INTERRUPTION  BASSE PRIORITE  *************
// 		On déclare que lors d'une interruption on doit exécuter
// 		le code de la fonction BASSEPRIORITEInterrupt
// ********************************************************************************
#pragma code tutu=0x0018
void titi(void)
 {
  _asm GOTO BASSEPRIORITEInterrupt _endasm
 }
#pragma code // retour à la zone de code


void ethernetServeur(void){
    StackTask();
    StackApplications();
    connectTCP = TCPIsConnected(MonSocket); //Vérifie si on a une connexion établie avec le noeud suivant
    StackTask();
    StackApplications();
    if(connectTCP == TRUE){
        verifGet = TCPIsGetReady(MonSocket); //Vérifie si le buffer d'envoi est OK. Si renvoie 0 il faut essayer de nettoyer avant
        while(verifGet == 0){
            StackTask();
            StackApplications();
            verifGet = TCPIsPutReady(MonSocket);//Retourne le nombre d'octets qui peuvent être envoyés dans le tampon TX TCP
        }
    }else{
        PORTCbits.RC2 = 1; // Si la LED clignote c'est que l'ethernet est en cours de connexion
    }
    //Delay10KTCYx(200);
    Delay10KTCYx(100);
    //TCPClose(MonSocket);
    StackTask();
    StackApplications();
    PORTCbits.RC2 = 0; // Si la LED clignote c'est que l'ethernet est en cours de connexion
}


// PROGRAMME PRINCIPAL
void main()
{
    OSCCONbits.IRCF=0b111;
    ANSELA = 0;
    ANSELB = 0;
    ANSELC = 0;
    ANSELD = 0;
    ANSELE = 0;

    TRISCbits.TRISC2 = 0;
    PORTCbits.RC2 = 0;

    //LCD
    TRISD = 0;
    TRISA = 0;
    OpenXLCD(FOUR_BIT & LINES_5X7);
    while(BusyXLCD());
    SetDDRamAddr(0x00);
    while(BusyXLCD());
    putsXLCD(messageLCD);

    //Module ethernet
    ENC_CS_TRIS=0; //Configuration de la pile
    ENC_CS_IO=1; //Configuration de la pile
    
    TickInit(); //Initialisation de l'horloge de la pile TCPIP var utiliser le TMR0
    InitAppConfig();
    
    StackInit(); //Initialisation de la pile
    StackTask();
    StackApplications();

//    MonSocket = TCPOpen((DWORD)0xC80A650A,TCP_OPEN_IP_ADDRESS,45684,TCP_PURPOSE_DEFAULT); //Ouverture d'un nouveau socket CLIENT ici TCP sur une certaine IP : 10.101.10.200
//    MonSocket = TCPOpen((DWORD)0x4501A8C0,TCP_OPEN_IP_ADDRESS,45684,TCP_PURPOSE_DEFAULT); //ICI 192.168.1.69
//    MonSocket = TCPOpen((DWORD)0xB00B650A,TCP_OPEN_IP_ADDRESS,45684,TCP_PURPOSE_DEFAULT); //ICI 10.101.11.179
    MonSocket = TCPOpen(0,TCP_OPEN_SERVER,45684,TCP_PURPOSE_DEFAULT); //ICI 10.101.11.179
    if(MonSocket == INVALID_SOCKET){
        while(BusyXLCD());
        putrsXLCD(" CLOSED");
        while(BusyXLCD());
    }else{
        while(BusyXLCD());
        putrsXLCD(" OPEN");
        while(BusyXLCD());
    }
    while(BusyXLCD());
    SetDDRamAddr(0x40);
    
    while(1)
    {
//MonSocket = TCPOpen((DWORD)0xB00B650A,TCP_OPEN_IP_ADDRESS,45684,TCP_PURPOSE_DEFAULT); //ICI 10.101.11.179
//MonSocket = TCPOpen(0,TCP_OPEN_SERVER,45684,TCP_PURPOSE_DEFAULT); //ICI 10.101.11.179
        StackTask();
        StackApplications();

        connectTCP = TCPIsConnected(MonSocket); //Vérifie si on a une connexion établie avec le noeud suivant
        if(connectTCP == TRUE){
            while(BusyXLCD());
            putrsXLCD("CONNECTED SENDING");
            while(BusyXLCD());
//            verifPut = TCPIsPutReady(MonSocket); //Vérifie si le buffer d'envoi est OK. Si renvoie 0 il faut essayer de nettoyer avant
//            while(verifPut == 0){
//                StackTask();
//                StackApplications();
//                verifPut = TCPIsPutReady(MonSocket);//Retourne le nombre d'octets qui peuvent être envoyés dans le tampon TX TCP
//            }
//            TCPPutArray(MonSocket, DonneEnvoi, 12);
        }else{
            PORTCbits.RC2 = 1; // Si la LED clignote c'est que l'ethernet est en cours de connexion
        }
        //Delay10KTCYx(200);
        //TCPClose(MonSocket);
        
        PORTCbits.RC2 = 0; // Si la LED clignote c'est que l'ethernet est en cours de connexion
    }
}

#pragma interrupt HAUTEPRIORITEInterrupt
void HAUTEPRIORITEInterrupt(void)
{

}

#pragma interrupt BASSEPRIORITEInterrupt
void BASSEPRIORITEInterrupt(void)
{
    TickUpdate();
}

void DelayFor18TCY(void){
	Nop();
        Nop();
	Nop();
        Nop();
	Nop();
        Nop();
	Nop();
        Nop();
	Nop();
        Nop();
	Nop();
        Nop();
        Nop();
        Nop();
        Nop();
        Nop();
}

void DelayPORXLCD(void){
	Delay1KTCYx(60);
}

void DelayXLCD(void){
	Delay1KTCYx(20);
}

/*********************************************************************
 * Function:        void InitAppConfig(void)
 *
 * PreCondition:    MPFSInit() is already called.
 *
 * Input:           None
 *
 * Output:          Write/Read non-volatile config variables.
 *
 * Side Effects:    None
 *
 * Overview:        None
 *
 * Note:            None
 ********************************************************************/
// MAC Address Serialization using a MPLAB PM3 Programmer and
// Serialized Quick Turn Programming (SQTP).
// The advantage of using SQTP for programming the MAC Address is it
// allows you to auto-increment the MAC address without recompiling
// the code for each unit.  To use SQTP, the MAC address must be fixed
// at a specific location in program memory.  Uncomment these two pragmas
// that locate the MAC address at 0x1FFF0.  Syntax below is for MPLAB C
// Compiler for PIC18 MCUs. Syntax will vary for other compilers.
//#pragma romdata MACROM=0x1FFF0
static ROM BYTE SerializedMACAddress[6] = {MY_DEFAULT_MAC_BYTE1, MY_DEFAULT_MAC_BYTE2, MY_DEFAULT_MAC_BYTE3, MY_DEFAULT_MAC_BYTE4, MY_DEFAULT_MAC_BYTE5, MY_DEFAULT_MAC_BYTE6};
//#pragma romdata

static void InitAppConfig(void)
{
#if defined(EEPROM_CS_TRIS) || defined(SPIFLASH_CS_TRIS)
	unsigned char vNeedToSaveDefaults = 0;
#endif

	while(1)
	{
		// Start out zeroing all AppConfig bytes to ensure all fields are
		// deterministic for checksum generation
		memset((void*)&AppConfig, 0x00, sizeof(AppConfig));

		AppConfig.Flags.bIsDHCPEnabled = TRUE;
		AppConfig.Flags.bInConfigMode = TRUE;
		memcpypgm2ram((void*)&AppConfig.MyMACAddr, (ROM void*)SerializedMACAddress, sizeof(AppConfig.MyMACAddr));
//		{
//			_prog_addressT MACAddressAddress;
//			MACAddressAddress.next = 0x157F8;
//			_memcpy_p2d24((char*)&AppConfig.MyMACAddr, MACAddressAddress, sizeof(AppConfig.MyMACAddr));
//		}
		AppConfig.MyIPAddr.Val = MY_DEFAULT_IP_ADDR_BYTE1 | MY_DEFAULT_IP_ADDR_BYTE2<<8ul | MY_DEFAULT_IP_ADDR_BYTE3<<16ul | MY_DEFAULT_IP_ADDR_BYTE4<<24ul;
		AppConfig.DefaultIPAddr.Val = AppConfig.MyIPAddr.Val;
		AppConfig.MyMask.Val = MY_DEFAULT_MASK_BYTE1 | MY_DEFAULT_MASK_BYTE2<<8ul | MY_DEFAULT_MASK_BYTE3<<16ul | MY_DEFAULT_MASK_BYTE4<<24ul;
		AppConfig.DefaultMask.Val = AppConfig.MyMask.Val;
		AppConfig.MyGateway.Val = MY_DEFAULT_GATE_BYTE1 | MY_DEFAULT_GATE_BYTE2<<8ul | MY_DEFAULT_GATE_BYTE3<<16ul | MY_DEFAULT_GATE_BYTE4<<24ul;
		AppConfig.PrimaryDNSServer.Val = MY_DEFAULT_PRIMARY_DNS_BYTE1 | MY_DEFAULT_PRIMARY_DNS_BYTE2<<8ul  | MY_DEFAULT_PRIMARY_DNS_BYTE3<<16ul  | MY_DEFAULT_PRIMARY_DNS_BYTE4<<24ul;
		AppConfig.SecondaryDNSServer.Val = MY_DEFAULT_SECONDARY_DNS_BYTE1 | MY_DEFAULT_SECONDARY_DNS_BYTE2<<8ul  | MY_DEFAULT_SECONDARY_DNS_BYTE3<<16ul  | MY_DEFAULT_SECONDARY_DNS_BYTE4<<24ul;


		// SNMP Community String configuration
		#if defined(STACK_USE_SNMP_SERVER)
		{
			BYTE i;
			static ROM char * ROM cReadCommunities[] = SNMP_READ_COMMUNITIES;
			static ROM char * ROM cWriteCommunities[] = SNMP_WRITE_COMMUNITIES;
			ROM char * strCommunity;

			for(i = 0; i < SNMP_MAX_COMMUNITY_SUPPORT; i++)
			{
				// Get a pointer to the next community string
				strCommunity = cReadCommunities[i];
				if(i >= sizeof(cReadCommunities)/sizeof(cReadCommunities[0]))
					strCommunity = "";

				// Ensure we don't buffer overflow.  If your code gets stuck here,
				// it means your SNMP_COMMUNITY_MAX_LEN definition in TCPIPConfig.h
				// is either too small or one of your community string lengths
				// (SNMP_READ_COMMUNITIES) are too large.  Fix either.
				if(strlenpgm(strCommunity) >= sizeof(AppConfig.readCommunity[0]))
					while(1);

				// Copy string into AppConfig
				strcpypgm2ram((char*)AppConfig.readCommunity[i], strCommunity);

				// Get a pointer to the next community string
				strCommunity = cWriteCommunities[i];
				if(i >= sizeof(cWriteCommunities)/sizeof(cWriteCommunities[0]))
					strCommunity = "";

				// Ensure we don't buffer overflow.  If your code gets stuck here,
				// it means your SNMP_COMMUNITY_MAX_LEN definition in TCPIPConfig.h
				// is either too small or one of your community string lengths
				// (SNMP_WRITE_COMMUNITIES) are too large.  Fix either.
				if(strlenpgm(strCommunity) >= sizeof(AppConfig.writeCommunity[0]))
					while(1);

				// Copy string into AppConfig
				strcpypgm2ram((char*)AppConfig.writeCommunity[i], strCommunity);
			}
		}
		#endif

		// Load the default NetBIOS Host Name
		memcpypgm2ram(AppConfig.NetBIOSName, (ROM void*)MY_DEFAULT_HOST_NAME, 16);
		FormatNetBIOSName(AppConfig.NetBIOSName);

		#if defined(WF_CS_TRIS)
			// Load the default SSID Name
			WF_ASSERT(sizeof(MY_DEFAULT_SSID_NAME) <= sizeof(AppConfig.MySSID));
			memcpypgm2ram(AppConfig.MySSID, (ROM void*)MY_DEFAULT_SSID_NAME, sizeof(MY_DEFAULT_SSID_NAME));
			AppConfig.SsidLength = sizeof(MY_DEFAULT_SSID_NAME) - 1;

	        AppConfig.SecurityMode = MY_DEFAULT_WIFI_SECURITY_MODE;
	        AppConfig.WepKeyIndex  = MY_DEFAULT_WEP_KEY_INDEX;

	        #if (MY_DEFAULT_WIFI_SECURITY_MODE == WF_SECURITY_OPEN)
	            memset(AppConfig.SecurityKey, 0x00, sizeof(AppConfig.SecurityKey));
	            AppConfig.SecurityKeyLength = 0;

	        #elif MY_DEFAULT_WIFI_SECURITY_MODE == WF_SECURITY_WEP_40
	            memcpypgm2ram(AppConfig.SecurityKey, (ROM void*)MY_DEFAULT_WEP_KEYS_40, sizeof(MY_DEFAULT_WEP_KEYS_40) - 1);
	            AppConfig.SecurityKeyLength = sizeof(MY_DEFAULT_WEP_KEYS_40) - 1;

	        #elif MY_DEFAULT_WIFI_SECURITY_MODE == WF_SECURITY_WEP_104
			    memcpypgm2ram(AppConfig.SecurityKey, (ROM void*)MY_DEFAULT_WEP_KEYS_104, sizeof(MY_DEFAULT_WEP_KEYS_104) - 1);
			    AppConfig.SecurityKeyLength = sizeof(MY_DEFAULT_WEP_KEYS_104) - 1;

	        #elif (MY_DEFAULT_WIFI_SECURITY_MODE == WF_SECURITY_WPA_WITH_KEY)       || \
	              (MY_DEFAULT_WIFI_SECURITY_MODE == WF_SECURITY_WPA2_WITH_KEY)      || \
	              (MY_DEFAULT_WIFI_SECURITY_MODE == WF_SECURITY_WPA_AUTO_WITH_KEY)
			    memcpypgm2ram(AppConfig.SecurityKey, (ROM void*)MY_DEFAULT_PSK, sizeof(MY_DEFAULT_PSK) - 1);
			    AppConfig.SecurityKeyLength = sizeof(MY_DEFAULT_PSK) - 1;

	        #elif (MY_DEFAULT_WIFI_SECURITY_MODE == WF_SECURITY_WPA_WITH_PASS_PHRASE)     || \
	              (MY_DEFAULT_WIFI_SECURITY_MODE == WF_SECURITY_WPA2_WITH_PASS_PHRASE)    || \
	              (MY_DEFAULT_WIFI_SECURITY_MODE == WF_SECURITY_WPA_AUTO_WITH_PASS_PHRASE)
	            memcpypgm2ram(AppConfig.SecurityKey, (ROM void*)MY_DEFAULT_PSK_PHRASE, sizeof(MY_DEFAULT_PSK_PHRASE) - 1);
	            AppConfig.SecurityKeyLength = sizeof(MY_DEFAULT_PSK_PHRASE) - 1;

	        #else
	            #error "No security defined"
	        #endif /* MY_DEFAULT_WIFI_SECURITY_MODE */

		#endif

		// Compute the checksum of the AppConfig defaults as loaded from ROM
//		wOriginalAppConfigChecksum = CalcIPChecksum((BYTE*)&AppConfig, sizeof(AppConfig));

		#if defined(EEPROM_CS_TRIS) || defined(SPIFLASH_CS_TRIS)
		{
			NVM_VALIDATION_STRUCT NVMValidationStruct;

			// Check to see if we have a flag set indicating that we need to
			// save the ROM default AppConfig values.
			if(vNeedToSaveDefaults)
				SaveAppConfig(&AppConfig);

			// Read the NVMValidation record and AppConfig struct out of EEPROM/Flash
			#if defined(EEPROM_CS_TRIS)
			{
				XEEReadArray(0x0000, (BYTE*)&NVMValidationStruct, sizeof(NVMValidationStruct));
				XEEReadArray(sizeof(NVMValidationStruct), (BYTE*)&AppConfig, sizeof(AppConfig));
			}
			#elif defined(SPIFLASH_CS_TRIS)
			{
				SPIFlashReadArray(0x0000, (BYTE*)&NVMValidationStruct, sizeof(NVMValidationStruct));
				SPIFlashReadArray(sizeof(NVMValidationStruct), (BYTE*)&AppConfig, sizeof(AppConfig));
			}
			#endif

			// Check EEPROM/Flash validitity.  If it isn't valid, set a flag so
			// that we will save the ROM default values on the next loop
			// iteration.
			if((NVMValidationStruct.wConfigurationLength != sizeof(AppConfig)) ||
			   (NVMValidationStruct.wOriginalChecksum != wOriginalAppConfigChecksum) ||
			   (NVMValidationStruct.wCurrentChecksum != CalcIPChecksum((BYTE*)&AppConfig, sizeof(AppConfig))))
			{
				// Check to ensure that the vNeedToSaveDefaults flag is zero,
				// indicating that this is the first iteration through the do
				// loop.  If we have already saved the defaults once and the
				// EEPROM/Flash still doesn't pass the validity check, then it
				// means we aren't successfully reading or writing to the
				// EEPROM/Flash.  This means you have a hardware error and/or
				// SPI configuration error.
				if(vNeedToSaveDefaults)
				{
					while(1);
				}

				// Set flag and restart loop to load ROM defaults and save them
				vNeedToSaveDefaults = 1;
				continue;
			}

			// If we get down here, it means the EEPROM/Flash has valid contents
			// and either matches the ROM defaults or previously matched and
			// was run-time reconfigured by the user.  In this case, we shall
			// use the contents loaded from EEPROM/Flash.
			break;
		}
		#endif
		break;
	}
}