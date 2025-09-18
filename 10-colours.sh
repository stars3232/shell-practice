#!/bin/bash

userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $userid -eq 0 ]
then
    echo -e "$G u r running with root access u can go forward $N"
else
    echo -e "$R please run as root user $N"
    exit 1
fi

validation()
{
   if [ $1 -eq 0 ]
      then  
          echo -e "$G $2 installation is successful $N"
      else
          echo -e "$R $2 installation is failure $N"
          exit 1
      fi  
}

dnf list installed mysql

if [ $? -ne 0 ]
then
echo -e "mysql is not installed, going to install it"

      dnf install mysql -y

      validation $? "mysql"
else
echo -e "$Y mysql is already installed $N"
      

fi       

dnf list installed nginx

if [ $? -ne 0 ]
then
echo -e "nginx is not installed, going to install it"

      dnf install nginx -y

      validation $? "nginx"
else
echo -e "$Y nginx is already installed $N"
    

fi       

dnf list installed python3

if [ $? -ne 0 ]
then
echo -e "python3 is not installed, going to install it"

      dnf install python3 -y

      validation $? "mysql"
else
echo -e "$Y python3 is already installed $N"
    

fi       