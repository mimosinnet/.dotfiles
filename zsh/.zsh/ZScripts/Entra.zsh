#!/bin/zsh

servers=(mimoserver fx  phenom mimomini12w nisomim12w mimofeina mimouab mimory generatech mimofire)
echo "Available servers: $servers\n"
readonly server=${1:?"Define what server do yo want to enter."}

(( $servers[(Ie)$1] )) \
  && echo "Entering server $server" \
  || ( echo "Server $server not defined"; exit )

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
