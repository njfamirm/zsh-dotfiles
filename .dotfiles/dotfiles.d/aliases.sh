alias cp='cp -i'
alias df='df -h'
alias free='free -m' # show sizes in MB
alias more="less"
alias y='yarn'
alias g="git"
alias mkdir="mkdir -p"
alias d=docker
alias doc=docker-compose
alias c="printf '\33c\e[3J'"
alias q="tmux detach-client"
alias e="exit"
alias s=sudo
alias ls="ls --color='auto'"
alias lsa="ls -a --color='auto'"
alias ll="ls -altrh --color='auto'"
alias m=make
alias tm="tmux"
alias reload="exec zsh"
alias v=vim
alias vi=vim
alias cdl="cd -"

alias tunnel="ssh -M -S /tmp/tunnel -fND 0.0.0.0:1080 alimd" 
alias close-tunnel="ssh -S /tmp/tunnel -O exit alimd" 

function mdc() {
  mkdir -p "$1";
  cd "$1";
}

alias dtf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Config file
alias zshconf="vim ~/.zshrc"
alias tmuxconf="vim ~/.tmux.conf"
alias vimconf="vim ~/.vimrc"
alias gitconf="vim ~/.gitconfig"
