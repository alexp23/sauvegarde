#!/bin/bash

read -p "entrez le fichier : " messagerie
read -p "votre pseudo : " pseudo

echo "$pseudo en ligne" >> $messagerie

while [ 1 ]
do

  read -p ": " msg

  if  [ "$msg" = "exit canal" ]
  then
    echo "$pseudo hors ligne" >> $messagerie
    exit
  elif [ "$msg" = "exit kill" ]
  then
    rm $messagerie
    exit
  fi

  echo $msg >> $messagerie

done
