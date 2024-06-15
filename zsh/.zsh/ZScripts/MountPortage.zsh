#!/bin/zsh

# check if root and connection {{{
lib="${0:a:h}/lib"
source $lib/check_root.zsh
source $lib/connection.zsh
if _connection mimory 111
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
mount | grep mimory

print "\nAction: $Action\n"

source $lib/mount_portage.zsh
_mount_portage $Action

print "\nAfter:\n"
mount | grep mimory

