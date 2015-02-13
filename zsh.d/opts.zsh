
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

# Completion
zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -Uz compinit
compinit

