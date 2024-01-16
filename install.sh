!/usr/bin sh

set -eu

sudo apt update -y
sudo apt upgrade -y

curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get update

sudo apt-get install -y build-essential wget zsh git-lfs
git lfs install

# install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# create symbolic links
cd ${HOME}/dotfiles

for file in .??*; do
    [ ${file} == '.git' ] && continue
    [ ${file} == '.gitignore' ] && continue
    ln -fs ${PWD}/${file} ${HOME}
done
