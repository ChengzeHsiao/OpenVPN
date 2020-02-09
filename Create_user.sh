### The OpenVPN Create User script 

#!/bin/bash
FILE_PATH="/etc/openvpn/psw-file"
read -p "Input UserName:" name
read -p "Input Password:" pass
echo "$name $pass" >> $FILE_PATH

if [ $? -eq 0 ]; then
                echo "====Create User ok!===="
else
                echo "====Create User failed!===="
                exit 1
fi

grep $name $FILE_PATH