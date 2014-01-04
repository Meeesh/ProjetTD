#include "head.h"

#include "TCPIPConfig.h"
#include "HardwareProfile.h"
#include "TCPIP Stack/StackTsk.h"
#include <timers.h>
#include "TCPIP Stack/TCPIP.h"
#include <string.h>
#include "TCPIP Stack/TCP.h"

// **************************
// * DIRECTIVES COMPILATION *
// **************************
#pragma config FOSC = INTIO67
#pragma config PLLCFG = OFF
#pragma config PRICLKEN = OFF
#pragma config FCMEN = OFF
#pragma config PWRTEN = ON
#pragma config BOREN = OFF
#pragma config WDTEN = OFF
#pragma config LVP = OFF
#pragma config MCLRE = EXTMCLR
#pragma config IESO = OFF

//**********
//* DEFINE *
//**********

//**********************
//* VARIABLES GLOBALES *
//**********************
unsigned char rfid[10];     //utiliser dans la construction de la trame pour l'envoi de onnées au module RFID
unsigned float temper;      //utiliser pour la lecture de la temperature
unsigned volatile char affiLCD[15], TabData[5];     //variable temporaire pour afficher des valeurs au lcd
unsigned volatile char etat=0;
float temperature = 18;
volatile unsigned char etatTemperature=0;
char tamponAdc[5];
volatile unsigned int adcRec=0;
volatile float adc=0;
volatile unsigned char etatConversion=0;

//VARIABLES GLOBALES ETHERNET
APP_CONFIG AppConfig; //Structure déclarée dans StackTsk.h -> Sans ca pas de compilation
//BYTE DonneEnvoi[11]="Hello world"; //Données à envoyer en utilisant TCPPutArray
BYTE DonneEnvoi[];
static TCP_SOCKET MonSocket = INVALID_SOCKET; //Initialisation du socket TCP
WORD nbDonnee=0;
BOOL connectTCP=FALSE;
WORD verifPut=0;
WORD verifGet=0;
char messageETHERNET[16] = "Eth ";
unsigned char afficheConnected = 0;
char messageSENDING[] = "SEND";
char messageOPEN[] = "OPEN ";
char messageCLOSED[] = "CLOSED ";
//Initialisation des chaines de caractères à envoyer
int compteurChoix = 0;
char temperatureString[5];

//**************
//* PROTOTYPES *
//**************
void RFIDL(void);
void rfidLect(char);
/*
 * APPEL :  rfidLect([SECTEUR]);
 * Descr :  Envoi la demande de lecture au module RFID
 * INPUT :  [SECTEUR] : Numéro du secteur dont on souhaite en lire le contenu
 * OUTPUT:  N/A
 */
void rfidEcri(char, char, char, char, char);
/*
 * APPEL :  rfidEcri([SECTEUR], [DATA1], [DATA2], [DATA3], [DATA4]);
 * Descr :  Envoi le demande d'écriture au module RFID
 * INPUT :  [SECTEUR] : Numéro du  secteur dans lequel on veut placer les données
 *          [DATAx]   : Octets a envoyer
 * OUPUT :  N/A
 */
void LiczCRC2(unsigned char *, unsigned short *, unsigned char);
/*
 * Fcontion utiliser pour l'envoi de données au RFID, PAS UTILE POUR L'UTILISSATEUR !
 */
void LectTEMP(void);
/*
 * APPEL : UNIQUEMENT pour le call back
 * Descr : Lecture de la temperature via call back
 * INPUT : N/A
 * OUTPUT: N/A
 */
void gestionBT(char);
/*
 * APPEL : UNIQUEMENT pour le call back
 * Descr : Permet la gestion lors d'un appuy d'un boutton
 * INPUT : Quel bouton a été appuyer
 * OUTPUT: N/A
 */
void gestionETH(void);
/*
 * APPEL : UNIQUEMENT pour le call back
 * Descr : Permet la gestion d'envoi de données via l'eth
 * INPUT : N/A
 * OUTPUT: N/A
 */
void gestionRFID(char , char, char, char);
/*
 * APPEL : UNIQUEMENT pour le call back
 * Descr : Permet la gestion lors d'une interruption du rfid
 * INPUT : char: caractère recu par le rfid
 * OUTPUT: N/A
 */
void gestionUSART(char);
/*
 * APPEL : UNIQUEMENT pour le call back
 * Descr : Permet de gèrer lors d'une interruption de l'usart en récéption
 * INPUT : char: caractère reçus par l'usart
 * OUTPUT: N/A
 */
static void InitAppConfig(void);
void InitADC(void);
void Convertion(void);
void getTemperature(void);
void getConversion(void);
void initUsart(void);
void getPcUsart(char *caractere);
void ethernetInit(void);
void ethernetEnvoi(void);

//****************** fonction principale *****************
void main (void)
{


    // Initialisation de l'OS (appel des Callbacks)
    TIOSInitialiser();

    // Initialisation des Callbacks
      TIOSEnregistrerCB_Bout(&gestionBT);
//    TIOSEnregistrerCB_ETH(&gestionETH);
//    TIOSEnregistrerCB_RFID(&gestionRFID);
//    TIOSEnregistrerCB_USART(&gestionUSART);

    // Initialisation des Callbacks avec temps
    TIOSEnregistrerCB_RFID(&gestionRFID);

    TIOSEnregistrerCB_TIMER(&getTemperature,1500);
    TIOSEnregistrerCB_TIMER(&getConversion,2000);
    TIOSEnregistrerCB_USARTRECEPT(&getPcUsart);

    // Lancement OS (Boucle infinie)
    TIOSStart();
}

void rfidLect(char sec)
{
    char tmp;
    //reset du tableau RFID
    for(tmp = 0; tmp <= 9; tmp++)
        rfid[tmp] = 0;
    tmp = 0;
    //LECTURE
    //------------------
    rfid[0] = 0xFF;        //on selectionne toutes les cartes
    rfid[1] = 0x06;        //longueure de la tramme
    rfid[2] = 0x12;        //envoie de la commande de lecture
    rfid[3] = sec;        //selection du secteur
    LiczCRC2(rfid, (unsigned short *)&rfid[4], 4);    //calcul des bits CRCH et CRCL
    tmp = rfid[4]; rfid[4] = rfid[5]; rfid[5] = tmp;    //inversion par rapport a la fonction
    //------------------
    tmp = 0;
    TXREG2 = rfid[tmp];
    tmp++;
    while(tmp <= 5)      //envoi des données un a un sur l'USART2
    {
        while(TXSTA2bits.TRMT != 1);
        TXREG2 = rfid[tmp];
        tmp++;
    }
}

void rfidEcri(char sec, char dt1, char dt2, char dt3, char dt4)
{
    char tmp;
    //reset du tableau RFID
    for(tmp = 0; tmp <= 9; tmp++)
        rfid[tmp] = 0;
    tmp = 0;
    //ECRITURE
    //------------------
    rfid[0] = 0xFF;         //on ne connait pas la carte
    rfid[1] = 0x0A;         //longueure de la trame
    rfid[2] = 0x10;         //commande d'ecriture
    rfid[3] = dt1;         //DATA1
    rfid[4] = dt2;         //DATA2
    rfid[5] = dt3;         //DATA3
    rfid[6] = dt4;         //DATA4
    rfid[7] = sec;         //Secteur
    LiczCRC2(rfid, (unsigned short *)&rfid[8], 8);    //calcul des bits CRCH et CRCL
    tmp = rfid[8]; rfid[8] = rfid[9]; rfid[9] = tmp;    //inversion par rapport a la fonction
    //------------------
    tmp = 0;
    TXREG2 = rfid[tmp];
    tmp++;
    while(tmp <= 9)      //envoi des données un a un sur l'USART2
    {
        while(TXSTA2bits.TRMT != 1);
        TXREG2 = rfid[tmp];
        tmp++;
    }
}

void LiczCRC2(unsigned char *ZAdr, unsigned short *DoAdr, unsigned char Ile)        //calcul des bits CRCL & CRCH
{
    int i,NrBajtu;
    unsigned short C;
    *DoAdr=0;
    for (NrBajtu=1;NrBajtu<=Ile;NrBajtu++,ZAdr++)
    {
        C=((*DoAdr>>8)^*ZAdr)<<8;
        for (i=0;i<8;i++)
        if (C&0x8000) C=(C<<1)^0x1021;
        else C=C<<1;
        *DoAdr=C^(*DoAdr<<8);
    }
}

void gestionBT(char bt)
{
    if(bt == 'e')
    {
        rfidLect(0x02);
    }

}
void gestionETH(void)
{

}
void gestionRFID(char data1, char data2, char data3, char data4)
{
    if(data1 == 0 && data2 == 0 && data3 == 0 && data4 == 0)
    {
        SetDDRamAddr(0x40);
        while(BusyXLCD());
        putrsXLCD("                ");
        while(BusyXLCD());
        SetDDRamAddr(0x40);
        while(BusyXLCD());
        putrsXLCD("Pas de carte");
    }
    else
    {
        TabData[0] = data1;
        TabData[1] = data2;
        TabData[2] = data3;
        TabData[3] = data4;
        TabData[4] = 0;
        SetDDRamAddr(0x40);
        while(BusyXLCD());
        putrsXLCD("                ");
        while(BusyXLCD());
        SetDDRamAddr(0x40);
        while(BusyXLCD());
        putsXLCD(TabData);

        //Envoie des donnees USART
        TXREG1 = data1;
        while(TXSTA1bits.TRMT == 0);
        TXREG1 = data2;
        while(TXSTA1bits.TRMT == 0);
        TXREG1 = data3;
        while(TXSTA1bits.TRMT == 0);
        TXREG1 = data4;
        while(TXSTA1bits.TRMT == 0);
    }
    
}

void gestionUSART(char recu)
{

}

void ethernetInit(){
    //Affichage LCD pour ethernet
    while(BusyXLCD());
    SetDDRamAddr(0x00);
    while(BusyXLCD());
    putsXLCD(messageETHERNET);
    ENC_CS_TRIS=0; //Configuration de la pile
    ENC_CS_IO=1; //Configuration de la pile

    TickInit(); //Initialisation de l'horloge de la pile TCPIP var utiliser le TMR0
    InitAppConfig();

    StackInit(); //Initialisation de la pile
    StackTask();
    StackApplications();

//    MonSocket = TCPOpen((DWORD)0xC80A650A,TCP_OPEN_IP_ADDRESS,45684,TCP_PURPOSE_DEFAULT); //Ouverture d'un nouveau socket CLIENT ici TCP sur une certaine IP : 10.101.10.200
//    MonSocket = TCPOpen((DWORD)0x4501A8C0,TCP_OPEN_IP_ADDRESS,45684,TCP_PURPOSE_DEFAULT); //ICI 192.168.1.69
    MonSocket = TCPOpen((DWORD)0x660B650A,TCP_OPEN_IP_ADDRESS,45684,TCP_PURPOSE_DEFAULT); //ICI 10.101.11.102
//    MonSocket = TCPOpen(0,TCP_OPEN_SERVER,45684,TCP_PURPOSE_DEFAULT); //ICI 10.101.11.179
    if(MonSocket == INVALID_SOCKET){
        while(BusyXLCD());
        putsXLCD(messageCLOSED);
        while(BusyXLCD());
    }else{
        while(BusyXLCD());
        putsXLCD(messageOPEN);
        while(BusyXLCD());
    }
}

void ethernetEnvoi(){
    StackTask();
    StackApplications();

    connectTCP = TCPIsConnected(MonSocket); //Vérifie si on a une connexion établie avec le noeud suivant
    if(connectTCP == TRUE){

        if(afficheConnected == 0)
        {
            afficheConnected = 1;
            while(BusyXLCD());
            SetDDRamAddr(0x09);
            while(BusyXLCD());
            putsXLCD(messageSENDING);
            while(BusyXLCD());
            SetDDRamAddr(0x09);
            while(BusyXLCD());
        }
        verifPut = TCPIsPutReady(MonSocket); //Vérifie si le buffer d'envoi est OK. Si renvoie 0 il faut essayer de nettoyer avant
        if(verifPut == 0){
            StackTask();
            StackApplications();
            verifPut = TCPIsPutReady(MonSocket);//Retourne le nombre d'octets qui peuvent être envoyés dans le tampon TX TCP
        }
        compteurChoix++;
        if(compteurChoix%2){
            ftoa(temperature,temperatureString, 2, 'f');
            TCPPutArray(MonSocket, temperatureString, 5);
        }else{
            TCPPutArray(MonSocket, tamponAdc, 5);
        }
    }else{
        //PORTCbits.RC2 = 1; // Si la LED est allumée, c'est que l'ethernet est en cours de connexion
    }
    //Delay10KTCYx(200);
    //TCPClose(MonSocket);
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

void InitADC(void){
    ADCON0bits.CHS=0b11000;
    ADCON0bits.ADON=1;
    ADCON2bits.ADFM=1;
    ADCON1bits.PVCFG=0b00;
    ADCON1bits.NVCFG=0b00;
    PMD2bits.ADCMD=1;
    ADCON2bits.ADCS=0b101;
    ADCON2bits.ACQT=0b010;
}
/*
void getConversion(void){
    ADCON0bits.GO_DONE=1;
    while (ADCON0bits.GO_DONE);
    adcRec = ((unsigned int)ADRESH<<8)|(ADRESL);
    adc = (((float)adcRec)*5.0)/1024;
    ftoa(adc, tamponAdc, 2, 'F');
}
*/

void getConversion(void){
    if(etatConversion == 0){
        ADCON0bits.GO_DONE=1;
        etatConversion = 1;
    }else{
        adcRec = ((unsigned int)ADRESH<<8)|(ADRESL);
        adc = (((float)adcRec)*5.0)/1024;
        ftoa(adc, tamponAdc, 2, 'f');
        etatConversion = 0;
    }

}

void getTemperature(void){
    if(etatTemperature == 0)
    {
        Convert_Temperature();
        etatTemperature = 1;
    }
    else
    {
        temperature = Read_Temperature();
        etatTemperature = 0;
    }
}
/*
void initUsart(void){
        //USART
    TRISCbits.RC6=1; //USART : Pin en en Input car dans datasheet.
    TRISCbits.RC7=1;
        //9600 baut
    TXSTA1bits.SYNC = 0;
    TXSTA1bits.BRGH = 0;
    BAUDCON1bits.BRG16 = 0;
    TXSTA1bits.TXEN = 1;
    TXSTA1bits.TX9 = 0;
    SPBRG1 = 25;
    RCSTA1bits.SPEN = 1;
    RCSTA1bits.CREN = 1;
        //INITIALISATION DES INTERRUPTIONS
    PIE1bits.RC1IE = 1; // Active les interruptions sur les réceptions de l'EUSART [p123]
    PIR1bits.RC1IF = 0; // Configure le flag d'EUSART1_RC à 0 [p118]
    IPR1bits.RC1IP = 1; // Paramètre la priorité haute sur les interruptions de l'EUSART [p127]
}
*/

void getPcUsart(char *caractere){
    int compteurUsart=0;
    SetDDRamAddr(0x40);
    while(BusyXLCD());
    putrsXLCD("                ");
    while(BusyXLCD());
    SetDDRamAddr(0x40);
    while(BusyXLCD());
    putsXLCD(&caractere[0]);
    rfidEcri(0x02,caractere[0],caractere[1],caractere[2],caractere[3]);
    for(compteurUsart=0;compteurUsart<5;compteurUsart++)
        caractere[compteurUsart]=0;
    //flagusart=0;
    compteurUsart=0;

    
}