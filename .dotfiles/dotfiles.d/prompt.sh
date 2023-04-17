#!/usr/bin/zsh

# git prompt generator
# "#" means that staged
# "+" means that unstaged
# "?" means that untracked

get_branch() {
  echo $(git branch --show-current 2>/dev/null)
}

get_staged_files_count() {
  echo $(git diff --cached --numstat 2>/dev/null | wc -l)
}

get_unstaged_files_count() {
 echo $(git diff --name-only 2>/dev/null | wc -l)
}

get_untracked_files_count() {
  echo $(git ls-files --others --exclude-standard 2>/dev/null | wc -l)
}

set_git_prompt() {
  branch=$(get_branch)
  staged=$(get_staged_files_count)
  unstaged=$(get_unstaged_files_count)
  untracked=$(get_untracked_files_count)
  if [ ! -z "$branch" ];then
    git_prompt="[%F{#88afad}$branch%F{reset_color}"
  else
    return 0
  fi
  [ ! "$staged" -eq "0" ] && git_prompt="$git_prompt,%F{#55a630}#$staged%F{reset_color}";
  [ ! "$unstaged" -eq "0" ] && git_prompt="$git_prompt,%F{#fad1ac}+$unstaged%F{reset_color}";
  [ ! "$untracked" -eq "0" ] && git_prompt="$git_prompt,%F{#d75f5f}?$untracked%F{reset_color}";
  git_prompt="$git_prompt]"
  echo $git_prompt
}

set_prompt_symbol() {
  if [ $EUID -ne "0" ]; then
    echo "%B%F{#fdf6e3}λ%b"
  else
    echo "%B%F{#f2b205}#%b"
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
    echo "%F{#859289}in %B%F{#0191a1}$HOST%b"
  else
    echo "%F{#859289}in %B%F{#8da101}$HOST%b"
  fi
}
