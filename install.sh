#!/bin/sh

set -eu

sudo apt update
sudo apt upgrade -y

sudo apt-get install -y build-essential wget zsh

# install oh-my-zsh
if [ ! -d ${HOME}/.oh-my-zsh ]; then
    echo "installing oh-my-zsh..."
    sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
fi

echo "installing zsh plugins..."
PLUGINS_DIR=${HOME}/.oh-my-zsh/custom/plugins

# zsh-autosuggestions
if [ ! -d ${PLUGINS_DIR}/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${PLUGINS_DIR}/zsh-autosuggestions
fi
# zsh-syntax-highlighting
if [ ! -d ${PLUGINS_DIR}/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${PLUGINS_DIR}/zsh-syntax-highlighting
fi

# change default shell
# if [ "$SHELL" != "$(which zsh)" ]; then
# chsh -s $(which zsh) || echo "Please try running chsh -s $(which zsh)"
sudo chsh ubuntu -s "/usr/bin/zsh"
# fi

# create symbolic links

cd ~/

ln -fs ~/dotfiles/.zshrc .
ln -fs ~/dotfiles/.gitconfig .