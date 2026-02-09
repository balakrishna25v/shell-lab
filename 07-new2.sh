#!/bin/bash


userid=$(id -u)
if [ $userid -ne 0 ]; then
    echo "You are running this script as root."
else
    echo "You are running this script as a regular user."
fi

echo "user ID is $userid and print a message."\
