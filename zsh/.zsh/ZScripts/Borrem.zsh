#!/usr/bin/env zsh

[[ $# > 0 ]] || { print "Indica a quins arxius vols eliminar caràcters especials. " ; exit}

arxiu=/home/mimosinnet/Baixades/Borrem

for file in $argv[@]
do
  if [[ -a $file  ]]
  then
    mv $file $arxiu
    print "< $file > MOGUT A < $arxiu >." 
  else
    print "✗ L'arxiu $file no existeix. "
  fi
done
