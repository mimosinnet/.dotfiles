#!/bin/zsh

lib="${0:a:h}/lib"
source $lib/servidors.zsh
# provides $defined
source $lib/connection.zsh

readonly server=${1:?"Define what server do yo want to enter."}

_servidors $server
$defined \
  && echo "Entering server $server" \
  || { print "No server '$server' available"; exit; }

_connection $server 1964 || {  print "No connection to $server:1964" ; exit; }

tmux=$(ssh $server pgrep -c tmux)

if [[ $tmux = 0 ]]
then
  ssh $server
elif [[ $tmux > 0 ]]
then
  ssh $server -t tmux -u attach
else
  print "Error: $tmux, $server"
fi
