OPEN_AT_START=(
  "project/alwatr"
)

function devEnv() {
  for d in $OPEN_AT_START; do
    if [ -d "$HOME/$d" ]; then
      tmux new-window -d -c "$HOME/$d"
    fi
  done
}
