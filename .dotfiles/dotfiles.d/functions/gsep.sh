gsep () {
  currentBranch=$(git rev-parse --abbrev-ref HEAD) && \
  git fetch origin && \
  git switch -c feat/$1 origin/next && \
  shift && \
  git cherry-pick $@ && \
  git push && \
  gh pr create -w && \
  g switch $currentBranch;
}
