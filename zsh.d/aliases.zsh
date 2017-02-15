if [[ $OSX -eq 1 ]]; then
    alias ls='ls -G'
    alias gpg=gpg2
fi

if [[ $LINUX -eq 1 ]]; then
    alias ls='ls --color'
    eval `dircolors -b`
fi

alias gits='git status'
alias gitd='git diff'

# python
alias pm=python_manage_dotpy
alias re="REUSE_DB=1"
alias nnc="NOSE_NOCAPTURE=1"
alias ve=". ./virtualenv/bin/activate"
