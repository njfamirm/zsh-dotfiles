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

DOTFILES="$HOME/.dotfiles/"

function dtf {
  git --git-dir="$DOTFILES" --work-tree="$HOME/" $@
}

echoStep "Install dotfiles"
if [ ! -d "$DOTFILES" ] >/dev/null 2>&1; then
  echoInfo "Clone dotfiles"
  git clone --bare https://github.com/njfamirm/dotfiles "$DOTFILES"
  echoSuccess "Dotfiles installed"

  echoStep "Checkout dotfiles files"
  dtf checkout --force
  echoSuccess "Dotfiles Checkouted."
else
  echoInfo "Dotfiles already installed in \`$DOTFILES\`"
  echoInfo "Update dotfiles"

  dtf pull --prune --progress --autostash
  echoSuccess "Dotfiles updated."
fi
dtf config status.showUntrackedFiles no

# install z command
Z_COMMAND_PATH=$DOTFILES/dotfiles.d/plugins/z/
echoStep "Install z command"
if [ ! -d "$Z_COMMAND_PATH" ] >/dev/null 2>&1; then
  mkdir -p "$Z_COMMAND_PATH"
  curl -o "$Z_COMMAND_PATH/z.sh" https://raw.githubusercontent.com/rupa/z/v1.9/z.sh
  echoSuccess "Z command installed"
else
  echoInfo "Z was already installed"
fi

$HOME/.dotfiles/install-packages.sh
