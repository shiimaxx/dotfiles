#!/bin/bash

ln -fs ~/work/github.com/shiimaxx/dotfiles/Brewfile ~/Brewfile
ln -fs ~/work/github.com/shiimaxx/dotfiles/gitconfig ~/.gitconfig
ln -fs ~/work/github.com/shiimaxx/dotfiles/gitignore ~/.gitignore
ln -fs ~/work/github.com/shiimaxx/dotfiles/tmux.conf ~/.tmux.conf
ln -fs ~/work/github.com/shiimaxx/dotfiles/vimrc ~/.vimrc
ln -fs ~/work/github.com/shiimaxx/dotfiles/wezterm.lua ~/.wezterm.lua
ln -fs ~/work/github.com/shiimaxx/dotfiles/zshrc ~/.zshrc

mkdir -p ~/.config
ln -fs ~/work/github.com/shiimaxx/dotfiles/config/starship.toml ~/.config/starship.toml
