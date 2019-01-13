#!/bin/bash

result=$(python get_pi.py)
if [ $(echo "$result == 3.14" | bc) -eq 1 ]; then
    exit 0
else
    exit 1
fi
