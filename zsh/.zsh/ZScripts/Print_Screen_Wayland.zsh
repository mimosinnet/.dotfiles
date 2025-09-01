#!/bin/zsh

actions=(root area window delay)
option=${1:?"Define action: root area window delay."}

if ! (( $actions[(Ie)$option] ))
then
  echo "You have to choose among these $actions"
  exit
fi

now=$(date +'%Y.%m.%d_%H.%M.%S')
file="/home/mimosinnet/Dades/ScreenShots/$now.png";

function print_window() {
  window=$(xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)" | sed 's/_NET_ACTIVE_WINDOW(WINDOW): window id # //')
  import -window $window $file;
}

case $option in
  root)
    grim - | tee $file | wl-copy ;;
  area)
    grim -g "$(slurp)" - | tee  $file | wl-copy ;;
  window)
    window=$(swaymsg -t get_tree | jq -r '.. | select(.focused?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')
    grim -g $window - | tee  $file | wl-copy ;;
  delay)
    window=$(slurp)
    sleep 5
    grim -g $window - | tee $file | wl-copy ;;
esac

zenity --info --title "ScreenShot $option" --timeout 5 --text "Screenshot in clipboard, and saved in $now.png"

