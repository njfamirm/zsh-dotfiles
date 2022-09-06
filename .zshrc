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
    echo "%B%F{#c5c5b6}λ%b"
  else
    echo "%B%F{#c5c5b6}#%b"
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
    echo "%F{#c5c5b6}in %B%F{#ff5555}$HOST%b"
  else
    echo "%F{#c5c5b6}in %B%F{#55a630}$HOST%b"
  fi
}

PROMPT="%B%F{#fcf300}%n%b $(host_prompt) %F{#c5c5b6}at %F{#ccff33}"'$(short_pwd)'"%F{reset_color} "'$(set_git_prompt)'$'\n'"$(set_prompt_symbol)%F{#ffffff} "
PROMPT2="$(set_prompt_symbol) "

# Git signed key
export GPG_TTY=$(tty)

ZSH_DISABLE_COMPFIX=true

# TODO
# env
# export GOPATH="/home/njfamirm/go"
# export GOROOT="/usr/lib/go"
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
