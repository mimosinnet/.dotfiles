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
  
  $Mount '/etc/portage'
  $Mount '/var/db/repos'
  $Mount '/var/cache/binpkgs'
  $Mount '/var/cache/distfiles'
}
