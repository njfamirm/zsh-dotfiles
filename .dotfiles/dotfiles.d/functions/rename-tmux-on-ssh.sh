#!/usr/bin/env bash

ssh() {
  if [ $TMUX ]; then
    tmux rename-window ssh
    command ssh "$@"
    tmux set-window-option automatic-rename on 
  else
    command ssh "$@"
  fi
}
