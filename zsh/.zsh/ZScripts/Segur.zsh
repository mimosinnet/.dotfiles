#!/bin/zsh

zparseopts -D -F -A opt -- -name: -uuid: -exclude: -origin: -destination: -action:

readonly z_opt=6
readonly name=${opt[--name]:?'Plese, set a name for the backup'}
readonly uuid=${opt[--uuid]:?'Please, define UUID'}
exclude=${opt[--exclude]:?'Pleas, define exclude_from filename'}
readonly origin=${opt[--origin]:?'Please, define origin folder'}
readonly destination=${opt[--destination]:?'Please, define destination folder'}
readonly action=${opt[--action]:='test'}

exclude="--exclude-from=$exclude"
readonly today=$(date +'%Y.%m.%d_%H.%M.%S')
readonly backup="--backup-dir=$destination/bkp_$name/$today";

usage='
USAGE: 

  Segur --name name --uuid uuid --exclude exclude_from --origin from_directory --destination to_directori --action [test|run]
'
message="
  backup $today
  --name $name
  --uuid $uuid 
  --exclude $exclude 
  --origin $origin 
  --destination $destination 
  --action $action
"

if [[ $#opt -ne $z_opt ]]
then
  print $usage
  exit
else
  print $message
fi

rsync_options='-anx'

# Check if share is already mounted {{{
function _check_share() {
  grep -q $destination '/etc/mtab' \
    && return 0 \
    || return 1
}
# }}}

# Check uuid exists {{{
# get sorted (-x), UUID (-o)
lsbk=("${(f)$(lsblk -x UUID -o UUID)}")

(( $lsbk[(Ie)$uuid] )) \
  && print "$uuid exist" \
  || ( print "$uuid does not exist" ; exit )
# }}}

# Mount destination folder {{{
_check_share \
  && ( print "$destination already mounted" ; exit ) \
  || mount UUID=$uuid 

_check_share \
  && print "$destination mounted" \
  || print "Unable to mount $destination"
# }}}

[[ $action == 'run' ]] && rsync_options='-ax'

echo "rsync $rsync_options --info=name1,del,skip --backup --delete \n  $exclude \n  $backup \n  $origin \n  $destination \n"
rsync $rsync_options --info=name1,del,skip --backup --delete $exclude $backup $origin $destination

umount UUID=$uuid

if _check_share
then
  print "ATTENTION: Unable to umount $destination"
else
  print "New backup of $origin on $destination"
fi

