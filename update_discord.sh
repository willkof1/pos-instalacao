#!/bin/bash
echo "Inciando Download da nova versao"
wget -O /home/william/Downloads/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
echo "Iniciando a instalacao"
sudo dpkg -i /home/william/Downloads/discord.deb
echo "Remove pra nao ficar sujeira"
sudo rm -rf /home/william/Downloads/discord.deb
echo "Listar pra confirmar"
sudo ls -l /home/william/Downloads/discord.deb