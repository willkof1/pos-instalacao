#!/bin/bash
echo ""
echo -e "\e[1;43m Inciando Download da nova versao! \e[0m"
echo ""
wget -O /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
echo "Iniciando a instalacao"
echo
sudo dpkg -i /tmp/discord.deb
echo "Remove pra nao ficar sujeira"
sleep 10
sudo rm -rf /tmp/discord.deb
echo ""
echo -e "\e[1;43m Foi removido!! \e[0m"