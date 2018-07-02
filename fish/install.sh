#!/usr/bin/env bash

set -o errexit -o nounset

if [ -f /usr/bin/fish ]; then
    echo "setting up fish"
    /usr/bin/fish $(dirname $(realpath $0))/setup.fish
fi
