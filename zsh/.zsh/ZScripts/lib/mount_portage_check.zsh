# _mount_portage_check
# check if portage shares mounted
function _mount_portage_check() {
  local shares=(/etc/portage /var/db/repos /var/cache/binpkgs /var/cache/distfiles)
  local -i z=0
  for i ($shares)
  do
    grep -q $i /etc/mtab && z+=1
  done

  if [[ $z == 4 ]]
  then
    return 0
  else
    return 1
  fi
}
