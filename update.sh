#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
#atualiza os repositores com base em source.list#
PACOTES=`sudo apt update`
if [[ "$?" -ne 0 ]]
  then
      echo
      echo -e "\t\t\t\t\t\t\033[1;31m Ocorreu um erro durante o update dos repos! \033[0m"
      exit 0
fi
RESULTADO=`grep "Todos" <<<$PACOTES` && `grep "All" <<<$PACOTES`
if [[ -n $RESULTADO ]]
  then
      echo
      echo -e "\t\t\t\t\t\t\033[1;32m Sistema Atualizado! S2 \033[0m"
      exit 0
fi
sudo apt list --upgradable
echo "Vai atualizar o sistema ? S/N"
read escolha
if [[ $escolha != S ]]
  then
      echo
      echo -e "\t\t\t\t\t\t\033[1;31m Usuario não aceitou atualizar o sistema! \033[0m"
      exit 0
fi
sudo apt upgrade -y
sleep 2
sudo apt clean
sleep 2
sudo apt autoremove -y