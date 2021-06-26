#!/bin/bash
echo "Type your username: "
read -r username

# check if the user exists
grep "$username" "/etc/passwd" &> /dev/null
code=$?
if [ "$code" -eq "0" ]; then
    echo 'User found'
    data=$(sudo grep "$username" /etc/passwd)
    home=$(echo "$data" | awk -F  ":" '/1/ {print $6}')
    echo "The user home directory is: $home"
    echo "Lets look at the files in $username home directory."
    documents=$(sudo find "$home" | wc -l)
    echo "The number of files is: $documents"
else
    echo "Not found user"
fi
