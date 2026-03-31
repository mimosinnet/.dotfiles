#!/usr/bin/env zsh

# revisar com és que no s'exporta etc/portage/repos.conf
# Llegir aquest post
# https://serverfault.com/questions/968802/access-files-with-client-that-are-bind-mounted-on-server-into-nfs-share

# Variables {{{

action=$1
chroot=$2
actions=(entra surt)
chroots=(fx g_desktop g_server phenom ryzen5)
chroot_dir="/mnt/chroot/$chroot"
export_dir="/mnt/export/$chroot"
mount_bind=(etc/portage/repos.conf run var/db/repos var/cache/distfiles)
mount_rbind=(sys dev tmp)
mount_export=(etc/portage var/cache/binpkgs)

# }}}

# messages {{{
message_usage="
Usage:
Chroot [$actions] [$chroots]'
"
message_info_chroot="
.zshrc and .zfunc/prompt executes the following after chroot
-------------------------------------------
source /etc/profile'
export PS1= (${chroot}_chroot) \$PS1
-------------------------------------------
"
message_end="Si aquest és l\'últim Chroot obert
Desmunta els directoris de <$chroot> en el servidor escrivint:
Chroot surt $chroot
"
# }}}

# check conditions {{{
# condition: 2 parameters and definition of action and root
if [[ ${#} == 2 ]] && (( $actions[(Ie)$action] && $chroots[(Ie)$chroot] )) 
then
  print "$action chroot $chroot"
else
  print $message_usage
  exit
fi

# condition: no other shares exists with the root names
if grep -q $chroot /etc/mtab && [[ $action != "surt" ]]
then
  print "Sharºes with $chroot"
  grep $chroot /etc/mtab
  read -q "?Continuar (y/n) " || exit
fi
# }}}

# functions _mount_rbind _mount_bind _umount _mount_check {{{

# _mount_rbind {{{
function _mount_rbind() {
  for i ($mount_rbind)
  do
    _mount_check "$chroot_dir/$i" || mount --rbind /$i $chroot_dir/$i
  done
}
# }}}

# _mount_bind {{{
function _mount_bind() {
  for i ($mount_bind)
  do
    _mount_check "$chroot_dir/$i" || mount --bind /$i $chroot_dir/$i
  done
}
# }}}

# _mount_export {{{
function _mount_export() {
  for i ($mount_export)
  do
    # echo "mount --bind $chroot_dir/$i $export_dir/$i"
    _mount_check "$export_dir/$i" || mount --bind "$chroot_dir/$i" "$export_dir/$i"
  done
}
# }}}

# _umount {{{
function _umount() {
  # https://unix.stackexchange.com/questions/29724/how-to-properly-collect-an-array-of-lines-in-zsh
  local mounts=("${(f)$(mount | grep "$chroot_dir/" | awk '{ print $3 }' )}")
  local mount_export=("${(f)$(mount | grep "$export_dir/" | awk '{ print $3 }' )}")
  mounts+=($mount_export)
  echo "\n"
  for i ($mounts)
  do
    umount -l $i
  done
  print -l $mounts
}
# }}}

# _mount_check {{{
function _mount_check() {
  local share=$1
  if fgrep -q $share /etc/mtab
  then
    return 0
  else
    return 1
  fi
}
# }}}

# }}}

# _Entra {{{
function _Entra() {
  # ATENCIÓ: no muntem en el client '/etc/portage/repos.conf'
  _mount_check $chroot_dir/proc || mount --types proc /proc $chroot_dir/proc
  _mount_rbind
  _mount_bind
  _mount_export
  print $message_info_chroot
  chroot $chroot_dir /bin/zsh
  print $message_end
}
# }}}

# _Surt {{{
function _Surt() {
  while [[ $answer != 'n' ]]
  do
    _umount
    read -k 1 "answer?Seguim (y/n)? "
  done

}
# }}}

case $action in
  entra)
    _Entra 
    ;;
  surt)
    _Surt
    ;;
  *)
    print 'SOMETHING WRONG'
    ;;
esac
