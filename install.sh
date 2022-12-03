#!/bin/bash

tempdir=$(mktemp -d)
curl -L --output ${tempdir}/master.zip https://github.com/shiimaxx/dotfiles/archive/refs/heads/master.zip

mkdir -p ~/work/github.com/shiimaxx
cd $_
rm -rf dotfiles-master dotfiles
unzip ${tempdir}/master.zip -d .
mv dotfiles-master dotfiles

rm -rf ${tempdir}

ln -fs ~/work/github.com/shiimaxx/dotfiles/Brewfile ~/Brewfile
ln -fs ~/work/github.com/shiimaxx/dotfiles/alacritty.yml ~/.alacritty.yml
ln -fs ~/work/github.com/shiimaxx/dotfiles/gitconfig ~/.gitconfig
ln -fs ~/work/github.com/shiimaxx/dotfiles/gitignore ~/.gitignore
ln -fs ~/work/github.com/shiimaxx/dotfiles/tmux.conf ~/.tmux.conf
ln -fs ~/work/github.com/shiimaxx/dotfiles/vimrc ~/.vimrc
ln -fs ~/work/github.com/shiimaxx/dotfiles/zshrc ~/.zshrc

mkdir -p ~/.config
ln -fs ~/work/github.com/shiimaxx/dotfiles/config/starship.toml ~/.config/starship.toml
