#!/bin/sh

set -eu

sudo apt update -y
sudo apt upgrade -y

sudo apt-get install -y build-essential wget zsh

# install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# create symbolic links

cd ~/

ln -fs ~/dotfiles/.zshrc .
ln -fs ~/dotfiles/.gitconfig .