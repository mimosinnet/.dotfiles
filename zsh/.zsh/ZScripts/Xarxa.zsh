#!/bin/zsh

muntat="nose"
tipus="nose"
dns_opendns="nameserver 208.67.222.222$'\n'nameserver 208.67.220.220"
dns_watch="nameserver 84.200.69.80$'\n'nameserver 84.200.70.40"
dns_google="nameserver 8.8.8.8$'\n'nameserver 8.8.4.4" 
dns_cloudfare="nameserver 1.1.1.1$'\n'nameserver 1.0.0.1" 
xarxa_rapida="/etc/init.d/net.enp6s0f0"

# informa de si tens muntat algun servidor {{{
# Muntat()
function Muntat() {
  if   $(mount | grep -q 'mimoserver')
  then
    muntat='mimoserver'
  elif $(mount | grep -q 'phenom')
  then
    muntat='phenom'
  else
    muntat='cap'
  fi
}
# }}}

# Informa del tipus de xarxa que fas servir {{{
function Tipus() {
  if   $(ip route | grep -q '192.168.10.104')
  then
    tipus='rapid'
  elif $(ip route | grep -q '192.168.12.104')
  then
    tipus='segur'
  else
    echo "Hi ha un problema en la funció Tipus"
  fi
}
# }}}

# Activa la xarxa segur {{{
function Segur() {
  if   [[ $tipus == 'segur' ]] ; then
    echo "Ja fas servir la xarxa segura"
  elif [[ $tipus == 'rapid' ]] ; then
    su -c "$xarxa_rapida stop"
    su -c "echo $dns_cloudfare > /etc/resolv.conf"
  else
    echo "hi ma un problema en la funció Segur"
  fi
}
# }}}

# Activa la xarxa rapida {{{
function Rapid() {
  # cas="$muntat-$tipus"
  case $tipus in
    segur)
      su -c "$xarxa_rapida start"
      su -c "echo $dns_opendns > /etc/resolv.conf"
      ;;
    rapid)
      echo "Ja fas servir la xarxa rápida" ;;
    nose)
      echo "Hi ha un problema en la funció Rapid";;
    *)
      echo "hi ma un problema en la funció Rapid";;
      # echo "Desmunta el servidor $muntat";;
  esac
}
# }}}

# scrip principal
# net <segur/rapid>
# rapid: enp6s0f0
# segur: net.lxcbr0
function Xarxa() {
  Tipus  ; echo "Tens activada la xara: $tipus"
  Muntat ; echo "Tens muntat el servidor: $muntat"
  if   [[ $1 == 'segur' ]]
  then
    Segur
  elif [[ $1 == 'rapid' ]]
  then
    Rapid
  else
    echo "les opcions són opcions: 'rapid' o 'segur'"
  fi
}

Xarxa $1
cat /etc/resolv.conf
