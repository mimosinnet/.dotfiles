#!/usr/bin/env zsh

ps='ps --no-headers -C gvim'

# gvim &
# pid=$!

pid=21178

eval $ps
print $pid



swaymsg "[pid=$pid]" focus
print $(swaymsg "[pid=$pid]" focus)
exit


until swaymsg "[pid=$pid]" focus > /dev/null
do
  print $(swaymsg "[pid=$pid]" focus)
  sleep 0.1
done
# swaymsg move container to workspace '1: Files'

exit


#  swaymsg -t get_tree | jq -r '.. | select(.focused? == true) | .name? '
#  swaymsg -t get_tree | jq -r '.. | select(.name? == "[Sense nom] - GVIM")'
#  swaymsg -t get_tree | jq -r '.. | select(.name? == "[Sense nom] - GVIM") | .pid?'
#  https://stackoverflow.com/questions/43259563/how-to-check-if-element-exists-in-array-with-jq

print $pid
eval $ps

exit

print "Before"
eval $ps


print "pid: $pid"

eval $ps
exit

swaymsg for_window "[pid=$pid]" workspace '1: Files'

print "After"
a=0
while [[ $a -lt 10 ]]
do
  a=$(( $a + 1 ))
  print $a
  eval $ps
done

exit


print $pid

ps $ps
swaymsg for_window "[pid=$pid]" focus
swaymsg for_window "[pid=$pid]" workspace '1: Files'
ps -C gvim


until swaymsg "[pid=$pid]" focus >/dev/null   
do
  sleep 0.1        
done





exit

