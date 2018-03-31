#!/bin/bash

serverName="Messagerie"
serverIp="192.168.1.75"
serverPort="22"
serverDest="/home/Alex/$messagerie"

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

if [ ! -f $messagerie ]
then
  echo " " >> $messagerie
fi

<<COMMENT 
while [ 1 ]
do

  if [ $1 != "-local" ]
  then
    scp "$serverName@$serverIp:$serverPort$serverDest" .
    echo "pas de deuxieme parametre"
  fi

  msgAfter="`cat $messagerie | awk 'END {print}' `"

  if [ "$msgBefore" != "$msgAfter" ]
    then
      echo $msgAfter
      msgBefore=$msgAfter
    fi
done
COMMENT

i=0

nbLine=`wc -l $messagerie | cut -d ' ' -f 1`

while [ $i -lt $nbLine ]
do
  
  i=$(($i+1))

  line=`sed -n "$i p" $messagerie`
  echo "$i : $line"
  
  while [ $nbLine -eq $i ]
  do
    if [ -f $messagerie ]
    then
      nbLine=`wc -l $messagerie | cut -d ' ' -f 1`
    else
      exit
    fi
    sleep 1
  done

done
