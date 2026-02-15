#!/bin/bash



USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
    echo "Please run this script  root user access" 
    exit 1
fi

# Create logs directory if it doesn't exist
mkdir -p $LOGS_FOLDER



# A function to validate the command execution
VALIDATE(){ 
    if [ $1 -ne 0 ]; then
        echo "$2 --failed"
        exit 1
    else
        echo "$2--success"
    fi
}

# Update the system
dnf installing nginx -y &>> $LOGS_FILE
VALIDATE $? "Nginx installing"

dnf install mysql -y &>> $LOGS_FILE
VALIDATE $? "MySQL installing"

dnf install nodejs -y &>> $LOGS_FILE
VALIDATE $? "nodejs installing"