#!/bin/bash
#######################SCRIPT PARA ATUALIZAR O SISTEMA#####################
PACOTES=`sudo apt update`
if [[ "$?" -ne 0 ]]
  then
      echo
      echo -e "\t\t\t\t\t\t\033[1;41m Ocorreu um erro durante o update dos repos! \033[0m"
      echo ""
      exit 0
fi
RESULTADO=`grep "Todos" <<<$PACOTES` && `grep "All" <<<$PACOTES`
if [[ -n $RESULTADO ]]
  then
      echo
      echo -e "\t\t\t\t\t\t\033[1;32m Sistema Atualizado! S2 \033[0m"
      echo ""
      exit 0
fi
sudo apt list --upgradable
echo ""
echo -e "\e[1;43m Vai atualizar o sistema ? S/N \e[0m"
echo ""
read escolha
#if [[ $escolha != S, s ]]
if [[ $escolha != "S" && $escolha != "s" && $escolha != "Y" && $escolha != "y" ]]
  then
      echo
      echo -e "\t\t\t\t\t\t\033[1;31m Usuario não aceitou atualizar o sistema ou não confirmou corretamento com "S"! \033[0m"
      echo ""
      exit 0
fi
sudo apt upgrade -y
sleep 2
sudo apt clean
sleep 2
sudo apt autoremove -y