#!/bin/bash
# ... script logic ...
if [ 2-gt 5 ]; then
echo "Condition is true. Exiting with success."
    exit 0 # Exit with success
else
echo "Condition is false. Exiting with error."
    exit 1 # Exit with error
fi

VALIDATE(){ 
    if [ $1 -ne 0 ]; then
        echo "$2 --failed" | tee -a $LOGS_FILE
        exit 1
    else
        echo "$2--success" | tee -a $LOGS_FILE
    fi
}

# Update the system
dnf installing nginx -y &>> $LOGS_FILE
VALIDATE $? "Nginx installing"

dnf install mysql -y &>> $LOGS_FILE
VALIDATE $? "MySQL installing"

dnf install nodejs -y &>> $LOGS_FILE
VALIDATE $? "nodejs installing"