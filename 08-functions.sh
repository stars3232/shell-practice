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

      validation() $? "mysql"
else
echo "mysql is already installed"
exit 1       

fi       