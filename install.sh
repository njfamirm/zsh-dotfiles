#!/usr/bin/env bash
set -Eeuo pipefail
trap "echo ' Error'" ERR

DOTFILES=".dotfiles"

echo "Install dotfiles..."
if [ ! -d "~/$DOTFILES" >/dev/null 2>&1 ];then
  echo "Clone dotfiles..."
  git clone --bare https://github.com/njfamirm/dotfiles "~/$DOTFILES"


  function dtf {
    git --git-dir="~/$DOTFILES/" --work-tree="~/" $@
  }
  echo "Dotfiles installed..."
else
  echo "Dotfiles already installed in \`$DOTFILES\`"
  echo "Update dotfiles..."

  function dtf {
    git --git-dir="~/$DOTFILES/" --work-tree="~/" $@
  }

  dtf pull --prune --progress --autostash
  echo "Dotfiles updated..."
fi


echo "Checkout files..."
dtf checkout --force

dtf config status.showUntrackedFiles no

echo "Install oh-my-zsh..."
if [ ! -d ~/.oh-my-zsh >/dev/null 2>&1 ];then
  git clone https://github.com/ohmyzsh/ohmyzsh .oh-my-zsh
  echo "oh-my-zsh installed..."
else
  echo "oh-my-zsh was already installed."
  echo "Update oh-my-zsh..."
  omz update
  echo "oh-my-zsh updated..."
fi

# install z command
Z_COMMAND_PATH=$DOTFILES/dotfiles.d/plugin/z/
echo "Install z command..."
if [ ! -d "$Z_COMMAND_PATH" >/dev/null 2>&1 ];then
  git clone https://github.com/rupa/z.git $Z_COMMAND_PATH
  echo "Z command installed..."
else
  echo "Z was already installed..."
  echo "Update z command..."

  git -C $Z_COMMAND_PATH pl
  echo "Z command updated..."
fi

# sudo ~/.dotfiles/install-packages.sh
