#!/usr/bin/env bash

set -o errexit -o nounset

# Install tmux plugin manager
if [ ! -d ~/.tmux/plugins/tpm ]; then
  echo "Installing tmux plugin manager"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Install tmux plugins
if [ -e ~/.tmux/plugins/tpm/bin/install_plugins ] && [ -e ~/.tmux.conf ]; then
  echo "Installing tmux plugins"
  ~/.tmux/plugins/tpm/bin/install_plugins
fi

