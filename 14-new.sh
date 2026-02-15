#!/bin/bash
# ... script logic ...
if [ 10 -gt 5 ]; then
echo "Condition is true. Exiting with success."
    exit 0 # Exit with success
else
echo "Condition is false. Exiting with error."
    exit 1 # Exit with error
fi
