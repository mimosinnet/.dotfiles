#!/bin/zsh

# check if root and connection {{{
lib='/home/mimosinnet/Dades/Scripts/Actius/lib'
source $lib/check_root.zsh
source $lib/connection.zsh
if _connection mimoserver 2049
then
  print 'NFS server running'
else
  print 'NFS server is not running'
  exit
fi
# }}}

if [[ -d /etc/portage/env ]]
then
  Action='umount'
else
  Action="mount"
fi

print "\nBefore:\n"
mount | grep mimoserver

source $lib/mount_portage.zsh
_mount_portage $Action

print "\nAfter:\n"
mount | grep mimoserver

