#!/bin/bash

echo "Đang cập nhật danh sách gói phần mềm..."
sudo apt update

echo "Đang cài đặt Apache..."
sudo apt install -y apache2

echo "Đang cài đặt PHP và các mô-đun PHP..."
sudo apt install -y php libapache2-mod-php php-mysql php-cli php-common php-fpm

echo "Đang cài đặt MySQL..."
sudo apt install -y mysql-server

echo "Khởi động Apache và MySQL..."
sudo systemctl start apache2
sudo systemctl enable apache2
sudo systemctl start mysql
sudo systemctl enable mysql

echo "Kiểm tra Apache..."
if systemctl is-active --quiet apache2; then
    echo "Apache đã được cài đặt và đang chạy."
else
    echo "Có lỗi khi cài đặt Apache."
fi

echo "Kiểm tra MySQL..."
if systemctl is-active --quiet mysql; then
    echo "MySQL đã được cài đặt và đang chạy."
else
    echo "Có lỗi khi cài đặt MySQL."
fi

echo "Kiểm tra PHP..."
php_version=$(php -v | head -n 1)
if [[ $php_version =~ "PHP" ]]; then
    echo "PHP đã được cài đặt: $php_version"
else
    echo "Có lỗi khi cài đặt PHP."
fi

echo "Cài đặt hoàn tất. Apache, PHP và MySQL đã được cài đặt và khởi động."
