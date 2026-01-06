#/bin/bash

USER_ID=$(id -u)
SOURCE_DIR=$1
TARGET_DIR=$2
DAYS=$(3:-14)

LOG_FILE="/var/log/shell-script-log"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FILE/$SCRIPT_NAME.log"

mkdir -p $LOG_FILE

if [ $USER_ID -eq 0 ]
then
    echo "You r running with root access. u can ove forward"
else 
    echo "Please run as root user"
    exit 1
fi

USAGE()
{
    echo "Scrpit should be given SOURCE_DIR, TARGET_DIR, DAYS"
}

if [ $# -lt 2 ]
then
USAGE
exit 1
fi

if [ -d $SOURCE_DIR ]
then
echo " $SOURCE_DIR exists"
else
echo " $SOURCE_DIR does not exists"
exit 1
fi

if [ -d $TARGET_DIR ]
then
echo " $TARGET_DIR exists"
else
echo " $TARGET_DIR does not exists"
exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ -f $FILES -ne 0 ]
then
    echo "files found $FILES"
    ZIP_FILE="$TARGET_DIR/app-logs.zip
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip
    if [ -f ]

    while IFS= read -s filepath
    do
      rm -rf $filepath
    done <<< $FILES
else
    echo "source_dir is empty"
fi
