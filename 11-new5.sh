#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "You are running this script as root."
else
    echo "You are running this script as a regular user."
fi

echo "installing nginx web server"
dnf install nginx -y