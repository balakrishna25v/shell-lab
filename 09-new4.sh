#!/bin/bash

Num1=100
Num2=200

SUM=$(($Num1 + $Num2))

echo "Sum of is: $SUM"

echo "Happy Day to you"


FRUITS=("Apple" "Banana" "Orange")

echo "First fruit is: ${FRUITS[@]}"
echo "Second fruit is: ${FRUITS[0]}"
echo "Third fruit is: ${FRUITS[1]}"     