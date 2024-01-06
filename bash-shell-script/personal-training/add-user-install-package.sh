#! /bin/bash
#Author: Clovis Tsopgo
#Date: December 30 2021

OS=$(cat /etc/*rel* | grep ID | awk -F"=" '{print $2}' | head -1)
case $OS in
    Ubuntu|ubuntu)
        echo "Your server is $OS. We are now performing updates."
            sleep 5
            apt update -y
            # apt install wget
            # apt install curl
            # apt install apache2
        ;;
    CentOs|Contos|rhel|RHEL)
        echo "Your server is $OS. We are now performing updates."
            sleep 5
            yum update -y
            # yum install wget
            # yum install curl
            # yum install httpd

        ;;
    *)
        echo "Hmm, seems i've never used it."
        ;;
esac

MEMORY=$(free -h | grep Mem |awk -F " " '{print $2}')
echo "The memory available is $MEMORY"
TOTAL_SIZE=$(df -h / |grep dev |awk -F " " '{print $2}')
USED_SIZE=$(df -h / |grep dev |awk -F " " '{print $2}')
AVAILABLE_SIZE=$(df -h / |grep dev |awk -F " " '{print $2}')
echo "The total size of the file system is $TOTAL_SIZE"
echo "The used size of the file system is $USED_SIZE"
echo "The available size of the file system is $AVAILABLE_SIZE"



# Define the USER
USER="bernado"
PASSWORD="password"
EPASSWORD=$(openssl passwd -1 $PASSWORD)
# Check if the user exists
if id "$USER" &>/dev/null; then
    echo "User $USER already exists. Skipping user creation."
else
    echo "User $USER does not exist. Creating user..."
    sudo useradd -m -s /bin/bash -d /home/$USER $USER
    echo "$USER:$EPASSWORD" | sudo chpasswd

    echo "User $USER created successfully."
fi
