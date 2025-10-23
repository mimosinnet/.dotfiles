# mount portage $Mount 
# $Mount: mount || umount -f
function _mount_portage {
  local Action=$1
  case $Action in
    mount)
      local Mount='mount'
      ;;
    umount)
      local Mount=('umount' '-f')
      ;;
    *)
      print "Wrong command in funtion _mount_portage: -$Action-"
      ;;
  esac

  local Repos='/etc/portage/repos.conf'
  # repos.conf s'ha de desmontar al principi i montar al final
  [[ $Action == "umount" ]] && $Mount -v $Repos
  $Mount -v '/etc/portage'
  $Mount -v '/var/db/repos'
  $Mount -v '/var/cache/binpkgs'
  $Mount -v '/var/cache/distfiles'
  [[ $Action == "mount" ]] && $Mount -v $Repos
}
