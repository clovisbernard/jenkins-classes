#!/bin/bash
USERS=("tom" "Alexia" "Daniel" "Dahlia" "Maldini" "MAELYS")
for user in "${USERS[@]}"; do
    USER_LOWER=$(echo "$user" | tr '[:upper:]' '[:lower:]')
    sleep 1
    echo "Adding ${USER_LOWER}"
done
## =======================================================

#!/bin/bash

# Iterate over an array of fruits
fruits=("Apple" "Banana" "Orange" "Grapes" "Watermelon")

for fruit in "${fruits[@]}"
do
    echo "Current fruit is: $fruit"
done

## =======================================================

#!/bin/bash
users=("tom" "Banana" "paul" "TONTON" "tata")
for user in "${users[@]}"; do
    lower_case=$(echo "$user" | tr 'A-Z' 'a-z')
    sleep 1
    echo "Adding ${lower_case}"
done

## =======================================================
#!/bin/bash
users=("tom" "Banana" "paul" "TONTON" "tata")
for user in "${users[@]}"
do
    if ! grep -q "^${user}:" /etc/passwd; then
        lower_case=$(echo "$user" | tr 'A-Z' 'a-z')
        echo "Addeding ${lower_case}"
        useradd -m "${lower_case}"
        echo "${lower_case}:${lower_case}" | chpasswd
        usermod -c "${lower_case} ${lower_case}" "${lower_case}"
        cat /etc/passwd | grep "${lower_case}"
        cat /etc/shadow | grep "${lower_case}"
        ls /home
    else
        echo "User ${lower_case} already exists"
    fi
done

## =======================================================
#!/bin/bash

cat << EOF > /tmp/users.txt
tom
Banana
paul
TONTON
tata
EOF
username=$(cat /tmp/users.txt | tr '[A-Z]' '[a-z]')

for i in $username
do
    sleep 1
    echo "Adding user: $i"
done

## =======================================================
#!/bin/bash

cat << EOF > /tmp/users.txt
s7felix
s5damien
s5michael
s5royce
s5kuh
EOF
username=$(cat /tmp/users.txt | tr '[A-Z]' '[a-z]')

for tia in $username
do
    if ! grep -q "^${tia}:" /etc/passwd; then
        echo "Adding ${tia}"
        useradd -m "${tia}"
        echo "${tia}:${tia}" | chpasswd
        usermod -c "${tia} ${tia}" "${tia}"
        cat /etc/passwd | grep "${tia}"
        cat /etc/shadow | grep "${tia}"
        passwd -e ${tia}
        ls /home
    else
        echo "User ${tia} already exists"
    fi
done

## =======================================================
#!/bin/bash
for y in `(ls -l /home/ |awk '{print$9}')`
do
    if [[ -d /home/$y ]]
    then 
        cd /home/$y && rm president.csv
    fi
done

#!/bin/bash
for y in `(ls -l /home/ |awk '{print$9}')`
do
    if [[ -d /home/$y ]]
    then 
        cp president.csv /home/$y
    fi
done


#!/bin/bash
for y in `(ls -l |awk '{print$9}')`
do
    if [[ -d $y ]]
    then 
        echo "directory: $y"
    fi
done

#!/bin/bash
for y in `(ls -l |awk '{print$9}')`
do
    if [[ -f $y ]]
    then 
        echo "directory: $y"
    fi
done