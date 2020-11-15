
setopt no_beep # don't beep on error
setopt extended_glob
setopt auto_cd
bindkey -e
setopt noclobber

# History
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
#setopt appendhistory # Allow multiple terminal sessions to all append to one zsh command history
#setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
setopt sharehistory # imports new commands and appends typed commands to history
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
setopt hist_find_no_dups # When searching history don't display results already cycled through twice
setopt hist_verify # don't execute, just expand history
setopt hist_save_no_dups # don't show dups even if not contiguous

REPORTTIME=2 # report time if execution exceeds amount of seconds
