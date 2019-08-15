
fpath=(/usr/local/share/zsh-completions $fpath)

# Completion
setopt completealiases
#autoload -Uz compinit
#compinit

zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # color complet
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # ignore case
zstyle ':completion:*' menu select=2 # menu if nb items > 2
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate # list of completers to use

# sections completion !
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'\e[00;34m%d'
zstyle ':completion:*:messages' format $'\e[00;31m%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always

#eval "`pip completion --zsh`"
