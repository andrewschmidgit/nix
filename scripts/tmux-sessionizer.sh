#!/bin/sh

command -v tmux >/dev/null || { echo "tmux not installed, exiting"; exit 1; }
command -v fzf >/dev/null || { echo "fzf not installed, exiting"; exit 1; }

if [ $# -eq 1 ]; then
  path=$1
else
  path=$(find ~/src -maxdepth 2 -type d -name .git -exec dirname {} + -prune | fzf)
fi

if [ -z $path ]; then
  exit 0
fi

name="$(basename $path | tr . _)"

echo $name

if ! tmux has-session -t "$name" 2>/dev/null; then
  # if session doesn't exist, create it
  tmux new-session -dc "$path" -s "$name"
fi

if [ -n "$TMUX" ]; then
  tmux switch-client -t "$name" || { echo "Failed to switch to session"; exit 1; }
else
  tmux attach-session -t "$name" || { echo "Failed to attach to session"; exit 1; }
fi
