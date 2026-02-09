#!/bin/bash

NUMBER=25


# -gt is greater than
# -lt is less than
# -eq is equal to
# -ne is not equal to
# -ge is greater than or equal to
# -le is less than or equal to  


if [ $NUMBER -gt 20 ]; then
    echo "The number is greater than 20."
else
    echo "The number is less than or equal to 20."
fi