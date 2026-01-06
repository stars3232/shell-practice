#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
PACKAGES=("nginx" "mysql" "python3" "httpd")

if [ $USERID -ne 0 ]
then
    echo -e "$R please run with root access $N"
    exit 1
else
    echo -e "$G you are running withroot acces. u can move forward $N"
fi

VALIDATE()
{
    if [ $1 -eq 0 ]
    then
    echo -e "$G $2 is installed succesfully $N"
    else 
    echo -e "$R installation of $2 is failure $N"
    exit 1
    fi
}

for i in ${PACKAGES[@]}
do
dnf list installed $i
if [ $? -ne 0 ]
then
    dnf install $i -y
    VALIDATE $? "$i"
else
    echo -e "$Y $i is already installed in ur system $N"   
fi  
done   
