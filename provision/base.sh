#!/bin/bash

sudo apt-get install -y tmux tree

cat <<EOF >> ~/.bashrc

if command -v tmux &> /dev/null && [ -n "\$PS1" ] && [[ ! "\$TERM" =~ screen ]] && [[ ! "\$TERM" =~ tmux ]] && [ -z "\$TMUX" ]; then
  exec tmux
fi
EOF