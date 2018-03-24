#!/bin/bash

if [ -z $1 ]
then
  echo "manque le fichier a placer dans la corbeille"
  exit
else
  file=$1
fi

mv $1 /home/portable/corbeille/
