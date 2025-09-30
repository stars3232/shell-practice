#!/bin/bash

userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shellscript_logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python3" "nginx" "httpd")

mkdir -p $LOG_FOLDER
echo "Script started executing at $(date)" | tee -a $LOG_FILE

if [ $userid -eq 0 ]
then
    echo -e "$G u r running with root access u can go forward $N" | tee -a $LOG_FILE
else
    echo -e "$R please run as root user $N" | tee -a $LOG_FILE
    exit 1
fi

validation()
{
   if [ $1 -eq 0 ]
      then  
          echo -e "$G $2 installation is successful $N" | tee -a $LOG_FILE
      else
          echo -e "$R $2 installation is failure $N" | tee -a $LOG_FILE
          exit 1
   fi  
}



for PACKAGE in "${PACKAGES[@]}"
do
dnf list installed $PACKAGE &>>$LOG_FILE

if [ $? -ne 0 ]
then
echo -e "$PACKAGE is not installed, going to install it" | tee -a $LOG_FILE

      dnf install $PACKAGE -y &>>$LOG_FILE

      validation $? "$PACKAGE"
else
echo -e "$Y $PACKAGE is already installed $N" | tee -a $LOG_FILE
fi

done
      

