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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/MPLABXProjects.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/MPLABXProjects.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/Main.o ${OBJECTDIR}/affi.o ${OBJECTDIR}/boutons.o ${OBJECTDIR}/XLCD/readaddr.o ${OBJECTDIR}/XLCD/readdata.o ${OBJECTDIR}/XLCD/setcgram.o ${OBJECTDIR}/XLCD/setddram.o ${OBJECTDIR}/XLCD/wcmdxlcd.o ${OBJECTDIR}/XLCD/writdata.o ${OBJECTDIR}/wire/1wire.o ${OBJECTDIR}/ftoa/ftoa.o
POSSIBLE_DEPFILES=${OBJECTDIR}/Main.o.d ${OBJECTDIR}/affi.o.d ${OBJECTDIR}/boutons.o.d ${OBJECTDIR}/XLCD/readaddr.o.d ${OBJECTDIR}/XLCD/readdata.o.d ${OBJECTDIR}/XLCD/setcgram.o.d ${OBJECTDIR}/XLCD/setddram.o.d ${OBJECTDIR}/XLCD/wcmdxlcd.o.d ${OBJECTDIR}/XLCD/writdata.o.d ${OBJECTDIR}/wire/1wire.o.d ${OBJECTDIR}/ftoa/ftoa.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/Main.o ${OBJECTDIR}/affi.o ${OBJECTDIR}/boutons.o ${OBJECTDIR}/XLCD/readaddr.o ${OBJECTDIR}/XLCD/readdata.o ${OBJECTDIR}/XLCD/setcgram.o ${OBJECTDIR}/XLCD/setddram.o ${OBJECTDIR}/XLCD/wcmdxlcd.o ${OBJECTDIR}/XLCD/writdata.o ${OBJECTDIR}/wire/1wire.o ${OBJECTDIR}/ftoa/ftoa.o


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
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/MPLABXProjects.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/Main.o: Main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/Main.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG  -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/Main.o   Main.c 
	@${DEP_GEN} -d ${OBJECTDIR}/Main.o 
	@${FIXDEPS} "${OBJECTDIR}/Main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/affi.o: affi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/affi.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG  -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/affi.o   affi.c 
	@${DEP_GEN} -d ${OBJECTDIR}/affi.o 
	@${FIXDEPS} "${OBJECTDIR}/affi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/boutons.o: boutons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/boutons.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG  -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/boutons.o   boutons.c 
	@${DEP_GEN} -d ${OBJECTDIR}/boutons.o 
	@${FIXDEPS} "${OBJECTDIR}/boutons.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/XLCD/readaddr.o: XLCD/readaddr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/XLCD 
	@${RM} ${OBJECTDIR}/XLCD/readaddr.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG  -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/XLCD/readaddr.o   XLCD/readaddr.c 
	@${DEP_GEN} -d ${OBJECTDIR}/XLCD/readaddr.o 
	@${FIXDEPS} "${OBJECTDIR}/XLCD/readaddr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/XLCD/readdata.o: XLCD/readdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/XLCD 
	@${RM} ${OBJECTDIR}/XLCD/readdata.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG  -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/XLCD/readdata.o   XLCD/readdata.c 
	@${DEP_GEN} -d ${OBJECTDIR}/XLCD/readdata.o 
	@${FIXDEPS} "${OBJECTDIR}/XLCD/readdata.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/XLCD/setcgram.o: XLCD/setcgram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/XLCD 
	@${RM} ${OBJECTDIR}/XLCD/setcgram.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG  -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/XLCD/setcgram.o   XLCD/setcgram.c 
	@${DEP_GEN} -d ${OBJECTDIR}/XLCD/setcgram.o 
	@${FIXDEPS} "${OBJECTDIR}/XLCD/setcgram.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/XLCD/setddram.o: XLCD/setddram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/XLCD 
	@${RM} ${OBJECTDIR}/XLCD/setddram.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG  -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/XLCD/setddram.o   XLCD/setddram.c 
	@${DEP_GEN} -d ${OBJECTDIR}/XLCD/setddram.o 
	@${FIXDEPS} "${OBJECTDIR}/XLCD/setddram.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/XLCD/wcmdxlcd.o: XLCD/wcmdxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/XLCD 
	@${RM} ${OBJECTDIR}/XLCD/wcmdxlcd.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG  -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/XLCD/wcmdxlcd.o   XLCD/wcmdxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/XLCD/wcmdxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/XLCD/wcmdxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/XLCD/writdata.o: XLCD/writdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/XLCD 
	@${RM} ${OBJECTDIR}/XLCD/writdata.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG  -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/XLCD/writdata.o   XLCD/writdata.c 
	@${DEP_GEN} -d ${OBJECTDIR}/XLCD/writdata.o 
	@${FIXDEPS} "${OBJECTDIR}/XLCD/writdata.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/wire/1wire.o: wire/1wire.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/wire 
	@${RM} ${OBJECTDIR}/wire/1wire.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG  -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/wire/1wire.o   wire/1wire.c 
	@${DEP_GEN} -d ${OBJECTDIR}/wire/1wire.o 
	@${FIXDEPS} "${OBJECTDIR}/wire/1wire.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/ftoa/ftoa.o: ftoa/ftoa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/ftoa 
	@${RM} ${OBJECTDIR}/ftoa/ftoa.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG  -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/ftoa/ftoa.o   ftoa/ftoa.c 
	@${DEP_GEN} -d ${OBJECTDIR}/ftoa/ftoa.o 
	@${FIXDEPS} "${OBJECTDIR}/ftoa/ftoa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
else
${OBJECTDIR}/Main.o: Main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/Main.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/Main.o   Main.c 
	@${DEP_GEN} -d ${OBJECTDIR}/Main.o 
	@${FIXDEPS} "${OBJECTDIR}/Main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/affi.o: affi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/affi.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/affi.o   affi.c 
	@${DEP_GEN} -d ${OBJECTDIR}/affi.o 
	@${FIXDEPS} "${OBJECTDIR}/affi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/boutons.o: boutons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/boutons.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/boutons.o   boutons.c 
	@${DEP_GEN} -d ${OBJECTDIR}/boutons.o 
	@${FIXDEPS} "${OBJECTDIR}/boutons.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/XLCD/readaddr.o: XLCD/readaddr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/XLCD 
	@${RM} ${OBJECTDIR}/XLCD/readaddr.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/XLCD/readaddr.o   XLCD/readaddr.c 
	@${DEP_GEN} -d ${OBJECTDIR}/XLCD/readaddr.o 
	@${FIXDEPS} "${OBJECTDIR}/XLCD/readaddr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/XLCD/readdata.o: XLCD/readdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/XLCD 
	@${RM} ${OBJECTDIR}/XLCD/readdata.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/XLCD/readdata.o   XLCD/readdata.c 
	@${DEP_GEN} -d ${OBJECTDIR}/XLCD/readdata.o 
	@${FIXDEPS} "${OBJECTDIR}/XLCD/readdata.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/XLCD/setcgram.o: XLCD/setcgram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/XLCD 
	@${RM} ${OBJECTDIR}/XLCD/setcgram.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/XLCD/setcgram.o   XLCD/setcgram.c 
	@${DEP_GEN} -d ${OBJECTDIR}/XLCD/setcgram.o 
	@${FIXDEPS} "${OBJECTDIR}/XLCD/setcgram.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/XLCD/setddram.o: XLCD/setddram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/XLCD 
	@${RM} ${OBJECTDIR}/XLCD/setddram.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/XLCD/setddram.o   XLCD/setddram.c 
	@${DEP_GEN} -d ${OBJECTDIR}/XLCD/setddram.o 
	@${FIXDEPS} "${OBJECTDIR}/XLCD/setddram.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/XLCD/wcmdxlcd.o: XLCD/wcmdxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/XLCD 
	@${RM} ${OBJECTDIR}/XLCD/wcmdxlcd.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/XLCD/wcmdxlcd.o   XLCD/wcmdxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/XLCD/wcmdxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/XLCD/wcmdxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/XLCD/writdata.o: XLCD/writdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/XLCD 
	@${RM} ${OBJECTDIR}/XLCD/writdata.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/XLCD/writdata.o   XLCD/writdata.c 
	@${DEP_GEN} -d ${OBJECTDIR}/XLCD/writdata.o 
	@${FIXDEPS} "${OBJECTDIR}/XLCD/writdata.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/wire/1wire.o: wire/1wire.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/wire 
	@${RM} ${OBJECTDIR}/wire/1wire.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/wire/1wire.o   wire/1wire.c 
	@${DEP_GEN} -d ${OBJECTDIR}/wire/1wire.o 
	@${FIXDEPS} "${OBJECTDIR}/wire/1wire.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/ftoa/ftoa.o: ftoa/ftoa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/ftoa 
	@${RM} ${OBJECTDIR}/ftoa/ftoa.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION)   -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/ftoa/ftoa.o   ftoa/ftoa.c 
	@${DEP_GEN} -d ${OBJECTDIR}/ftoa/ftoa.o 
	@${FIXDEPS} "${OBJECTDIR}/ftoa/ftoa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/MPLABXProjects.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION_LD)  -w -x -u_DEBUG   -z__MPLAB_BUILD=1  -u_CRUNTIME -z__MPLAB_DEBUG=1 $(MP_LINKER_DEBUG_OPTION) -l ${MP_CC_DIR}\\..\\lib  -o dist/${CND_CONF}/${IMAGE_TYPE}/MPLABXProjects.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}   
else
dist/${CND_CONF}/${IMAGE_TYPE}/MPLABXProjects.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION_LD)  -w    -z__MPLAB_BUILD=1  -u_CRUNTIME -l ${MP_CC_DIR}\\..\\lib  -o dist/${CND_CONF}/${IMAGE_TYPE}/MPLABXProjects.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}   
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
