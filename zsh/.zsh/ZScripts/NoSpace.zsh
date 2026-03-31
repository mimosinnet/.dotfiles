#!/bin/zsh

function rename() {
  name=$(detox -n $file)
  if [[ $name == '' ]]
  then
    print "✗ File '$file' does not have special characters"
  else
    print "✓ $name"
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
    print "✗ File $file does not exit"
  fi
done

