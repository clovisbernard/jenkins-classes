#!/bin/bash

#description: script to check the servers OS and patch them
#Author: Kelly
#Date: 02/12/2021

OS=$(cat /etc/*rel* | grep ID | awk -F"=" '{print $2}' | head -1)

if [$OS == CentOS] || [$OS == Amazon]
then
echo "your server is $OS, we are now perfoming updates"
        echo
        sleep 5

        yum update -y

elif [$OS == Ubuntu]
then
echo "your server is $OS, we are now perfoming updates"
        echo
        sleep 5

 apt update -y

else
echo "sorry your OS is not recognized"
 exit 1
fi