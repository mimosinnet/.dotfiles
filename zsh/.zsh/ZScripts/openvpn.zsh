#!/bin/zsh

webview=$(npm start xpv.uab.cat:443 --prefix /home/mimosinnet/Dades/Scripts/Nodejs/openfortivpn-webview/openfortivpn-webview-electron)
cookie=$(echo $webview | grep SVPNCOOKIE | sed 's/SVPNCOOKIE//')
# echo $cookie > cookie.txt

sleep 15

su -c "openfortivpn xpv.uab.cat:443 --cookie '$cookie'"
