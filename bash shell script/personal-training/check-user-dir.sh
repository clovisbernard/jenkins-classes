#! /bin/bash
# Desc: This script will find directories without users

cd /home
for DIR in *                                  # find everything in the home dir & put it in the DIR directory which is a variable
do
    CHK=$(grep -c "/home/$DIR" /etc/passwd)   #CHK = the value of grep count of "/home/$DIR" in the passwd file
    if [ $CHK -ge 1 ]                         # greater
    then
    echo "$DIR is assigned to a user"
    else
    echo "$DIR is NOT assigned to any user"
    fi
done

