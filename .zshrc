# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory
setopt sharehistory
setopt auto_cd
setopt extended_glob
setopt noclobber
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/henk/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U promptinit
promptinit
autoload -U colors && colors
#prompt pws

zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

alias ls='ls -G'

# Stuff for git
parse_git_branch () {
        git branch 2> /dev/null | grep "*" | sed -e 's/* \(.*\)/ (\1)/g'
}
BLACK=$'\033[0m'
RED=$'\033[38;5;167m'
GREEN=$'\033[38;5;71m'
BLUE=$'\033[38;5;111m'
YELLOW=$'\033[38;5;228m'
ORANGE=$'\033[38;5;173m'

function precmd() {
        export PROMPT="%{$RED%}%n%{$BLACK%}@%{$RED%}%m%{$BLACK%}:%{$GREEN%}%~%{$YELLOW%}$(parse_git_branch)%{$BLACK%}
%# "
}

#exports
export EDITOR=vim
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
export PATH="$PATH:/opt/local/bin"

alias microemu='java -jar ~/microemulator-2.0.4/microemulator.jar ~/microemulator-2.0.4/apps/Friendura_Generic_microemu_v0.9_en.jar | egrep "(sock|parser)"'
