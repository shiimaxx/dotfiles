#!/bin/bash

tempdir=$(mktemp -d)
curl -L --output ${tempdir}/master.zip https://github.com/shiimaxx/dotfiles/archive/refs/heads/master.zip

mkdir -p ~/work/github.com/shiimaxx
cd $_
unzip ${tempdir}/master.zip -d .
mv dotfiles-master dotfiles
