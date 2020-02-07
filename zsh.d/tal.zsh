# tal git flow helpers

function info() {
  echo "$(tput setaf 7)$1$(tput sgr0)"
}

function code-on() {
  # Checkout a new branch for a Jira issuea
  # params:
  #   $1 jira issue key
  #   $2 tracking branch (default: master)
  (
    set -e
    local upstream=${2:=master}
    local branch="${USER}-$1"
    info "creating local branch '$branch' which tracks 'origin/${upstream}'"
    (
      set -x
      git checkout -b $branch origin/${upstream}
    )
  )
}

function code-push() {
  # Push branch to the matching branch on the remote
  # Use this to update pull requests.
  (
    set -e
    local branch=`git rev-parse --abbrev-ref HEAD`
    [[ "$branch" == "master" ]] && echo "should be on feature branch" && return 1
    info "pushing to remote branch 'origin/$branch'"
    (
      set -x
      git push origin HEAD:$branch $@
    )
  )
}

function link-pr-jira() {
  # Tell Jira that we've created the PR and link it
  # Params:
  #   $1 The pull request url
  (
  local pr=$1
  if [ -z $pr ]; then
    info "pull request link not given, not linking to jira"
    return
  fi
  set -e
  local repo=`git remote -v | grep fetch | grep -o 'TAKEALOT/[^.]*' | cut -d '/' -f2`
  local branch=`git rev-parse --abbrev-ref HEAD`
  local issue=${branch#*-}
  local jirabase="https://$TAL_JIRA_URL/jira/rest/api/latest"
  local pr_description=${pr#*github.com/}
  info "linking pull request $pr to jira issue $issue"
  (
    set -x
    curl --netrc -X POST -H "Content-Type: application/json" $jirabase/issue/$issue/remotelink --data-raw "{\"object\": {\"url\":\"$pr\", \"title\": \"$pr_description\"}}"
  )
  )
}

function code-pr() {
  # Create a pull request from your branch to the upstream
  # Requires hub (tool from github)
  # Automatically uses the last commit message as the pr message
  (
  set -e
  local branch=`git rev-parse --abbrev-ref HEAD`
  local upstream=`git rev-parse --abbrev-ref HEAD@{upstream}`
  local short_upstream=${upstream#origin/}
  [[ "$branch" == "master" ]] && echo "should be on feature branch" && return 1
  code-push
  info "creating pull request from '$branch' to '$short_upstream'"
  (
    set -x
    local pr=`hub pull-request -h $branch -b $short_upstream -F <(git log -1 --pretty=%B)| grep -o 'http[^ ]*'`
    set +x
    link-pr-jira "$pr"
  )
  )
}

function code-release() {
  # This will just push the code to the remote branch
  # and also to the upstream. Pushing to both locations
  # will cause the existing pr to close.
  # This will also remove the local and remote branches
  (
  set -e
  local branch=`git rev-parse --abbrev-ref HEAD`
  local upstream=`git rev-parse --abbrev-ref HEAD@{upstream}`
  [[ "$branch" == "master" ]] && echo "should be on feature branch" && return 1
  git fetch
  code-push
  info "preparing release of 'origin/$branch' into '$upstream'"
  git status
  sleep 3
  info "pushing to remote branch '$upstream'"
  (
    set -x
    git push origin HEAD:master
  )
  info "cleaning up"
  (
    set -x
    git checkout master
    git reset --hard origin/master
    git push origin :${branch}
    git branch -d ${branch}
  )
  )
}

function code-abandon-local() {
  (
  set -e
  local branch=`git rev-parse --abbrev-ref HEAD`
  local upstream=`git rev-parse --abbrev-ref HEAD@{upstream}`
  [[ "$branch" == "master" ]] && echo "should be on feature branch" && return 1
  [[ -z "$upstream" ]] && echo "sanity failure; upstream is empty?" && return 1
    (
      set -x
      git checkout master
      git branch -d ${branch}
    )
  )
}
