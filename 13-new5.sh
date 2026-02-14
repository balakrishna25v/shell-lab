#!/bin/bash


USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "Please run this script  root user access" 
    exit 1
fi

VALIDATE()
{ 
    if [ $1 -ne 0 ]; then
        echo "$2 --failed."
        exit 1
    else
        echo "$2--success."
    fi
}

dnf installing nginx -y
VALIDATE $? "nginx installing"

dnf install mysql -y
VALIDATE $? "MySQL installing"

dnf install nodejs -y
VALIDATE $? "Nodejs installing"