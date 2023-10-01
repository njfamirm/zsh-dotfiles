autoload -U compinit && compinit
setopt prompt_subst

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# load all zsh files
DOTFILES=~/.dotfiles
for config_file ($DOTFILES/dotfiles.d/**/*.*sh); do
  source $config_file
done
unset config_file

# PROMPT="%B%F{#f8f8f2}%n%b $(host_prompt) %F{#f1fa8c}at %F{#bd93f9}"'$(short_pwd)'"%F{reset_color} "'$(set_git_prompt)'$'\n'"$(set_prompt_symbol)%F{#f8f8f2} "
# PROMPT="%B%F{#ffd7b0}%n%b $(host_prompt) %F{#859289}at %F{#d75f5e}"'$(short_pwd)'"%F{reset_color} "'$(set_git_prompt)'$'\n'"$(set_prompt_symbol)%F{#ffffff} "

autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit
autoload -Uz select-word-style
select-word-style bash

# export http_proxy='http://127.0.0.1:2081'
