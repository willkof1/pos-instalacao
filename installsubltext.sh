#!/bin/bash
####sh com os comandos para instalar o sublimetext debian e derivados####
####fonte dos comandos https://www.sublimetext.com/docs/3/linux_repositories.html######
apt update && apt upgrade -y
echo "Install the GPG key"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "install dependencias"
sudo apt-get install apt-transport-https
echo "Select the channel to use: Stable"
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
echo "update and install"
sudo apt-get update
sudo apt-get install sublime-text
sudo apt-get install terraform
sudo apt-get install spotify-client
sudo apt install keepass2
sudo apt install awscli
sudo apt install flameshot
sudo apt install mysql-client