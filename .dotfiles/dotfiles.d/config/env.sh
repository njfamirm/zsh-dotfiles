# Global
export HISTORY_IGNORE="(ls|pwd|c|clear|l)"
export GPG_TTY=$(tty)
ZSH_DISABLE_COMPFIX=true

# Tmux plugin config
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=true

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Go
export GOPATH=$HOME/go
# export GOROOT=/opt/homebrew/bin/go
# export PATH=$PATH:$GOROOT/bin:$GOPATH
export PATH=$PATH:$GOPATH

# Nodejs
export NODE_OPTIONS="--max-old-space-size=4096"

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
