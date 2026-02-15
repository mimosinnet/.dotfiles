#!/usr/bin/env zsh

dir=/home/mimosinnet/Dades/IntercanviWin/Presentacions
pres='presentacions'

# start tmux session
tmux new-session -d -s $pres -c $dir

# start windows
for i in {1..5}
do
  tmux new-window  -d -t $pres -c $dir
done

# Select window 1 and attach to the session
tmux select-window -t "$pres:1"
tmux attach-session -t $pres
