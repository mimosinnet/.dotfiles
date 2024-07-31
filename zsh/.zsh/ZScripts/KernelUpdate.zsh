#!/usr/bin/env zsh

version='6.6.38'
# revision: '', '-r1', '-r2',..,
revision=''
system='gentoo'
remote='/mnt/chroot/ryzen5'
# remote='/mnt/chroot/phenom'
# remote='/mnt/chroot/generic'
server='mimory'
port=1964
usuari='root'

# lib {{{
lib="${0:a:h}/lib"
source $lib/ask.zsh
source $lib/check_root.zsh
# }}}

# Check for connection {{{
# _connection server port
# returns 0 if no connection
source $lib/connection.zsh
if ! _connection $server $port 
then
  print "No connection to $server:$port"
  exit
fi
# }}}

# Mount Portage {{{
if ! [[ -d /etc/portage/env ]]
then
  print "I will mount portage"
  source $lib/mount_portage.zsh
  _mount_portage "mount"
fi
# }}}

# _rsync {{{
# for testing
function _rsync() {
    echo "rsync -av $1 $2"
    rsync -av $1 $2
}
# }}}

# Set Variables {{{
kernel="$version-${system}$revision"
package="sys-kernel/$system-sources:$version$revision"
packages=$(qlist -ICS $system-sources)
from="$usuari@$server"
boot='/boot'
boot_remote="$remote/boot"
config_local="/usr/src/linux-$kernel/.config"
config_remote="$remote$config_local"
modules_local="/lib/modules/$kernel-x86_64"
modules_remote="${remote}${modules_local}/"
# }}}

# Print info {{{
print "
Current kernel = $(uname -r)
    New kernel = $kernel-x86_64

Installed Kernels
-----------------
$packages
-----------------
"
# }}}

_ask "Install $package and copy configuration" || exit

# Mount boot {{{
[[ -f '/boot/grub/grub.cfg' ]] || mount $boot

if ! [[ -f '/boot/grub/grub.cfg' ]] 
then
  print 'Unable to mount boot'
  exit
fi
# }}}

# Install kernel {{{
if [[ $packages =~ $package ]]
then
  print "You have this package already installed: $package"
else
  print "Installing $package"
  emerge --getbinpkgonly --update $package
  packages=$(qlist -ICS $system-sources)
  if ! [[ $packages =~ $package ]]
  then
    print "Unable to install $package"
    exit
  fi
fi
# }}}

# Copy configuration {{{
_ask "copy .config"     && rsync -av $from:$config_remote $config_local
_ask "copy boot"        && rsync -av "$from:$boot_remote/*-$kernel-x86_64*" $boot
_ask "rsync modules"    && rsync -av --delete $from:$modules_remote $modules_local
_ask "module-rebuild"   && emerge --getbinpkgonly @module-rebuild
_ask "create grub menu" && grub-mkconfig -o /boot/grub/grub.cfg
_ask "umount /boot"     && umount $boot
# }}}
