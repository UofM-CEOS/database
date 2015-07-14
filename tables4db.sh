#! /bin/sh
# Author: Sebastian Luque
# Created: 2014-08-28T22:17:42+0000
# Last-Updated: 2015-07-14T19:43:07+0000
#           By: Sebastian P. Luque
# -------------------------------------------------------------------------
# Commentary: 
#
# Prepare data for loading onto database.
# -------------------------------------------------------------------------
# Code:

ROOTDIR=~/Data/Statoil/2015
NAV=${ROOTDIR}/NAV/Ship
MET=${ROOTDIR}/MET
MET_AAVOS=${MET}/AAVOS
# UNDERWAY=${ROOTDIR}/UW_pCO2
RAD=${ROOTDIR}/RAD
# FLUX=${ROOTDIR}/Flux
# FLUX_AVG=${FLUX}/IRGA
LOGFILE1=${ROOTDIR}/Logs/closed_path_log.csv
LOGFILE2=${ROOTDIR}/Logs/met_log.csv
LOGFILE3=${ROOTDIR}/Logs/complete_tower_log.csv
AWKPATH=/usr/local/src/awk

./nav_proc4db.awk ${NAV}/NAV_*.int | \
    awk -F, '!x[$1]++' > ${NAV}/navproc_all.csv
AWKPATH=${AWKPATH} ./met4db.awk ${MET}/*.dat | \
    awk -F, '!x[$1]++' > ${MET}/MET_all.csv
AWKPATH=${AWKPATH} ./AAVOS_proc4db.awk ${MET_AAVOS}/*.int | \
    awk -F, '!x[$1]++' > ${MET_AAVOS}/AAVOS_all.csv
# ./underway4db.awk ${UNDERWAY}/*.txt | \
#     awk '!x[$0]++' > ${UNDERWAY}/AMD_2010.csv
# ./underway4db_misc.awk ${UWTEMPERATURE}/* | \
#     awk '!x[$0]++' > ${UNDERWAY}/AMD_water_temperature_2014.csv
AWKPATH=${AWKPATH} ./rad4db.awk ${RAD}/*.dat | \
    awk '!x[$0]++' > ${RAD}/rad_all.csv
# AWKPATH=${AWKPATH} ./ec_avg_4db_amundsen_flux.awk ${FLUX_AVG}/*.dat | \
#     awk -F, '!x[$1]++' > ${FLUX_AVG}/flux_avg.csv
# AWKPATH=${AWKPATH} ./ec4db_amundsen_flux.awk ${FLUX}/*.dat | \
#     awk -F, '!x[$1]++' > ${FLUX}/flux.csv
# ./observer_log_4db.awk ${LOGFILE1} > $(dirname ${LOGFILE1})/closed_path_log_4db.csv
# ./observer_log_4db.awk ${LOGFILE2} > $(dirname ${LOGFILE2})/metlog_4db.csv
# ./observer_log_4db.awk ${LOGFILE3} > $(dirname ${LOGFILE3})/towerlog_4db.csv

# # Split based on program version (only EC in this year)
# ./split_progversion.awk -v PROGCOL=2 ${FLUX}/flux.csv
# ./split_progversion.awk -v PROGCOL=2 ${FLUX_AVG}/flux_avg.csv



#_* Emacs local variables
# Local variables:
# allout-layout: (1 + : 0)
# End:
