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
alias ls="ls -ltrhA"
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
alias co="code ."
alias p=ping
alias imgo="open -a ImageOptim"
alias chrome-cors="open -n -a /Applications/Google\ Chrome\ Beta.app/Contents/MacOS/Google\ Chrome\ Beta --args --user-data-dir="$HOME/chrome-profile" --disable-web-security"

# alias tunnel="close-tunnel >/dev/null 2>&1; ssh -M -S /tmp/tunnel -fND 0.0.0.0:1080 srv3"
# alias close-tunnel="ssh -S /tmp/tunnel -O exit srv3"

alias dtf='/usr/bin/git --git-dir=$DOTFILES --work-tree=$HOME'
