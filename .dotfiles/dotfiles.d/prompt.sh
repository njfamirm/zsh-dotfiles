set_git_prompt() {
  if [[ $DISABLE_GIT_PROMPT ]] return
  local branch=$(git branch --show-current 2>/dev/null)
  if [[ ! -n "$branch" ]]; then
    return 0
  fi
  local git_prompt=""

  local staged=$(git diff --cached --numstat | wc -l | tr -d ' ')
  local unstaged=$(git diff --numstat | grep -v '^\s*0\s' | wc -l | tr -d ' ')
  local untracked=$(git ls-files --others --exclude-standard | wc -l | tr -d ' ')
  local head=$(git rev-parse --short HEAD 2>/dev/null)

  if [[ "$staged" -ne 0 ]]; then
    git_prompt="$git_prompt%F{#55a630}#$staged%F{reset_color}"
  fi

  if [[ "$unstaged" -ne 0 ]]; then
    git_prompt="$git_prompt%F{#fad1ac}+$unstaged%F{reset_color}"
  fi

  if [[ "$untracked" -ne 0 ]]; then
    git_prompt="$git_prompt%F{#d75f5f}?$untracked%F{reset_color}"
  fi

  if [[ "$staged" -eq 0 && "$unstaged" -eq 0 && "$untracked" -eq 0 ]]; then
    git_prompt="%B%F{#88afad}$branch%b%F{reset_color}:(%F{#859289}%B$head%b%F{reset_color})"
  else
    git_prompt="%B%F{#88afad}$branch%b%F{reset_color}:(%F{#859289}%B$head%b%F{reset_color}) [$git_prompt]"
  fi
  
  echo "$git_prompt"
}

set_prompt_symbol() {
  if [ "$EUID" -ne "0" ]; then
    echo "%B%F{#fdf6e3}λ%b"
  else
    echo "%B%F{#f2b205}#%b"
  fi
}

short_pwd() {
  local pwd="${${(s:/:)PWD}[-2]}/${PWD:t}"
  [ "$PWD" = "$HOME" ] && pwd='~'
  echo "%U%B$pwd%b%u"
}

host_prompt() {
  local  color="#0191a1"
  if [ "$SSH_CLIENT" ]; then
    color="#8da101"
  fi
  echo "%F{#859289} in %B%F{$color}$HOST%b"
}

PROMPT="%B%F{#ffd7b0}%n%b$(host_prompt) %F{#859289}at %F{#d75f5e}"'$(short_pwd)'"%F{reset_color} "'$(set_git_prompt)'$'\n'"$(set_prompt_symbol)%F{#ffffff} "
set -g default-terminal "xterm-256color"

