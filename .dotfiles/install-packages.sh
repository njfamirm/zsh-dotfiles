#!/usr/bin/env bash

set -Eeuo pipefail
trap "echo ' Error'" ERR

# if [ "$EUID" != 0 ]
#   then echo "Please run as root."
#   exit 2
# fi

if [[ $OSTYPE == 'darwin'* ]]; then
  if ! command -v brew >/dev/null 2>&1; then
    echo "Install home brew..."
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
  fi
fi

PACKAGES="tmux tree vim zsh git sudo curl wget"

echo "Select package manager..."
if command -v apt-get >/dev/null 2>&1; then
  echo "Install packages with apt"
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get -y install $PACKAGES
elif command -v brew >/dev/null 2>&1; then
  echo "Install packages with brew"
  brew update
  brew upgrade
  brew install $PACKAGES
elif command -v apk >/dev/null 2>&1; then
  echo "Install packages with apk"
  sudo apk update
  sudo apk upgrade
  sudo apk add $PACKAGES
else
  echo "Cannot find package manager!"
fi

# Install vimPlug
VIMPLUG_PATH="~/.vim/autoload/plug.vim"
if [ ! -d "$VIMPLUG_PATH" >/dev/null 2>&1 ];then
  curl -fLo $VIMPLUG_PATH --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# FIXME:
# vim +PlugInstall +qall
