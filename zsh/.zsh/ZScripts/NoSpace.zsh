#!/bin/zsh

[[ $# > 0 ]] || { print "Indica a quins arxius vols eliminar caràcters especials. " ; exit}

function rename() {
  name=$(detox -n $file)
  if [[ $name == '' ]]
  then
    print "✗ L'arxius '$file' no té caràcters esepcials. "
  else
    print "✓ $name"
    # if name is unset set it to name
    name=(${=name})
    newname=$name[-1]
    detox $file
    print $(readlink -f $newname)
  fi
}

for file in $argv[@]
do
  if [[ -a $file  ]]
  then
    rename
  else
    print "✗ L'arxiu $file no existeix. "
  fi
done

