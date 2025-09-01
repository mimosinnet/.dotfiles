# $1: url
# $2: port
# $3: session name
function Connection() {
  if tcp_open -q $1 $2 $3
  then
    tcp_close -q $3
    return 0
  else
    return 1
  fi
}
