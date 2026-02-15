# check for connection to $server / 
# _connection server port
 
autoload -U tcp_open
lib_connection="${0:a:h}"
# Provides ip, MAC and defined
source $lib_connection/servidors.zsh

# returns 0 if connection is established
function _connection() {
  local server=$1
  local port=$2
  _servidors $server
  $defined || { print "No server '$server' available"; exit; }
  if tcp_open -q $server $port connection
  then
    tcp_close -ql connection
    return 0
  else
    return 1
fi
}

