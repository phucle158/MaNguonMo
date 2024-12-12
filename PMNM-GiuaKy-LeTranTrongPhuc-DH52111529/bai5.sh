#!/bin/bash


echo "Đang cập nhật danh sách gói phần mềm..."
sudo apt update


echo "Đang cài đặt các phần mềm văn bản..."


sudo apt install -y nano


sudo apt install -y vim


sudo apt install -y gedit


sudo apt install -y emacs


sudo apt install -y sublime-text

echo "Các phần mềm văn bản đã được cài đặt xong."
