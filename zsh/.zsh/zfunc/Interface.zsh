function Interface() {
  if   [[ $1 == "segur" ]]
  then
    su -c "/etc/init.d/net.enp9s0 start"
    su -c "/etc/init.d/net.enp6s0f0 stop"
    ip route
  elif [[ $1 == "rapid" ]]
  then
    su -c "/etc/init.d/net.enp6s0f0 start"
    su -c "/etc/init.d/net.enp9s0 stop"
    ip route
  else 
    echo "Hi ha un error"
  fi
}

