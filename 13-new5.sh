#!/bin/bash


USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "Please run this script  root user access" 
    exit 1
fi

VALIDATE=$(dnf check-update)
if [ $? -ne 0 ]; then
    echo "System update --failed."
    exit 1
else
    echo "System update --success."
fi

echo "installing nginx"
dnf install nginx -y

if [$? -ne 0 ]; then
    echo "nginx installing --failed ."
    exit 1
else
    echo "nginx installing successfully."
fi

dnf install mysql -y
if [$? -ne 0 ]; then
    echo " installing --MySQL....FAILURE."
    exit 1
else
    echo "Installing --MySQL....SUCCESS."
fi

dnf install nodejs -y

if [$? -ne 0 ]; then
    echo " installing Nodejs....FAILURE."
    exit 1
else
    echo "Installing Nodejs....SUCCESS."
fi

