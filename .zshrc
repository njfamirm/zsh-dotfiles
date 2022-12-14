export ZSH="$HOME/.oh-my-zsh"

zstyle ':omz:update' mode reminder

source $ZSH/oh-my-zsh.sh

# Tmux plugin config
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=true

DOTFILES=~/.dotfiles
for config_file ("$DOTFILES"/dotfiles.d/**/*.*sh); do
  source "$config_file"
done
unset config_file

# zsh-z
set $_Z_MAX_SCORE 1000
autoload -U compinit && compinit

# prompt

set_prompt_symbol() {
  if [ $EUID -ne "0" ]; then
    echo "%B%F{#fdf6e3}λ%b"
  else
    echo "%B%F{#fdf6e3}#%b"
  fi
}

short_pwd() {
  pwd="${${(s:/:)PWD}[-2]}/${PWD:t}"
  if [ "$PWD" = "$HOME" ]
  then
    pwd='~'
  fi
  echo "%U%B$pwd%b%u"
}

host_prompt() {
  if [ $SSH_CLIENT ]; then
    echo "%F{#859289}in %B%F{#a7c080}$HOST%b"
  else
    echo "%F{#859289}in %B%F{#8da101}$HOST%b"
  fi
}

PROMPT="%B%F{#ffd7b0}%n%b $(host_prompt) %F{#859289}at %F{#d75f5e}"'$(short_pwd)'"%F{reset_color} "'$(set_git_prompt)'$'\n'"$(set_prompt_symbol)%F{#ffffff} "


# Git signed key
export GPG_TTY=$(tty)

ZSH_DISABLE_COMPFIX=true

# TODO
# env
# export GOPATH="/home/njfamirm/go"
# export GOROOT="/usr/lib/go"
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

echo "salam"
