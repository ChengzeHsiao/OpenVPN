
### The OpenVPN Remove User script 
#!/bin/bash
FILE_PATH="/etc/openvpn/psw-file"
read -p "Input UserName:" name

sed -i "/$name/d" $FILE_PATH

if [ $? -eq 0 ]; then
                echo "====Create User ok!===="
else
                echo "====Create User failed!===="
                exit 1
fi