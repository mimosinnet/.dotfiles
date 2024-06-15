#!/usr/bin/env zsh

dir=/home/mimosinnet/Dades/IntercanviWin/Presentacions

tmux new-session -d -s presentacions -c $dir
tmux new-window  -d -t presentacions -c $dir/000
tmux new-window -d -t presentacions -c $dir
tmux new-window -d -t presentacions -c $dir
tmux new-window -d -t presentacions -c $dir
tmux attach-session -t presentacions
