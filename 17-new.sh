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
dnf list installed $package &>> $LOGS_FILE #Check if the package is already installed and redirect output to the log file   
if [ $? -ne 0 ]; then # Check if the package is not installed
    echo "$package is not installed. Installing now..." | tee -a $LOGS_FILE # Log the message about installing the package
    dnf install $package -y  &>> $LOGS_FILE # Install the package and redirect output to the log file
    VALIDATE $? "$package installation" # Validate the installation of the package
else
    echo "$package is already installed. Skipping installation." | tee -a $LOGS_FILE
fi
done
