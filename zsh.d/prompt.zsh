
autoload -U promptinit
promptinit
autoload -U colors && colors

parse_ve () {
    #handle_virtualenv
    PARENT=`dirname $VIRTUAL_ENV` 2> /dev/null
    basename $PARENT 2> /dev/null | sed -e 's/* \(.*\)/ [\1]/g'
}

BLACK=%F{white}
RED=%F{red}
GREEN=%F{green}
PURPLE=%F{blue}
PINK=%F{magenta}
YELLOW=%F{yellow}

format_git_branch () {
    git_branch=$(parse_git_branch)
    if [[ -n "$git_branch" ]]; then
        print '%{$YELLOW%} ($(parse_git_branch))'
    fi
}

format_exit_status () {
    print "%(?.%{$GREEN%}.%{$RED%})%?"
}

format_ve () {
    print "%{$YELLOW%}$(parse_ve)"
}

format_prefix () {
    print "%{$PINK%}%n%{$RED%}%{$BLACK%}:%{$GREEN%}%~"
}

format_terraform() {
    print "%{$PURPLE%}$(tf_prompt_info)"
}

function precmd() {
        export PROMPT="$(format_prefix) $(format_git_branch) $(format_ve) $(format_terraform) %{$reset_color%}%T $(format_exit_status) %{$reset_color%}
%# "
}
