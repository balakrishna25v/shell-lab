#!/bin/bash

echo "all args passed to the script: $@"
echo "Number of vars passed to the script: $#"
echo "script name is: $0"
echo "present working directory is: $PWD"
echo "who is running this script: $USER"
echo "home directory of the user is: $HOME"
echo "PID of the current script is: $$"
sleep 100&
echo "PID of recently executed background process is: $!"
echo "All args passed to script is: $*"