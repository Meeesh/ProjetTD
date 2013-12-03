#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/1wire_usart.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/1wire_usart.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1655634853/ftoa.p1 ${OBJECTDIR}/_ext/1655177946/busyxlcd.p1 ${OBJECTDIR}/_ext/1655177946/openxlcd.p1 ${OBJECTDIR}/_ext/1655177946/putrxlcd.p1 ${OBJECTDIR}/_ext/1655177946/putsxlcd.p1 ${OBJECTDIR}/_ext/1655177946/readaddr.p1 ${OBJECTDIR}/_ext/1655177946/readdata.p1 ${OBJECTDIR}/_ext/1655177946/setcgram.p1 ${OBJECTDIR}/_ext/1655177946/setddram.p1 ${OBJECTDIR}/_ext/1655177946/wcmdxlcd.p1 ${OBJECTDIR}/_ext/1655177946/writdata.p1 ${OBJECTDIR}/_ext/781772394/boutons.p1 ${OBJECTDIR}/_ext/781772394/affi.p1 ${OBJECTDIR}/_ext/1656130826/1wire.p1 ${OBJECTDIR}/_ext/781772394/Main.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1655634853/ftoa.p1.d ${OBJECTDIR}/_ext/1655177946/busyxlcd.p1.d ${OBJECTDIR}/_ext/1655177946/openxlcd.p1.d ${OBJECTDIR}/_ext/1655177946/putrxlcd.p1.d ${OBJECTDIR}/_ext/1655177946/putsxlcd.p1.d ${OBJECTDIR}/_ext/1655177946/readaddr.p1.d ${OBJECTDIR}/_ext/1655177946/readdata.p1.d ${OBJECTDIR}/_ext/1655177946/setcgram.p1.d ${OBJECTDIR}/_ext/1655177946/setddram.p1.d ${OBJECTDIR}/_ext/1655177946/wcmdxlcd.p1.d ${OBJECTDIR}/_ext/1655177946/writdata.p1.d ${OBJECTDIR}/_ext/781772394/boutons.p1.d ${OBJECTDIR}/_ext/781772394/affi.p1.d ${OBJECTDIR}/_ext/1656130826/1wire.p1.d ${OBJECTDIR}/_ext/781772394/Main.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1655634853/ftoa.p1 ${OBJECTDIR}/_ext/1655177946/busyxlcd.p1 ${OBJECTDIR}/_ext/1655177946/openxlcd.p1 ${OBJECTDIR}/_ext/1655177946/putrxlcd.p1 ${OBJECTDIR}/_ext/1655177946/putsxlcd.p1 ${OBJECTDIR}/_ext/1655177946/readaddr.p1 ${OBJECTDIR}/_ext/1655177946/readdata.p1 ${OBJECTDIR}/_ext/1655177946/setcgram.p1 ${OBJECTDIR}/_ext/1655177946/setddram.p1 ${OBJECTDIR}/_ext/1655177946/wcmdxlcd.p1 ${OBJECTDIR}/_ext/1655177946/writdata.p1 ${OBJECTDIR}/_ext/781772394/boutons.p1 ${OBJECTDIR}/_ext/781772394/affi.p1 ${OBJECTDIR}/_ext/1656130826/1wire.p1 ${OBJECTDIR}/_ext/781772394/Main.p1


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/1wire_usart.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F46K22
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1655634853/ftoa.p1: C:/Users/etu20261/Desktop/1wire+usart/ftoa/ftoa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655634853 
	@${RM} ${OBJECTDIR}/_ext/1655634853/ftoa.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655634853/ftoa.p1  C:/Users/etu20261/Desktop/1wire+usart/ftoa/ftoa.c 
	@-${MV} ${OBJECTDIR}/_ext/1655634853/ftoa.d ${OBJECTDIR}/_ext/1655634853/ftoa.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655634853/ftoa.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/busyxlcd.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/busyxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/busyxlcd.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/busyxlcd.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/busyxlcd.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/busyxlcd.d ${OBJECTDIR}/_ext/1655177946/busyxlcd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/busyxlcd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/openxlcd.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/openxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/openxlcd.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/openxlcd.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/openxlcd.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/openxlcd.d ${OBJECTDIR}/_ext/1655177946/openxlcd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/openxlcd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/putrxlcd.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/putrxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/putrxlcd.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/putrxlcd.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/putrxlcd.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/putrxlcd.d ${OBJECTDIR}/_ext/1655177946/putrxlcd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/putrxlcd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/putsxlcd.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/putsxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/putsxlcd.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/putsxlcd.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/putsxlcd.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/putsxlcd.d ${OBJECTDIR}/_ext/1655177946/putsxlcd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/putsxlcd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/readaddr.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/readaddr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/readaddr.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/readaddr.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/readaddr.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/readaddr.d ${OBJECTDIR}/_ext/1655177946/readaddr.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/readaddr.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/readdata.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/readdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/readdata.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/readdata.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/readdata.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/readdata.d ${OBJECTDIR}/_ext/1655177946/readdata.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/readdata.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/setcgram.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/setcgram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/setcgram.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/setcgram.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/setcgram.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/setcgram.d ${OBJECTDIR}/_ext/1655177946/setcgram.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/setcgram.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/setddram.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/setddram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/setddram.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/setddram.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/setddram.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/setddram.d ${OBJECTDIR}/_ext/1655177946/setddram.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/setddram.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/wcmdxlcd.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/wcmdxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/wcmdxlcd.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/wcmdxlcd.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/wcmdxlcd.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/wcmdxlcd.d ${OBJECTDIR}/_ext/1655177946/wcmdxlcd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/wcmdxlcd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/writdata.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/writdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/writdata.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/writdata.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/writdata.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/writdata.d ${OBJECTDIR}/_ext/1655177946/writdata.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/writdata.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/781772394/boutons.p1: C:/Users/etu20261/Desktop/1wire+usart/boutons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/781772394 
	@${RM} ${OBJECTDIR}/_ext/781772394/boutons.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/781772394/boutons.p1  C:/Users/etu20261/Desktop/1wire+usart/boutons.c 
	@-${MV} ${OBJECTDIR}/_ext/781772394/boutons.d ${OBJECTDIR}/_ext/781772394/boutons.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/781772394/boutons.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/781772394/affi.p1: C:/Users/etu20261/Desktop/1wire+usart/affi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/781772394 
	@${RM} ${OBJECTDIR}/_ext/781772394/affi.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/781772394/affi.p1  C:/Users/etu20261/Desktop/1wire+usart/affi.c 
	@-${MV} ${OBJECTDIR}/_ext/781772394/affi.d ${OBJECTDIR}/_ext/781772394/affi.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/781772394/affi.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1656130826/1wire.p1: C:/Users/etu20261/Desktop/1wire+usart/wire/1wire.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1656130826 
	@${RM} ${OBJECTDIR}/_ext/1656130826/1wire.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1656130826/1wire.p1  C:/Users/etu20261/Desktop/1wire+usart/wire/1wire.c 
	@-${MV} ${OBJECTDIR}/_ext/1656130826/1wire.d ${OBJECTDIR}/_ext/1656130826/1wire.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1656130826/1wire.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/781772394/Main.p1: C:/Users/etu20261/Desktop/1wire+usart/Main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/781772394 
	@${RM} ${OBJECTDIR}/_ext/781772394/Main.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/781772394/Main.p1  C:/Users/etu20261/Desktop/1wire+usart/Main.c 
	@-${MV} ${OBJECTDIR}/_ext/781772394/Main.d ${OBJECTDIR}/_ext/781772394/Main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/781772394/Main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/1655634853/ftoa.p1: C:/Users/etu20261/Desktop/1wire+usart/ftoa/ftoa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655634853 
	@${RM} ${OBJECTDIR}/_ext/1655634853/ftoa.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655634853/ftoa.p1  C:/Users/etu20261/Desktop/1wire+usart/ftoa/ftoa.c 
	@-${MV} ${OBJECTDIR}/_ext/1655634853/ftoa.d ${OBJECTDIR}/_ext/1655634853/ftoa.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655634853/ftoa.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/busyxlcd.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/busyxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/busyxlcd.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/busyxlcd.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/busyxlcd.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/busyxlcd.d ${OBJECTDIR}/_ext/1655177946/busyxlcd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/busyxlcd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/openxlcd.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/openxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/openxlcd.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/openxlcd.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/openxlcd.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/openxlcd.d ${OBJECTDIR}/_ext/1655177946/openxlcd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/openxlcd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/putrxlcd.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/putrxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/putrxlcd.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/putrxlcd.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/putrxlcd.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/putrxlcd.d ${OBJECTDIR}/_ext/1655177946/putrxlcd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/putrxlcd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/putsxlcd.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/putsxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/putsxlcd.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/putsxlcd.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/putsxlcd.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/putsxlcd.d ${OBJECTDIR}/_ext/1655177946/putsxlcd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/putsxlcd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/readaddr.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/readaddr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/readaddr.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/readaddr.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/readaddr.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/readaddr.d ${OBJECTDIR}/_ext/1655177946/readaddr.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/readaddr.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/readdata.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/readdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/readdata.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/readdata.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/readdata.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/readdata.d ${OBJECTDIR}/_ext/1655177946/readdata.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/readdata.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/setcgram.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/setcgram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/setcgram.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/setcgram.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/setcgram.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/setcgram.d ${OBJECTDIR}/_ext/1655177946/setcgram.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/setcgram.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/setddram.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/setddram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/setddram.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/setddram.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/setddram.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/setddram.d ${OBJECTDIR}/_ext/1655177946/setddram.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/setddram.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/wcmdxlcd.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/wcmdxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/wcmdxlcd.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/wcmdxlcd.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/wcmdxlcd.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/wcmdxlcd.d ${OBJECTDIR}/_ext/1655177946/wcmdxlcd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/wcmdxlcd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1655177946/writdata.p1: C:/Users/etu20261/Desktop/1wire+usart/XLCD/writdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1655177946 
	@${RM} ${OBJECTDIR}/_ext/1655177946/writdata.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1655177946/writdata.p1  C:/Users/etu20261/Desktop/1wire+usart/XLCD/writdata.c 
	@-${MV} ${OBJECTDIR}/_ext/1655177946/writdata.d ${OBJECTDIR}/_ext/1655177946/writdata.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1655177946/writdata.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/781772394/boutons.p1: C:/Users/etu20261/Desktop/1wire+usart/boutons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/781772394 
	@${RM} ${OBJECTDIR}/_ext/781772394/boutons.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/781772394/boutons.p1  C:/Users/etu20261/Desktop/1wire+usart/boutons.c 
	@-${MV} ${OBJECTDIR}/_ext/781772394/boutons.d ${OBJECTDIR}/_ext/781772394/boutons.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/781772394/boutons.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/781772394/affi.p1: C:/Users/etu20261/Desktop/1wire+usart/affi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/781772394 
	@${RM} ${OBJECTDIR}/_ext/781772394/affi.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/781772394/affi.p1  C:/Users/etu20261/Desktop/1wire+usart/affi.c 
	@-${MV} ${OBJECTDIR}/_ext/781772394/affi.d ${OBJECTDIR}/_ext/781772394/affi.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/781772394/affi.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1656130826/1wire.p1: C:/Users/etu20261/Desktop/1wire+usart/wire/1wire.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1656130826 
	@${RM} ${OBJECTDIR}/_ext/1656130826/1wire.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/1656130826/1wire.p1  C:/Users/etu20261/Desktop/1wire+usart/wire/1wire.c 
	@-${MV} ${OBJECTDIR}/_ext/1656130826/1wire.d ${OBJECTDIR}/_ext/1656130826/1wire.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1656130826/1wire.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/781772394/Main.p1: C:/Users/etu20261/Desktop/1wire+usart/Main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/781772394 
	@${RM} ${OBJECTDIR}/_ext/781772394/Main.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/_ext/781772394/Main.p1  C:/Users/etu20261/Desktop/1wire+usart/Main.c 
	@-${MV} ${OBJECTDIR}/_ext/781772394/Main.d ${OBJECTDIR}/_ext/781772394/Main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/781772394/Main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/1wire_usart.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G --asmlist -mdist/${CND_CONF}/${IMAGE_TYPE}/1wire_usart.${IMAGE_TYPE}.map  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"      -odist/${CND_CONF}/${IMAGE_TYPE}/1wire_usart.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/1wire_usart.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/1wire_usart.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G --asmlist -mdist/${CND_CONF}/${IMAGE_TYPE}/1wire_usart.${IMAGE_TYPE}.map  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug --addrqual=ignore --mode=free -P -N255 -I"C:/Users/etu20261/Desktop/1wire+usart" --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"   -odist/${CND_CONF}/${IMAGE_TYPE}/1wire_usart.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
