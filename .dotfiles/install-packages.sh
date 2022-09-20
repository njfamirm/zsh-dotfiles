#!/usr/bin/env bash
set -Eeuo pipefail
trap "echo ' Error'" ERR

if [ "$EUID" != 0 ]
  then echo "Please run as root."
  exit 2
fi

echoStep () {
  echo "$1..."
}

echoErr () {
  echo " $1!"
}

if [[ $OSTYPE == 'darwin'* ]]; then
  echoStep "Install home brew"
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
fi

PACKAGES="tmux tree vim zsh git sudo"

echoStep "Install packages with package manager"
if command -v apt-get >/dev/null 2>&1; then
  apt-get update
  apt-get upgrade
  apt-get -y install $PACKAGES
elif command -v brew >/dev/null 2>&1; then
  brew update
  brew upgrade
  brew install $PACKAGES
elif command -v apk >/dev/null 2>&1; then
  apk update
  apk upgrade
  apk add $PACKAGES
else
  echoErr "Cannot find package manager"
fi
