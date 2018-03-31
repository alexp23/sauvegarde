#!/bin/bash

read -p "entrez le fichier : " messagerie
read -p "votre pseudo : " pseudo

echo "$pseudo est en ligne" >> $messagerie

while [ 1 ]
do

  read -p ": " msg

  if  [ "$msg" = ":exit" ]
  then
    echo "$pseudo est hors ligne" >> $messagerie
    exit
  elif [ "$msg" = ":exit kill" ]
  then
    rm $messagerie
    exit
  fi

  echo $msg >> $messagerie

done
