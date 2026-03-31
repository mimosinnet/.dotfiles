#!/usr/bin/env zsh

action=$1
actions=(test run)
option='axn'
[[ $action == 'run' ]] && option='ax'
uuid='7AC66ED8C66E93E3'
from='/home/mimosinnet/Dades/Documents/'
dir="/mnt/USB/$uuid"
to="$dir/Documents"
now=$(date +'%Y.%m.%d_%H:%M:%S')
exclude='--exclude-from=/home/mimosinnet/Dades/Sistema/ExclouArxiusSegurUSB.txt'
backup="--backup-dir=/mnt/USB/$uuid/segur_BKP/segur_Documents/$now"
blkid=$(/sbin/blkid | grep $uuid)
usage="
Usage: SegurUSB [test|run]
"

print "Date: $now"

# conditions {{{

# check number of parameters
[[ $# == 1 ]] || { print $usage ; exit }

# die if rsync running
while ps --no-headers -C rsync 
do
  print "rsync is running. Waiting 5 minutes..." 
  sleep 5m
done

# check options
(( $actions[(Ie)$action] )) || { print $usage ; exit }

# check usb exists
[[ $blkid =~ $uuid ]] || { print "usb $uuid does not exist" ; exit }

# create dir if it does noe exist
[[ -d $dir ]] || mkdir $dir

# }}}


if [[ $blkid =~ 'TYPE="ntfs"' ]]
then
  print "nfts share, mounting $uuid in $dir"
  mount -t ntfs-3g -o acl "UUID=$uuid" $dir
else
  print "you do not have an ntfs disk"
  exit
fi

grep -q /mnt/USB/$UUID /etc/mtab || { print "unable to mount $uuid" ; exit }

echo "rsync -$option --info=name1,del,skip --backup --delete $exclude $backup $from $to"
rsync -$option --info=name1,del,skip --backup --delete $exclude $backup $from $to

print "\nFree space:"
df -h --output=pcent,target $dir | grep '[0-9]%'
umount $dir
