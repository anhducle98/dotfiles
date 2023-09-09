#!/bin/bash

set -e
set -o pipefail

git submodule update --init --recursive
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/wezterm.lua ~/.wezterm.lua
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
