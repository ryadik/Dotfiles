#!/bin/bash
session="workspace"
tmux new-session -d -s $session

window=1
tmux rename-window -t $session:$window 'vim'
tmux send-keys -t $session:$window 'figlet NeoVim | lolcat' Enter


window=2
tmux new-window -t $session:$window -n 'node'
tmux send-keys -t $session:$window 'figlet NodeJS | lolcat' Enter


window=3
tmux new-window -t $session:$window -n 'git'
tmux send-keys -t $session:$window 'figlet Git | lolcat' Enter

tmux attach-session -t $session
