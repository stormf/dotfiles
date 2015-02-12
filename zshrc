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
#eval `dircolors -b`
#prompt pws

zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

alias ls='ls -G'

# Stuff for git
parse_git_branch () {
        git branch 2> /dev/null | grep "*" | sed -e 's/* \(.*\)/ (\1)/g'
}

# virtualenv stuff
export PREVPWD=`pwd`
export PREVENV_PATH=

handle_virtualenv(){
  if [ "$PWD" != "$PREVPWD" ]; then
    PREVPWD="$PWD";
    if [ -n "$PREVENV_PATH" ]; then
      if [ "`echo "$PWD" | grep -c $PREVENV_PATH`" = "0"  ]; then
        deactivate
        PREVENV_PATH=
      fi
    fi

    # activate virtualenv dynamically
    if [ -e "$PWD/.virtualenv" ] && [ "$PWD" != "$PREVENV_PATH" ]; then
      PREVENV_PATH="$PWD"
      name=`cat $PWD/.virtualenv`
      if [ -z $name ]; then
          name=`basename $PWD`
      fi
      workon `basename $PWD`
    fi
  fi
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

#exports
export EDITOR=vim
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export PIP_DOWNLOAD_CACHE=~/.cache/pip/
export PROJECT_HOME=~/projects
source `which virtualenvwrapper_lazy.sh`


source $PERSONAL_GIT/hhighlighter/h.sh


yoinstall() {
    pip install --extra-index-url $YOLAPI_INDEX_URL -U $@
}

yorequirements() {
    pip install --extra-index-url $YOLAPI_INDEX_URL -U -r ${1:-requirements.txt}
}

yoconfig() {
    if [ -z $1 ]; then
        echo "USAGE: yoconfig appname environment"
    else
        $YOLA_GIT/yoconfigurator/bin/configurator.py --local --configs-dir $DEPLOYCONFIGS_PATH $1 $2
    fi
}

yo() {
    cd $YOLA_GIT/$1
}

function fuck() {
  if killall -9 "$2"; then
    echo ; echo " (╯°□°）╯︵$(echo "$2"|toilet -f term -F rotate)"; echo
  fi
}
