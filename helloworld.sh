#!/bin/bash

echo "$USER"
basshrcfile="/home/$USER/.bashrc"
if test -f "$basshrcfile"; then
    echo "Getting the '.bashrc' configurations"
    grep -E '^\w+=' "$basshrcfile" 
else
    echo "Profile file doesn't exits"
fi