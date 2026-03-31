#!/bin/zsh

# source this script to be able to change directory

dir='/mnt/sistema'
file='Codis.txt'
# Número de dia de l'any
dia=`date +%j`

if ! grep -q 'encfs /mnt/sistema' /etc/mtab
then
	encfs --idle=30 /home/mimosinnet/.config/sistema $dir
fi
cp $dir/$file $dir/Segur/$dia$file
cd $dir
