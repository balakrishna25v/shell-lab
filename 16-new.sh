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

VALIDATE()
{ 
    if [ $1 -ne 0 ]; then
        echo "$2 ....failed" | tee -a $LOGS_FILE
        exit 1
    else
        echo "$2 ....success" | tee -a $LOGS_FILE
    fi
}

for package in $@ # Loop through each package name provided as an argument
do
    dnf install $package -y  &>> $LOGS_FILE # Install the package and redirect output to the log file
    VALIDATE $? "$package installation" # Validate the installation of

done