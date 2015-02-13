
autoload -U promptinit
promptinit
autoload -U colors && colors

# Stuff for git
parse_git_branch () {
        git branch 2> /dev/null | grep "*" | sed -e 's/* \(.*\)/ (\1)/g'
}

parse_ve () {
    #handle_virtualenv
    PARENT=`dirname $VIRTUAL_ENV` 2> /dev/null
    basename $PARENT 2> /dev/null | sed -e 's/* \(.*\)/ [\1]/g'
}

BLACK=$'\033[0m'
RED=$'\033[38;5;167m'
GREEN=$'\033[38;5;71m'
BLUE=$'\033[38;5;111m'
YELLOW=$'\033[38;5;228m'
ORANGE=$'\033[38;5;173m'

function precmd() {
        export PROMPT="%{$RED%}%n@%m%{$BLACK%}:%{$GREEN%}%~%{$YELLOW%}$(parse_git_branch) %{$ORANGE%}$(parse_ve)%{$BLACK%}
%# "
}
