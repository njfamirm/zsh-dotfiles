#!/usr/bin/env bash
set -Eeuo pipefail
trap "echo ' Error'" ERR

echoStep () {
  echo "$1..."
}

echoErr () {
  echo " $1!"
}

echoStep "Clone dotfile repo"
git clone --bare --recurse-submodules --jobs 8 https://github.com/njfamirm/dotfiles ~/.dotfiles
function dtf {
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

echoStep "Checkout files"
dtf checkout --force

dtf config status.showUntrackedFiles no

echoStep "Clone Submodule"
dtf submodule init
dtf submodule update

if [ ! -d ~/.oh-my-zsh >/dev/null 2>&1 ];then
  echoStep "Clone oh-my-zsh"
  git clone https://github.com/ohmyzsh/ohmyzsh .oh-my-zsh
fi

sudo ~/.dotfiles/install-packages.sh
