#!/bin/zsh

process=rsync

# Do not exit if rsync backup is running
while ps -C $process | grep -q $process
do
  zenity --warning --title "Wait.." --timeout 3 \
  --text '<span color="red" weight="bold">rsync backup in process</span>. <span weight="bold">Do not quit!</span>'
  sleep 3
done

# Do not exit if nfs shares are mounted
if mount | grep -q nfs4
then
  zenity --warning --title "Unable to quit.." --text "There are nfs shares mounted."
# Do not exit if memory is running
elif nc -zw1 192.168.12.103 1964
then
  zenity --warning --title "Unable to quit.." --text "Mimory server is on."
else
  option=$(zenity --info --text "What do you want to do?" \
    --ok-label  Cancel \
    --extra-button Quit \
    --extra-button Reboot )

  case $option in
    Quit)   loginctl poweroff ;;
    Reboot) loginctl reboot   ;;
  esac
fi
