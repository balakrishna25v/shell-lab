#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "You are running this script as root."
    exit 1
else
    echo "You are running this script as a regular user."
    exit 0
fi

echo "installing nginx web server"
dnf install nginx -y