#!/bin/bash
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
    echo "Please run this script  root user access" | tee -a $LOGS_FILE
    exit 1
fi

# Create logs directory if it doesn't exist
mkdir -p $LOGS_FOLDER



VALIDATE(){ 
    if [ $1 -ne 0 ]; then
        echo "$1 ....failed" | tee -a $LOGS_FILE
        exit 1
    else
        echo "$1 ....success" | tee -a $LOGS_FILE
    fi
}

# Update the system
dnf installing nginx -y &>> $LOGS_FILE
VALIDATE $? "Nginx installing"

dnf install mysql -y &>> $LOGS_FILE
VALIDATE $? "MySQL installing"

dnf install nodejs -y &>> $LOGS_FILE
VALIDATE $? "nodejs installing"