# check server list
# _check_server server
 
function _check_server() {
  local server=$1
  local servers=(mimoserver phenom mimofeina12w mimouab generatech mimory nisomim)
  if (( $servers[(Ie)$server] ))
  then
    return 0
  else
    print "No server '$server' available"
    exit
  fi
}

