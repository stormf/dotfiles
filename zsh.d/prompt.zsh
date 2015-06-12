
autoload -U promptinit
promptinit
autoload -U colors && colors

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

format_git_branch () {
    git_branch=$(parse_git_branch)
    if [[ -n "$git_branch" ]]; then
        print '%{$YELLOW%} ($(parse_git_branch))'
    fi
}

format_exit_status () {
    print '%(?.%{$GREEN%}.%{$RED%})%?'
}

format_ve () {
    print '%{$ORANGE%}$(parse_ve)'
}

format_prefix () {
    print '%{$RED%}%n@%m%{$BLACK%}:%{$GREEN%}%~'
}

function precmd() {
        export PROMPT="$(format_prefix) $(format_git_branch) $(format_ve) %{$BLACK%}%T $(format_exit_status) %{$BLACK%}
%# "
}
