function LibreOffice() {
  local File=$1
  local Path
  # if $File is not empty
  if [ ! -z $File ]
  then
    local Path=$(readlink -f $File)
  fi
  /usr/local/bin/LibreOffice-fresh.full-x86_64.AppImage $Path
}
