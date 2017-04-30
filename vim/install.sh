#!/usr/bin/env bash

set -o errexit -o nounset

# Create vim directory structure
if [ ! -d ~/.vim ]; then
	mkdir -p ~/.vim/tmp
fi

