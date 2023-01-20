#!/usr/bin/env bash
set -Eeuo pipefail
trap "echo ' Error'" ERR

echo -e "
██████╗░░█████╗░████████╗███████╗██╗██╗░░░░░███████╗░██████╗
██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██║██║░░░░░██╔════╝██╔════╝
██║░░██║██║░░██║░░░██║░░░█████╗░░██║██║░░░░░█████╗░░╚█████╗░
██║░░██║██║░░██║░░░██║░░░██╔══╝░░██║██║░░░░░██╔══╝░░░╚═══██╗
██████╔╝╚█████╔╝░░░██║░░░██║░░░░░██║███████╗███████╗██████╔╝
╚═════╝░░╚════╝░░░░╚═╝░░░╚═╝░░░░░╚═╝╚══════╝╚══════╝╚═════╝░
"

echoErr() {
  echo -e "🔴 $@"
}

echoInfo() {
  echo -e "🟡 $@"
}

echoStep() {
  echo -e "\n🔨 $@"
}

echoSuccess() {
  echo -e "✅ $@"
}

DOTFILES=".dotfiles"

echoStep "Install dotfiles"
if [ ! -d "~/$DOTFILES" >/dev/null 2>&1 ];then
  echoInfo "Clone dotfiles"
  git clone --bare https://github.com/njfamirm/dotfiles "~/$DOTFILES"


  function dtf {
    git --git-dir="~/$DOTFILES/" --work-tree="~/" $@
  }

  echoSuccess "Dotfiles installed"

  echoStep "Checkout dotfiles files"
  dtf checkout --force
  echoSuccess "Dotfiles Checkouted"
else
  echoInfo "Dotfiles already installed in \`$DOTFILES\`"
  echoInfo "Update dotfiles"

  function dtf {
    git --git-dir="~/$DOTFILES/" --work-tree="~/" $@
  }

  dtf pull --prune --progress --autostash
  echoSuccess "Dotfiles updated"
fi

dtf config status.showUntrackedFiles no

echoStep "Install oh-my-zsh..."
OMZ_PATH=".oh-my-zsh"
if [ ! -d ~/.oh-my-zsh >/dev/null 2>&1 ];then
  git clone https://github.com/ohmyzsh/ohmyzsh $OMZ_PATH
  echoSuccess "oh-my-zsh installed"
else
  echoInfo "oh-my-zsh was already installed"
  echoInfo "Update oh-my-zsh..."
  git -C $OMZ_PATH pull
  echoSuccess "oh-my-zsh updated"
fi

# install z command
Z_COMMAND_PATH=$DOTFILES/dotfiles.d/plugin/z/
echoStep "Install z command"
if [ ! -d "$Z_COMMAND_PATH" >/dev/null 2>&1 ];then
  git clone https://github.com/rupa/z.git $Z_COMMAND_PATH
  echoSuccess "Z command installed"
else
  echoInfo "Z was already installed"
  echoInfo "Update z command"

  git -C $Z_COMMAND_PATH pull
  echoSuccess "Z command updated"
fi

sudo ~/.dotfiles/install-packages.sh
