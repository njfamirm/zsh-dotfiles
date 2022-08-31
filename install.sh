#!/usr/bin/env bash
set -Eeuo pipefail
trap "echo '❌ Error'" ERR

echoStep () {
  echo "📍 $1..."
}

echoErr () {
  echo "❌ $1!"
}

if ! command -v apt-get >/dev/null 2>&1; then
  echoErr "sudo command not found"
  exit 127
fi

if [[ $OSTYPE == 'darwin'* ]]; then
  echoStep "Install home brew"
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
fi

PACKAGES="tmux tree vim zsh git"

echoStep "Install packages with package manager"
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
  echoErr "Cannot find package manager"
fi

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

