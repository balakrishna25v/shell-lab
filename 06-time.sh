#!/bin/bash

Timestamp=$(date)
echo "script executed at: $Timestamp"


sleep 10

enD_TIME=$(date +%S)
tOTAL_TIME=$(($enD_TIME - $SECONDS))



echo "total execution time: $tOTAL_TIME"