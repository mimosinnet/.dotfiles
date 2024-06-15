#!/bin/zsh

# Copia els arxius de la presentació a 'export'

readonly num=${1:?"Especifica el número de presentació."}
dirpres='/home/mimosinnet/Dades/IntercanviWin/Presentacions'
direxport='/home/mimosinnet/Dades/IntercanviWin/Presentacions/export'

md=(${(s'\n')$(ls -C $dirpres/$num/*.md)})

if [[ ${#md[@]} == 1 ]] 
then
  titol=$(echo $md | sed -E 's/.*\/(.*).md/\1/')
  print "\nPresentació: $titol"
else
  echo 'Hi ha més d''un arxiu markdown'
  exit
fi

if [[ -d "$direxport/$titol" ]]
then
  mkdir -p "$direxport/$titol/$num"
else
  print "Export directory $direxport/$titol does not exist"
  print "Have you exported the $titol presentation?"
  exit
fi

rsync -anv --delete "$dirpres/$num/media" "$direxport/$titol/$num"

if read -q "?Vols continuar? (y/n)"
then
  rsync -av --delete "$dirpres/$num/media" "$direxport/$titol/$num"
else
  print '\nNo hem sincronitzat els arxius'
fi

