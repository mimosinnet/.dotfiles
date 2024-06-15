#!/bin/zsh

from='/home/mimosinnet/Dades/IntercanviWin/Presentacions'
to_mimouab='mimosinnet@mimouab:/home/mimosinnet/Dades/Webs'
to_generatech='mimosinnet@generatech:/home/mimosinnet/Dades/Webs'

lib="${0:a:h}/lib"
# funció _continuar
source $lib/continuar.zsh

# sincronitzar servidor ip to {{{
# $1: servidor
# $2: ip
# $3: to
function sincronitzar() {
  local servidor=$1
  local ip=$2
  local to_servidor=$3
  print "Sincronitzar amb $servidor"
  _continuar

  autoload -U tcp_open

  if tcp_open -q $ip 1964 $servidor
  then
    tcp_close -ql $servidor

    rsync -anv --delete $from $to_servidor

    _continuar

    rsync -av --delete $from $to_servidor
  else
    print "No hi ha connexió amb $servidor"
  fi
}
# }}}

sincronitzar mimouab    158.109.145.115 $to_mimouab
sincronitzar generatech 158.109.152.23  $to_generatech

