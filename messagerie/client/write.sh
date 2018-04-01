#!/bin/bash

cQuit=":exit"             #commande pour quitter le programme
cKill=":exit kill"        #commande pour supprimer la conversation

name="USR"
ip="192.168.1.75"
port="22"
dest=""

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

if [ ! -f $messagerie$pseudo ]
then
  echo "$messagerie" >> "$messagerie|$pseudo"
  echo "$pseudo" >> "$messagerie|$pseudo"
fi

sendMessage()
{
  echo $1 > $2
  cp "$2" "../server"
  #scp $2 "$name@$ip:$port$dest"
}

sendMessage "| $pseudo est en ligne |>" "$messagerie|$pseudo"

while [ 1 ]
do

  read -p ": " msg

  if  [ "$msg" = "$cQuit" ]
  then
    sendMessage "| $pseudo est hors ligne |>" "$messagerie|$pseudo"
    exit
  fi
  sendMessage "| $pseudo : $msg |>" "$messagerie|$pseudo"

done

