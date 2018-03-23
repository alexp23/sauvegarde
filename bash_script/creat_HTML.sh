#!/bin/bash

if [ -z $1 ]
then
  file="index.html"
else
  file=$1
fi

if [ ! -z $2 ]
then
  if [ -d $2 ]
  then
    cd $2
  else
    mkdir $2
    cd $2
  fi
fi
  

if [ -f $file ]
then
  rm $file
  touch $file
fi

echo "<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Titre</title>
  </head>
  <body>
  " >> $file
echo  "<h1>$3</h1>" >>$file
echo  "<p>$4</p>">>$file
echo "</body>
</html>" >> $file

