#!/bin/bash

tempdir=$(mktemp -d)
curl -L --output ${tempdir}/master.zip https://github.com/shiimaxx/dotfiles/archive/refs/heads/master.zip

mkdir -p ~/work/github.com/shiimaxx
cd $_
rm -rf dotfiles-master dotfiles
unzip ${tempdir}/master.zip -d .
mv dotfiles-master dotfiles

rm -rf ${tempdir}

curl https://raw.githubusercontent.com/shiimaxx/dotfiles/master/install-local.sh | bash
