#!/usr/bin/env zsh

W2='2: mail'

google-chrome-stable --new-window "https://outlook.office.com/calendar/view/workweek" "https://calendar.google.com/calendar" "https://www.google.com/finance/?hl=ca"

until swaymsg '[title="^Calendari.*"]' focus > /dev/null
do
  sleep 0.1
done

swaymsg '[title="^Calendari"]' focus, move to workspace $W2
