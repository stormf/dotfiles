
function fuck() {
  if killall -9 "$2"; then
    echo ; echo " (╯°□°）╯︵$(echo "$2"|toilet -f term -F rotate)"; echo
  fi
}

parse_git_branch () {
        git branch 2> /dev/null | grep "*" | sed -e 's/* \(.*\)/\1/g'
}

function git-clean() {
    CURRENT_BRANCH=`parse_git_branch | tr -d '[[:space:]]'`
    git checkout master
    git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d
    git checkout $CURRENT_BRANCH
}

function activate() {
    if [[ `parse_ve` == "" ]]; then
        if [ -f requirements.txt ]; then
            export LDFLAGS="-L$(brew --prefix openssl)/lib"
            export CFLAGS="-I$(brew --prefix openssl)/include"
            export SWIG_FEATURES="-cpperraswarn -includeall -I$(brew --prefix openssl)/include"
            build-virtualenv
            unset LDFLAGS
            unset CFLAGS
            unset SWIG_FEATURES
            source virtualenv/bin/activate
        else
            echo "requirements.txt not found"
        fi
    else
        echo "already in virtualenv"
    fi
}

function ne() {
    local cmd="$1"
    shift
    "$(npm bin)/$cmd" "$@"
}

function view_ssl_cert() {
    echo | openssl s_client -showcerts -servername "$1" -connect "$1":443 2>/dev/null | openssl x509 -inform pem -noout -text
}
