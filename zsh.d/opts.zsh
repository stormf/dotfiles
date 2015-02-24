
setopt no_beep # don't beep on error
setopt extended_glob
setopt auto_cd
bindkey -e
setopt noclobber

# History
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory # Allow multiple terminal sessions to all append to one zsh command history
setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
setopt sharehistory # imports new commands and appends typed commands to history
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
setopt hist_find_no_dups # When searching history don't display results already cycled through twice
setopt hist_verify # don't execute, just expand history
setopt hist_save_no_dups # don't show dups even if not contiguous

REPORTTIME=2 # report time if execution exceeds amount of seconds

# Completion
setopt completealiases
autoload -Uz compinit
compinit

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

