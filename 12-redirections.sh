#!/bin/bash

userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shellscript_logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

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

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]
then
echo -e "mysql is not installed, going to install it" | tee -a $LOG_FILE

      dnf install mysql -y &>>$LOG_FILE

      validation $? "mysql"
else
echo -e "$Y mysql is already installed $N" | tee -a $LOG_FILE
      

fi       

dnf list installed nginx &>>$LOG_FILE

if [ $? -ne 0 ]
then
echo -e "nginx is not installed, going to install it" | tee -a $LOG_FILE

      dnf install nginx -y &>>$LOG_FILE

      validation $? "nginx"
else
echo -e "$Y nginx is already installed $N" | tee -a $LOG_FILE
    

fi       

dnf list installed python3 &>>$LOG_FILE

if [ $? -ne 0 ]
then
echo -e "python3 is not installed, going to install it" | tee -a $LOG_FILE

      dnf install python3 -y &>>$LOG_FILE

      validation $? "mysql"
else
echo -e "$Y python3 is already installed $N" | tee -a $LOG_FILE
    

fi       