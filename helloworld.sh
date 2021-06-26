#!/bin/bash

echo "-------Getting basic information-----------"
echo "$USER"
basshrcfile="/home/$USER/.bashrc"
if test -f "$basshrcfile"; then
    echo "Getting the '.bashrc' configurations"
    grep -E '^\w+=' "$basshrcfile" 
else
    echo "Profile file doesn't exits"
fi

echo "-------Getting Information about groups------"

GROUPS_USER="$(id -nG)"
for i in $GROUPS_USER; do
    echo "$i"
done
if echo "$GROUPS_USER" | grep 'sudo'; then
    echo "$USER is a sudo member and you can run commands as root"
    echo "Scalating privileges"
    ROOT=$(sudo whoami)
    echo "Now I'm the $ROOT user"
fi
