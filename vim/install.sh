#!/usr/bin/env bash

set -o errexit -o nounset

# Create vim directory structure
if [ ! -d ~/.vim ]; then
	mkdir -p ~/.vim/tmp
        mkdir -p ~/.vim/pack/plugins/start
fi

if [ ! -d ~/.vim/pack/plugins/start/vim-toml ]; then
        git clone https://github.com/cespare/vim-toml.git ~/.vim/pack/plugins/start/vim-toml
else
        echo Updating vim-toml plugin
        pushd ~/.vim/pack/plugins/start/vim-toml
        git pull
        popd
fi

