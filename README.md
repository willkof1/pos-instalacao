# pos-instalacao
 - executar o install.sh para instalar as coisinhas mais usadas s2

# backup
 - 
 rsync -auvxP /pathdeOrigem/ /pathdeDestino/ >/dev/null 2>&1
 rsync -auvxP --delete --exclude-from=/path/ignore_list.txt /pathdeOrigem/ /pathdeDestino/ >/dev/null 2>&1