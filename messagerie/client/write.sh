#!/bin/bash

cQuit=":exit"             #commande pour quitter le programme
cKill=":exit kill"        #commande pour supprimer la conversation

read -p "entrez le fichier : " messagerie
read -p "votre pseudo : " pseudo

echo "__________________________________" >> $messagerie
echo "|$pseudo est en ligne" >> $messagerie
echo "----------------------------------" >> $messagerie

while [ 1 ]
do

  read -p ": " msg

  if  [ "$msg" = "$cQuit" ]
  then
    echo "$pseudo est hors ligne" >> $messagerie
    exit
  elif [ "$msg" = "$cKill" ]
  then
    rm $messagerie
    exit
  fi
  echo "$pseudo : $msg" >> $messagerie
  echo "------------------------------------------------------>" >> $messagerie

done
