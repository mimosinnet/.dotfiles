#!/bin/zsh

file_from=$(ls "$HOME/$1/"*(.om[1]))
file=$file_from:t

mv $file_from .

file_to=$(readlink -f $file)

print "File: $file:t"
print "From: $file_from"
print "To:   $file_to"
