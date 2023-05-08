gsep () {
  currentBranch=$(git rev-parse --abbrev-ref HEAD) && \
  git fetch origin && \
  git switch -c feat/$1 origin/next && \
  shift && \
  git cherry-pick $@ && \
  git push -u && \
  gh pr create -a @me --base next --fill --web && \
  git switch $currentBranch;
}
