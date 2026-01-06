#!/bin/bash

USER_ID=$(id -u)
SOURCE_DIR=$1
TARGET_DIR=$2
DAYS=${3:-14}

LOG_FOLDER="/var/log/shell-script-log"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER

if [ $USER_ID -eq 0 ]
then
    echo "You r running with root access. u can move forward" | tee -a $LOG_FILE
else 
    echo "Please run as root user" | tee -a $LOG_FILE
    exit 1
fi

USAGE()
{
    echo "Scrpit should be given SOURCE_DIR, TARGET_DIR, DAYS" | tee -a $LOG_FILE
    exit 1
}

if [ $# -lt 2 ]
then
USAGE
fi

if [ -d "$SOURCE_DIR" ]
then
echo " $SOURCE_DIR exists" | tee -a $LOG_FILE
else
echo " $SOURCE_DIR does not exists" | tee -a $LOG_FILE
exit 1
fi

if [ -d "$TARGET_DIR" ]
then
echo " $TARGET_DIR exists" | tee -a $LOG_FILE
else
echo " $TARGET_DIR does not exists" | tee -a $LOG_FILE
exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ ! -z "$FILES"  ]
then
    echo "files found $FILES" | tee -a $LOG_FILE
    ZIP_FILE="$TARGET_DIR/app-logs.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"

    if [ -f $ZIP_FILE ]
    then
    echo "logfiles are zipped succesfully" | tee -a $LOG_FILE
    while IFS= read -r filepath
    do
    echo "deleting file $filepath" | tee -a $LOG_FILE
    rm -rf "$filepath"
    done <<< $FILES
    echo "files older than $DAYS are successfully removed" | tee -a $LOG_FILE
    else 
    echo "zipping logfiles is failure" | tee -a $LOG_FILE
    exit 1
    fi

else
    echo "source_dir is empty" | tee -a $LOG_FILE
fi
