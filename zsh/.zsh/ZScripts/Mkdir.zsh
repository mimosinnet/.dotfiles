#!/usr/bin/env zsh
# mkdir + chdir

# source this script to be able to change directory

if [[ $# != 1 ]] 
then
  print 'Indica el nom del directori que vols crear'
elif [[ -e $1 ]]
then
  print 'El directori / arxiu ja existeix'
else
  mkdir $1
  cd $1
fi
