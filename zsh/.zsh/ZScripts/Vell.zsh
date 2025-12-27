#!/usr/bin/env zsh

lib="${0:a:h}/lib"
source "$lib/printline.zsh"

dir='Vell'
files=($(ls *(.)))
now=$(date +'%Y.%m.%d')
dir_new=${now}_$dir

_printline 60
print -n "Before: "
ls
_printline 60

mkdir $dir
print "MOVE $files TO $dir"
mv $files $dir

print "move $dir $dir_new"
mv $dir $dir_new
_printline 60

print -n "After: "
ls
_printline 60
