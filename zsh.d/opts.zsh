HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory
setopt sharehistory
setopt auto_cd
setopt extended_glob
setopt noclobber
bindkey -e

zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -Uz compinit
compinit

autoload -U promptinit
promptinit
autoload -U colors && colors
