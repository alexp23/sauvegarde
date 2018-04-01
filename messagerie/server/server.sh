#!/bin/bash

fileDest=""

while [ 1 ]
do

  for file in `ls`
  do
    if [ -f "$file" ] && [ "$file" != "server.sh" ]
    then
      messagerie="`ls $file | cut -d '|' -f 1`"

      if [ ! -d "$messagerie" ]
      then
        mkdir "$messagerie"
      fi

      cat "$file" >> "$messagerie/$messagerie"
      rm "$file"
    fi
  done

sleep 1

done
