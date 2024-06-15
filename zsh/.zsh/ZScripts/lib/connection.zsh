# check for connetion to $url / 
# _connection server port
 
# url='markets.businessinsider.com'
autoload -U tcp_open

# returns 0 if no connection
function _connection() {
  local server=$1
  local port=$2
  local servers=(mimoserver phenom mimofeina mimouab generatech mimory nisomim mimomini)
  if ! (( $servers[(Ie)$server] ))
  then
    print "No server '$server' available"
    exit
  fi
  if tcp_open -q $server $port connection
  then
    tcp_close -ql connection
    return 0
  else
    return 1
fi
}

