#!/bin/zsh

readonly uuid=${1:?'Please, define UUID'}
readonly origin=${2:?'Please, define origin folder'}
readonly destination=${3:?'Please, define destination folder'}
readonly option=${4:='test'}

readonly exclude='--exclude-from=/home/mimosinnet/Dades/Sistema/ExclouArxiusZotero.txt'
readonly today=$(date +'%Y.%m.%d_%T')
readonly backup="--backup-dir=$destination/backup/$today";

rsync_options='-anx'

# Check if share is already mounted {{{
function check_share() {
  grep -q $destination '/etc/mtab' \
    && return 0 \
    || return 1
}
# }}}

# Check uuid exists {{{
# get sorted (-x), UUID (-o)
lsbk=("${(f)$(lsblk -x UUID -o UUID)}")

if (( $lsbk[(Ie)$uuid] ))
then
  print "$uuid exist"
else
  print "$uuid does not exist"
  exit
fi
# }}}

# Mount destination folder {{{
if check_share 
then
  print "$destination already mounted"
  exit
else
  mount UUID=$uuid
fi

if check_share
then
  print "$destination mounted"
else
  print "Unable to mount $destination"
  exit
fi
# }}}

[[ $option == 'run' ]] && rsync_options='-ax'

rsync $rsync_options --info=name1,del,skip --backup --delete $exclude $backup $origin $destination

umount UUID=$uuid

if check_share
then
  print "ATTENTION: Unable to umount $destination"
else
  print "New backup of $origin on $destination"
fi

