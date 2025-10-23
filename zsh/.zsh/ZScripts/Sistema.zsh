#!/bin/zsh

# source this script to be able to change directory

crypt_si='/home/mimosinnet/.config/sistema'
crypt_no='/mnt/sistema'
file='Codis.txt'

# Número de dia de l'any
dia=`date +%j`

if ! grep -q '/mnt/sistema fuse.gocryptfs' /etc/mtab
then
	 gocryptfs --idle 30m $crypt_si $crypt_no
fi
cp $crypt_no/$file $crypt_no/Segur/$dia$file
cd $crypt_no
