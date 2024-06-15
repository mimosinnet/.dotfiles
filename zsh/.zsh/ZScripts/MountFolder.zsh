#!/usr/bin/env zsh

# _mount_folder {{{
function _mount_folder() {

  # folder in 
  grep -q $folder /etc/fstab || { print "$folder not in /etc/fstab" ; exit }

  grep -q $folder /etc/mtab  \
    && { mount='umount -l' } \
    || { mount='mount'     }

  print "$mount $folder\n"
  print "Before: $(grep $folder /etc/mtab)"
  eval "$(print $mount $folder)"
  print "After:  $(grep $folder /etc/mtab)"
}
# }}}

if [[ ${#} == 1 ]]
then
  folder=$1
  _mount_folder
else
  print "usage: MountFolder folder"
fi

