
function fuck() {
  if killall -9 "$2"; then
    echo ; echo " (╯°□°）╯︵$(echo "$2"|toilet -f term -F rotate)"; echo
  fi
}

parse_git_branch () {
        git branch 2> /dev/null | grep "*" | sed -e 's/* \(.*\)/ (\1)/g'
}

function git-clean() {
    CURRENT_BRANCH=`parse_git_branch`
    git checkout master
    git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d
    git checkout $CURRENT_BRANCH
}

function activate() {
    if [ -f requirements.txt ]; then
        build-virtualenv
    fi
    source virtualenv/bin/activate
}
