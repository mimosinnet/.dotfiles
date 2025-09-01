#!/bin/zsh

[[ $# > 0 ]] || { print "Indica quins arxius vols datar. " ; exit}

now=$(date +'%Y.%m')

for file_old in $argv[@]
do
  if [[ -a $file_old ]]
  then
    file_new=${now}_$file_old
    print "move $file_old $file_new"
    mv $file_old $file_new
  else
    print "L'arxiu '$file_old' no existeix"
  fi
done
