#!/bin/bash

cQuit=":exit"             #commande pour quitter le programme
cKill=":exit kill"        #commande pour supprimer la conversation

if [ -z $1 ]
then
  read -p "entrez le fichier : " messagerie

  while [ -z $messagerie ]
  do
    read -p "entrez le fichier : " messagerie
  done
else
  messagerie=$1
fi

if [ -z $2 ]
then
  read -p "votre pseudo : " pseudo

  while [ -z $pseudo ]
  do
    read -p "votre pseudo : " pseudo
  done
else
  pseudo=$2
fi

echo "| $pseudo est en ligne |>" >> $messagerie

while [ 1 ]
do

  read -p ": " msg

  if  [ "$msg" = "$cQuit" ]
  then
    echo "| $pseudo est hors ligne |>">> $messagerie
    exit
  elif [ "$msg" = "$cKill" ]
  then
    rm $messagerie
    exit
  fi
  echo "| $pseudo : $msg |>" >> $messagerie

done

