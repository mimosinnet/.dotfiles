if [[ $UID == 0 && $EUID == 0 ]]
then
  print 'You are running as root'
else
  print 'You are not running as root'
  exit
fi
