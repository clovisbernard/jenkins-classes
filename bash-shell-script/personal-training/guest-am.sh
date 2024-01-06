#!/bin/bash

# Iterate over each line in guest.txt
while IFS= read -r line; do
    PREFIX=$(echo "$line" | awk '{print $1}')
    NAME=$(echo "$line" | awk '{print $2}')
    # Concatenate PREFIX and NAME with a hyphen and print the result
    USERNAME="${PREFIX}-${NAME}"

    if ! grep -q "^$(echo "$USERNAME" | tr 'A-Z' 'a-z'):" /etc/passwd; then
        # Convert the username to lowercase
        lower_case=$(echo "$USERNAME" | tr 'A-Z' 'a-z')

        echo "Adding ${lower_case}"

        # Add the user with home directory
        useradd -m "${lower_case}"
        usermod -G  american-guest "${lower_case}"
        # Set the password for the user
        echo "${lower_case}:${lower_case}" | chpasswd
        echo "${lower_case}  ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/clovis

        # Set the user's full name
        usermod -c "${lower_case} ${lower_case}" "${lower_case}"
        cat /etc/passwd | grep "${lower_case}"
        cat /etc/shadow | grep "${lower_case}"
    else
        # If the user already exists, delete it
        lower_case=$(echo "$USERNAME" | tr 'A-Z' 'a-z')
        echo "User ${lower_case} already exists. Deleting..."
        userdel -r "${lower_case}" > /dev/null 2>&1
        # echo "User ${lower_case} already exists. Locking..."
        # passwd -l "${lower_case}"
        # echo "User ${lower_case} already exists. unlocking..."
        # passwd -u "${lower_case}"
    fi
done < guest.txt
