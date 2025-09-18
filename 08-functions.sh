#!/bin/bash

userid=$(id -u)

if [ $userid -eq 0 ]
then
    echo "u r running with root access u can go forward"
else
    echo "please run as root user"
    exit 1
fi

validation()
{
   if [ $1 -eq 0 ]
      then  
          echo "$2 installation is successful"
      else
          echo "$2 installation is failure"
          exit 1
      fi  
}

dnf list installed mysql

if [ $? -ne 0 ]
then
echo "mysql is not installed, going to install it"

      dnf install mysql -y

      validation $? "mysql"
else
echo "mysql is already installed"
      
fi       

dnf list installed nginx

if [ $? -ne 0 ]
then
echo "nginx is not installed, going to install it"

      dnf install nginx -y

      validation $? "nginx"
else
echo "nginx is already installed"
      
fi       

dnf list installed python3

if [ $? -ne 0 ]
then
echo "python3 is not installed, going to install it"

      dnf install python3 -y

      validation $? "mysql"
else
echo "python3 is already installed"
       
fi       