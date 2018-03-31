#!/bin/bash

fileDest=""

while [ 1 ]
do

  for file in `ls`
  do
    if [ -f $file ]
    then
      messagerie=`ls $file | cut -d '|' -f 1`
      if [ ! -d $messagerie ]
      then
        mkdir $messagerie
      fi
        echo $file >> "$messagerie/$messagerie"
    fi
  done

sleep 1

done
