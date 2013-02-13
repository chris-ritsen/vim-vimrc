#!/bin/zsh
source ~/.profile
source ~/.sprofile

function tmuxa()
{
  local remote=$1
  local session=$2

  if [[ $session == '' ]]; then
    session=$USER
  fi

  local host=$(hostname)

  local target="$session@$host"

  if [[ $remote == '' ]]; then
    remote=$(hostname) 
    tmux has-session -t $target && tmux -u2 a -t $target || tmux new -s $target
  else
    autossh -M0 -t $remote "tmux has-session -t $target 2> /dev/null && tmux -u2 a -t $target || tmux new -s $target" 2> /dev/null
  fi
  exit
}

