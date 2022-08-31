#!/bin/bash

git clone --bare --recurse-submodules https://github.com/njfamirm/dotfiles ~/.dotfiles
function dtf {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
dtf checkout --force
if [ $? = 0 ]; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
fi;
dtf config status.showUntrackedFiles no

PACKAGES="tmux tree vim git zsh"

# Install packages with apt
if command -v apt-get >/dev/null 2>&1; then
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get -y install $PACKAGES
elif command -v brew >/dev/null 2>&1; then
  brew update
  brew upgrade
  brew install $PACKAGES
elif command -v apk >/dev/null 2>&1; then
  sudo apk update
  sudo apk upgrade
  sudo apk add $PACKAGES
else
  echo "Cannot find supported package manager for install $PACKAGES"
fi

# Install oh-my-zsh (https://github.com/ohmyzsh/ohmyzsh)
if [ ! -d ~/.oh-my-zsh ];then
  git clone https://github.com/ohmyzsh/ohmyzsh .oh-my-zsh
fi
