#!/bin/zsh

file=$(ls "$HOME/$1/"*(.om[1]))

mv $file .

print "$file"
print "$file:t"
