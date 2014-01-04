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
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Final0.2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Final0.2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ftoa/ftoa.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/1wire.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/affi.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/boutons.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/usart.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/busyxlcd.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/openxlcd.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/putrxlcd.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/putsxlcd.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/readaddr.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/readdata.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/setcgram.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/setddram.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/wcmdxlcd.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/writdata.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Main.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TIMERS.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TIOS.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ARP.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Announce.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/DNS.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Delay.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ENC28J60.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Helpers.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ICMP.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/IP.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/StackTsk.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TCP.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TCPPerformanceTest.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Tick.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/UDP.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/UDPPerformanceTest.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1750936599/ftoa.o ${OBJECTDIR}/_ext/1249647725/1wire.o ${OBJECTDIR}/_ext/1249647725/affi.o ${OBJECTDIR}/_ext/1249647725/boutons.o ${OBJECTDIR}/_ext/1249647725/usart.o ${OBJECTDIR}/_ext/1751393506/busyxlcd.o ${OBJECTDIR}/_ext/1751393506/openxlcd.o ${OBJECTDIR}/_ext/1751393506/putrxlcd.o ${OBJECTDIR}/_ext/1751393506/putsxlcd.o ${OBJECTDIR}/_ext/1751393506/readaddr.o ${OBJECTDIR}/_ext/1751393506/readdata.o ${OBJECTDIR}/_ext/1751393506/setcgram.o ${OBJECTDIR}/_ext/1751393506/setddram.o ${OBJECTDIR}/_ext/1751393506/wcmdxlcd.o ${OBJECTDIR}/_ext/1751393506/writdata.o ${OBJECTDIR}/_ext/1483207590/Main.o ${OBJECTDIR}/_ext/1483207590/TIMERS.o ${OBJECTDIR}/_ext/1483207590/TIOS.o ${OBJECTDIR}/_ext/1483207590/ARP.o ${OBJECTDIR}/_ext/1483207590/Announce.o ${OBJECTDIR}/_ext/1483207590/DNS.o ${OBJECTDIR}/_ext/1483207590/Delay.o ${OBJECTDIR}/_ext/1483207590/ENC28J60.o ${OBJECTDIR}/_ext/1483207590/Helpers.o ${OBJECTDIR}/_ext/1483207590/ICMP.o ${OBJECTDIR}/_ext/1483207590/IP.o ${OBJECTDIR}/_ext/1483207590/StackTsk.o ${OBJECTDIR}/_ext/1483207590/TCP.o ${OBJECTDIR}/_ext/1483207590/TCPPerformanceTest.o ${OBJECTDIR}/_ext/1483207590/Tick.o ${OBJECTDIR}/_ext/1483207590/UDP.o ${OBJECTDIR}/_ext/1483207590/UDPPerformanceTest.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1750936599/ftoa.o.d ${OBJECTDIR}/_ext/1249647725/1wire.o.d ${OBJECTDIR}/_ext/1249647725/affi.o.d ${OBJECTDIR}/_ext/1249647725/boutons.o.d ${OBJECTDIR}/_ext/1249647725/usart.o.d ${OBJECTDIR}/_ext/1751393506/busyxlcd.o.d ${OBJECTDIR}/_ext/1751393506/openxlcd.o.d ${OBJECTDIR}/_ext/1751393506/putrxlcd.o.d ${OBJECTDIR}/_ext/1751393506/putsxlcd.o.d ${OBJECTDIR}/_ext/1751393506/readaddr.o.d ${OBJECTDIR}/_ext/1751393506/readdata.o.d ${OBJECTDIR}/_ext/1751393506/setcgram.o.d ${OBJECTDIR}/_ext/1751393506/setddram.o.d ${OBJECTDIR}/_ext/1751393506/wcmdxlcd.o.d ${OBJECTDIR}/_ext/1751393506/writdata.o.d ${OBJECTDIR}/_ext/1483207590/Main.o.d ${OBJECTDIR}/_ext/1483207590/TIMERS.o.d ${OBJECTDIR}/_ext/1483207590/TIOS.o.d ${OBJECTDIR}/_ext/1483207590/ARP.o.d ${OBJECTDIR}/_ext/1483207590/Announce.o.d ${OBJECTDIR}/_ext/1483207590/DNS.o.d ${OBJECTDIR}/_ext/1483207590/Delay.o.d ${OBJECTDIR}/_ext/1483207590/ENC28J60.o.d ${OBJECTDIR}/_ext/1483207590/Helpers.o.d ${OBJECTDIR}/_ext/1483207590/ICMP.o.d ${OBJECTDIR}/_ext/1483207590/IP.o.d ${OBJECTDIR}/_ext/1483207590/StackTsk.o.d ${OBJECTDIR}/_ext/1483207590/TCP.o.d ${OBJECTDIR}/_ext/1483207590/TCPPerformanceTest.o.d ${OBJECTDIR}/_ext/1483207590/Tick.o.d ${OBJECTDIR}/_ext/1483207590/UDP.o.d ${OBJECTDIR}/_ext/1483207590/UDPPerformanceTest.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1750936599/ftoa.o ${OBJECTDIR}/_ext/1249647725/1wire.o ${OBJECTDIR}/_ext/1249647725/affi.o ${OBJECTDIR}/_ext/1249647725/boutons.o ${OBJECTDIR}/_ext/1249647725/usart.o ${OBJECTDIR}/_ext/1751393506/busyxlcd.o ${OBJECTDIR}/_ext/1751393506/openxlcd.o ${OBJECTDIR}/_ext/1751393506/putrxlcd.o ${OBJECTDIR}/_ext/1751393506/putsxlcd.o ${OBJECTDIR}/_ext/1751393506/readaddr.o ${OBJECTDIR}/_ext/1751393506/readdata.o ${OBJECTDIR}/_ext/1751393506/setcgram.o ${OBJECTDIR}/_ext/1751393506/setddram.o ${OBJECTDIR}/_ext/1751393506/wcmdxlcd.o ${OBJECTDIR}/_ext/1751393506/writdata.o ${OBJECTDIR}/_ext/1483207590/Main.o ${OBJECTDIR}/_ext/1483207590/TIMERS.o ${OBJECTDIR}/_ext/1483207590/TIOS.o ${OBJECTDIR}/_ext/1483207590/ARP.o ${OBJECTDIR}/_ext/1483207590/Announce.o ${OBJECTDIR}/_ext/1483207590/DNS.o ${OBJECTDIR}/_ext/1483207590/Delay.o ${OBJECTDIR}/_ext/1483207590/ENC28J60.o ${OBJECTDIR}/_ext/1483207590/Helpers.o ${OBJECTDIR}/_ext/1483207590/ICMP.o ${OBJECTDIR}/_ext/1483207590/IP.o ${OBJECTDIR}/_ext/1483207590/StackTsk.o ${OBJECTDIR}/_ext/1483207590/TCP.o ${OBJECTDIR}/_ext/1483207590/TCPPerformanceTest.o ${OBJECTDIR}/_ext/1483207590/Tick.o ${OBJECTDIR}/_ext/1483207590/UDP.o ${OBJECTDIR}/_ext/1483207590/UDPPerformanceTest.o

# Source Files
SOURCEFILES=C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ftoa/ftoa.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/1wire.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/affi.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/boutons.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/usart.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/busyxlcd.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/openxlcd.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/putrxlcd.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/putsxlcd.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/readaddr.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/readdata.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/setcgram.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/setddram.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/wcmdxlcd.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/writdata.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Main.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TIMERS.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TIOS.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ARP.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Announce.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/DNS.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Delay.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ENC28J60.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Helpers.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ICMP.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/IP.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/StackTsk.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TCP.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TCPPerformanceTest.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Tick.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/UDP.c C:/Users/AkenOo/MPLABXProjects/Final0.2.X/UDPPerformanceTest.c


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
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Final0.2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F46K22
MP_PROCESSOR_OPTION_LD=18f46k22
MP_LINKER_DEBUG_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1750936599/ftoa.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ftoa/ftoa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1750936599 
	@${RM} ${OBJECTDIR}/_ext/1750936599/ftoa.o.d 
	@${RM} ${OBJECTDIR}/_ext/1750936599/ftoa.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1750936599/ftoa.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ftoa/ftoa.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1750936599/ftoa.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1750936599/ftoa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1249647725/1wire.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/1wire.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1249647725 
	@${RM} ${OBJECTDIR}/_ext/1249647725/1wire.o.d 
	@${RM} ${OBJECTDIR}/_ext/1249647725/1wire.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1249647725/1wire.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/1wire.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1249647725/1wire.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1249647725/1wire.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1249647725/affi.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/affi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1249647725 
	@${RM} ${OBJECTDIR}/_ext/1249647725/affi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1249647725/affi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1249647725/affi.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/affi.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1249647725/affi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1249647725/affi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1249647725/boutons.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/boutons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1249647725 
	@${RM} ${OBJECTDIR}/_ext/1249647725/boutons.o.d 
	@${RM} ${OBJECTDIR}/_ext/1249647725/boutons.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1249647725/boutons.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/boutons.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1249647725/boutons.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1249647725/boutons.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1249647725/usart.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1249647725 
	@${RM} ${OBJECTDIR}/_ext/1249647725/usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1249647725/usart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1249647725/usart.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/usart.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1249647725/usart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1249647725/usart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/busyxlcd.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/busyxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/busyxlcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/busyxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/busyxlcd.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/busyxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/busyxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/busyxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/openxlcd.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/openxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/openxlcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/openxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/openxlcd.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/openxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/openxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/openxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/putrxlcd.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/putrxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/putrxlcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/putrxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/putrxlcd.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/putrxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/putrxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/putrxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/putsxlcd.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/putsxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/putsxlcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/putsxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/putsxlcd.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/putsxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/putsxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/putsxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/readaddr.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/readaddr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/readaddr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/readaddr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/readaddr.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/readaddr.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/readaddr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/readaddr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/readdata.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/readdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/readdata.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/readdata.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/readdata.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/readdata.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/readdata.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/readdata.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/setcgram.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/setcgram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/setcgram.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/setcgram.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/setcgram.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/setcgram.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/setcgram.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/setcgram.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/setddram.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/setddram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/setddram.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/setddram.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/setddram.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/setddram.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/setddram.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/setddram.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/wcmdxlcd.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/wcmdxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/wcmdxlcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/wcmdxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/wcmdxlcd.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/wcmdxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/wcmdxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/wcmdxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/writdata.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/writdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/writdata.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/writdata.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/writdata.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/writdata.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/writdata.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/writdata.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/Main.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/Main.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Main.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/Main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/Main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/TIMERS.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TIMERS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/TIMERS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/TIMERS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/TIMERS.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TIMERS.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/TIMERS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/TIMERS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/TIOS.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TIOS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/TIOS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/TIOS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/TIOS.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TIOS.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/TIOS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/TIOS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/ARP.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ARP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/ARP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/ARP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/ARP.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ARP.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/ARP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/ARP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/Announce.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Announce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Announce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Announce.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/Announce.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Announce.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/Announce.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/Announce.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/DNS.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/DNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/DNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/DNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/DNS.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/DNS.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/DNS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/DNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/Delay.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/Delay.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Delay.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/Delay.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/Delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/ENC28J60.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ENC28J60.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/ENC28J60.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/ENC28J60.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/ENC28J60.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ENC28J60.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/ENC28J60.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/ENC28J60.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/Helpers.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Helpers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Helpers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/Helpers.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Helpers.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/Helpers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/Helpers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/ICMP.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ICMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/ICMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/ICMP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/ICMP.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ICMP.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/ICMP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/ICMP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/IP.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/IP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/IP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/IP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/IP.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/IP.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/IP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/IP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/StackTsk.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/StackTsk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/StackTsk.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/StackTsk.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/StackTsk.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/StackTsk.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/StackTsk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/TCP.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/TCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/TCP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/TCP.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TCP.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/TCP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/TCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/TCPPerformanceTest.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TCPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/TCPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/TCPPerformanceTest.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/TCPPerformanceTest.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TCPPerformanceTest.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/TCPPerformanceTest.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/TCPPerformanceTest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/Tick.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Tick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/Tick.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Tick.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/Tick.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/Tick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/UDP.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/UDP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/UDP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/UDP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/UDP.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/UDP.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/UDP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/UDP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/UDPPerformanceTest.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/UDPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/UDPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/UDPPerformanceTest.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/UDPPerformanceTest.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/UDPPerformanceTest.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/UDPPerformanceTest.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/UDPPerformanceTest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
else
${OBJECTDIR}/_ext/1750936599/ftoa.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ftoa/ftoa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1750936599 
	@${RM} ${OBJECTDIR}/_ext/1750936599/ftoa.o.d 
	@${RM} ${OBJECTDIR}/_ext/1750936599/ftoa.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1750936599/ftoa.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ftoa/ftoa.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1750936599/ftoa.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1750936599/ftoa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1249647725/1wire.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/1wire.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1249647725 
	@${RM} ${OBJECTDIR}/_ext/1249647725/1wire.o.d 
	@${RM} ${OBJECTDIR}/_ext/1249647725/1wire.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1249647725/1wire.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/1wire.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1249647725/1wire.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1249647725/1wire.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1249647725/affi.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/affi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1249647725 
	@${RM} ${OBJECTDIR}/_ext/1249647725/affi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1249647725/affi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1249647725/affi.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/affi.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1249647725/affi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1249647725/affi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1249647725/boutons.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/boutons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1249647725 
	@${RM} ${OBJECTDIR}/_ext/1249647725/boutons.o.d 
	@${RM} ${OBJECTDIR}/_ext/1249647725/boutons.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1249647725/boutons.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/boutons.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1249647725/boutons.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1249647725/boutons.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1249647725/usart.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1249647725 
	@${RM} ${OBJECTDIR}/_ext/1249647725/usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1249647725/usart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1249647725/usart.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/periph/usart.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1249647725/usart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1249647725/usart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/busyxlcd.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/busyxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/busyxlcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/busyxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/busyxlcd.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/busyxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/busyxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/busyxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/openxlcd.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/openxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/openxlcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/openxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/openxlcd.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/openxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/openxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/openxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/putrxlcd.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/putrxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/putrxlcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/putrxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/putrxlcd.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/putrxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/putrxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/putrxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/putsxlcd.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/putsxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/putsxlcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/putsxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/putsxlcd.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/putsxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/putsxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/putsxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/readaddr.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/readaddr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/readaddr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/readaddr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/readaddr.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/readaddr.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/readaddr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/readaddr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/readdata.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/readdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/readdata.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/readdata.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/readdata.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/readdata.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/readdata.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/readdata.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/setcgram.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/setcgram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/setcgram.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/setcgram.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/setcgram.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/setcgram.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/setcgram.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/setcgram.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/setddram.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/setddram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/setddram.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/setddram.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/setddram.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/setddram.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/setddram.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/setddram.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/wcmdxlcd.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/wcmdxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/wcmdxlcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/wcmdxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/wcmdxlcd.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/wcmdxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/wcmdxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/wcmdxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1751393506/writdata.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/writdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1751393506 
	@${RM} ${OBJECTDIR}/_ext/1751393506/writdata.o.d 
	@${RM} ${OBJECTDIR}/_ext/1751393506/writdata.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1751393506/writdata.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/XLCD/writdata.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1751393506/writdata.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1751393506/writdata.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/Main.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/Main.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Main.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/Main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/Main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/TIMERS.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TIMERS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/TIMERS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/TIMERS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/TIMERS.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TIMERS.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/TIMERS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/TIMERS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/TIOS.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TIOS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/TIOS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/TIOS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/TIOS.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TIOS.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/TIOS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/TIOS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/ARP.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ARP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/ARP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/ARP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/ARP.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ARP.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/ARP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/ARP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/Announce.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Announce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Announce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Announce.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/Announce.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Announce.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/Announce.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/Announce.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/DNS.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/DNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/DNS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/DNS.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/DNS.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/DNS.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/DNS.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/DNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/Delay.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/Delay.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Delay.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/Delay.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/Delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/ENC28J60.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ENC28J60.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/ENC28J60.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/ENC28J60.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/ENC28J60.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ENC28J60.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/ENC28J60.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/ENC28J60.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/Helpers.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Helpers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Helpers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/Helpers.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Helpers.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/Helpers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/Helpers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/ICMP.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ICMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/ICMP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/ICMP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/ICMP.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/ICMP.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/ICMP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/ICMP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/IP.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/IP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/IP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/IP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/IP.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/IP.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/IP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/IP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/StackTsk.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/StackTsk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/StackTsk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/StackTsk.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/StackTsk.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/StackTsk.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/StackTsk.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/StackTsk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/TCP.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/TCP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/TCP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/TCP.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TCP.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/TCP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/TCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/TCPPerformanceTest.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TCPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/TCPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/TCPPerformanceTest.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/TCPPerformanceTest.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/TCPPerformanceTest.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/TCPPerformanceTest.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/TCPPerformanceTest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/Tick.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Tick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Tick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/Tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/Tick.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/Tick.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/Tick.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/Tick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/UDP.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/UDP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/UDP.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/UDP.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/UDP.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/UDP.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/UDP.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/UDP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1483207590/UDPPerformanceTest.o: C:/Users/AkenOo/MPLABXProjects/Final0.2.X/UDPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1483207590 
	@${RM} ${OBJECTDIR}/_ext/1483207590/UDPPerformanceTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1483207590/UDPPerformanceTest.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1483207590/UDPPerformanceTest.o   C:/Users/AkenOo/MPLABXProjects/Final0.2.X/UDPPerformanceTest.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1483207590/UDPPerformanceTest.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1483207590/UDPPerformanceTest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Final0.2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION_LD)  -w -x -u_DEBUG -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"  -z__MPLAB_BUILD=1  -u_CRUNTIME -z__MPLAB_DEBUG=1 -z__MPLAB_DEBUGGER_ICD3=1 $(MP_LINKER_DEBUG_OPTION) -l ${MP_CC_DIR}\\..\\lib  -o dist/${CND_CONF}/${IMAGE_TYPE}/Final0.2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}   
else
dist/${CND_CONF}/${IMAGE_TYPE}/Final0.2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION_LD)  -w  -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"  -z__MPLAB_BUILD=1  -u_CRUNTIME -l ${MP_CC_DIR}\\..\\lib  -o dist/${CND_CONF}/${IMAGE_TYPE}/Final0.2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}   
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
