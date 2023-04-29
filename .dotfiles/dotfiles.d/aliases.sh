alias cp='cp -i'
alias df='df -h'
alias y='yarn'
alias g="git"
alias mkdir="mkdir -p"
alias d=docker
alias doc="docker compose"
alias c="printf '\33c\e[3J'"
alias q="tmux detach-client"
alias e="exit"
alias s=sudo
alias ls="ls --color='auto'"
alias ll="ls -altrh --color='auto'"
alias m=make
alias tm="tmux"
alias reload="exec zsh"
alias v=vim
alias vi=vim
alias cdl="cd -"
alias random="openssl rand -hex 32 | pbcopy"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias tunnel="close-tunnel >/dev/null 2>&1; ssh -M -S /tmp/tunnel -fND 0.0.0.0:1080 srv2"
alias close-tunnel="ssh -S /tmp/tunnel -O exit srv2"

function mdc() {
  mkdir -p "$1";
  cd "$1";
}

alias dtf='/usr/bin/git --git-dir=$DOTFILES --work-tree=$HOME'

# Config file
alias zshconf="vim ~/.zshrc"
alias tmuxconf="vim ~/.tmux.conf"
alias vimconf="vim ~/.vimrc"
alias gitconf="vim ~/.gitconfig"
