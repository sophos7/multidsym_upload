#!/bin/bash

### HOW TO USE ###
# NOTE: App Names with spaces must be wrapped in quotes
#
# Run script with following variable
# 		./multidsym_upload.sh "App Name" AppKeyNumber FolderWithDSYMs

### Mostly static variables ###
ZIP="/usr/bin/zip --recurse-paths --quiet"
URL="https://mobile-symbol-upload.newrelic.com/symbol"
LOGFILE="/tmp/upload_dSYM_log.txt"

### Variables from command line ###
APPNAME=$1
APPKEY=$2
DSYMDIR=$3
DSYM="empty"
BUILDID="build uuid"

### Functions for this script ###

### Print message when there are not enough values passed or they are wrong in some way
function invalidEntry(){
	echo "You must enter the following values:
	App Name
	App Token
	Folder of dSYMs"

	exit 0
}

function logBuildId(){
	echo "Build UUID = ${BUILDID}" >> ${LOGFILE}
}

function logFile(){
	echo "\$ $@" >> ${LOGFILE}; "$@" ;
}

### Validate these values a bit
if [[ ${APPNAME} == "" || ${APPKEY} == "" || ${#APPKEY} < 42 || ${DSYMDIR} == "" ]]; then
	invalidEntry
fi

### Open log file with date and time
date > ${LOGFILE}

### Loop through given directory to process each dSYM
find ${DSYMDIR} -type d -name '*.dSYM' -print0 | while IFS= read -r -d '' DSYM; do
	logFile echo "File to process" ${DSYM}
	BUILDID=`xcrun dwarfdump --uuid "${DSYM}" | tr '[:upper:]' '[:lower:]' | tr -d '-'| awk '{print $2}' | xargs | sed 's/ /,/g'`
	logBuildId
	logFile ${ZIP} /tmp/${BUILDID:0:32}.zip "${DSYM}"
	logFile curl -F dsym=@"/tmp/${BUILDID}.zip" -F buildId="${BUILDID}" -F appName="${APPNAME}" -H "X-APP-LICENSE-KEY: ${APPKEY}" ${URL}
	logFile rm /tmp/${BUILDID:0:32}.zip
done

exit 0