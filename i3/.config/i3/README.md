# i3wm_config

Configuration of i3 window manager

This configuration uses the numeric pad to go, move and open default applications to workspaces. The files in the folder "help files" outlines the keys used in each mode (see configuration file).

## logging

i3 outputs its log in _/var/log/i3_ with the command in ~/.xinitrc: 

exec /usr/bin/i3 -c ~/.config/i3/config > /var/log/i3/i3wm.log-$(date +'%F-%k-%M-%S') 2>&1

Remember to chown and chmod /var/log/i3 with the appropiate permissions. 
