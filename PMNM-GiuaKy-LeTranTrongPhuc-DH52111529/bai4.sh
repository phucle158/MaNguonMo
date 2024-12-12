#!/bin/bash


if [ ! -f "$1" ]; then
    echo "File không tồn tại. Vui lòng cung cấp file chứa danh sách username và password."
    exit 1
fi


while IFS=: read -r username password; do
    
    if id "$username" &>/dev/null; then
        echo "Username $username đã tồn tại."
    else
        
        sudo useradd -m "$username"
        echo "$username:$password" | sudo chpasswd
        echo "Đã tạo username $username với password $password."
    fi
done < "$1"
