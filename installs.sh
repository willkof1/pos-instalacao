#!/bin/bash
####Script para instalar alguns coisas default (que eu uso) pos instalação do ubuntu####
####Como tenho minha /home separada apos a instalação, muitas configs serão lidas de lá####

echo "install dependencias/others"
sudo apt update && sudo apt upgrade -y
sudo apt install vim apt-transport-https gnupg software-properties-common curl wget gpg ca-certificates flameshot \
awscli mysql-client net-tools telegram-desktop nmap neofetch lsb-release software-properties-common build-essential \
git transmission-daemon neofetch gsmartcontrol tasksel  -y

echo "install sublime text"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update && sudo apt install sublime-text -y

echo "add repo terraform"
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo tee /etc/apt/trusted.gpg.d/hashicorp.asc
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update && sudo apt install terraform -y

echo "add repo spotify"
wget -O- https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/spotify.gpg
echo "deb [signed-by=/usr/share/keyrings/spotify.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client -y

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update && sudo apt install code # or code-insiders
rm -f packages.microsoft.gpg wget-log

echo "install protonvpn"
wget https://protonvpn.com/download/protonvpn-stable-release_1.0.1-1_all.deb
sudo dpkg -i protonvpn-stable-release_1.0.1-1_all.deb
sudo apt update && sudo apt-get install protonvpn

echo "install zsh"
sudo apt install zsh zsh-syntax-highlighting -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/

echo "install docker"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo setxkbmap -model abnt -layout us -variant intl >> ~/.zshrc && source ~/.zshrc
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose -y
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo echo options hid_apple fnmode=2 > /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u -k all
sudo reboot