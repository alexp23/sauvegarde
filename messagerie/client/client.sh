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

nbLine=`wc -l $messagerie | cut -d ' ' -f 1`

cat -n $messagerie
echo "---------------messages enregistre---------------"

i=$nbLine
lastLine=$nbLine

while [ $i -le $nbLine ]
do

  line=`sed -n "$i p" $messagerie`

  if [ $nbLine -ne $lastLine ]
  then
    echo "$i : $line"
  fi

  while [ $nbLine -eq $i ]
  do
    nbLine=`wc -l $messagerie | cut -d ' ' -f 1`
    sleep 1
  done

  i=$(($i+1))

done
