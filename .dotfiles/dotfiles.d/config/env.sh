# Global
export HISTORY_IGNORE="(ls|pwd|c|clear|l)"
export GPG_TTY=$(tty)
ZSH_DISABLE_COMPFIX=true


# Tmux plugin config
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=true

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Go
export GOPATH=$HOME/go
# export GOROOT=/opt/homebrew/bin/go
# export PATH=$PATH:$GOROOT/bin:$GOPATH
export PATH=$PATH:$GOPATH

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
