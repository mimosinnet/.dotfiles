#!/usr/bin/env zsh

lib="${0:a:h}/lib"
source "$lib/printline.zsh"

ext=$1
dir=$2

usage='Usage: MoveFile [all|ext] dir '

[[ $# -eq 2 ]] || { _printline 60 ; print $usage ; _printline 60 ; exit}
[[ -d $dir  ]] || { print "El directori $dir no existeix"; exit  }

if [[ $ext ==  all ]]
then
  files=($(ls *(.)))
else
  files=($(ls *.$ext(.)))
fi

[[ $#files -gt 0 ]] || { _printline 60 ; print "Cap ariu amb extensió $ext"; _printline 60; exit  }

_printline 60
print -n "Before: "
ls
_printline 60

print "MOVE $files TO $dir"
mv $files $dir
_printline 60

print -n "After: "
ls
_printline 60
