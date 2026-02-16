#!/bin/bash


set -e #ERR

trap 'echo "there is an error in $LINENO   , Command : $BASH_COMMAND..." ERR

echo "Hello world!."
echo "I am learning shell."
echo "printing error here"
echo "No error in the"