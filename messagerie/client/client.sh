#!/bin/bash

read -p "entrez le fichier : " messagerie
serverName="Messagerie"
serverIp="192.168.1.75"
serverPort="22"
serverDest="/home/Alex/$messagerie"

msgBefore=""

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
  echo "$line"
  
  while [ $nbLine -eq $i ]
  do
    nbLine=`wc -l $messagerie | cut -d ' ' -f 1`
    sleep 1
  done

done
