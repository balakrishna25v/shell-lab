#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "You are running this script as root."
    exit 1
fi

echo "installing nginx"
dnf install nginx -y

if [$? -ne 0 ]; then
    echo "nginx installing --failed ."
    exit 1
else
    echo "nginx installed successfully."
fi