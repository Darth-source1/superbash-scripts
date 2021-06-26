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
    echo "Depending on the number of data that the user has in" \
    "the $home is the time it process will take to finish"
    dirs=$(sudo find "$home" -type d | wc -l)
    echo "The number of directories is: $dirs"
    files=$(sudo find "$home" -type f | wc -l)
    echo "The number of files is: $files"
    symlink=$(sudo find "$home" -type l | wc -l)
    echo "The number of symbolic links is: $symlink"
    symlink=$(sudo find "$home" -type s | wc -l)
    echo "The number of sockets is: $symlink"
else
    echo "Not found user"
fi
