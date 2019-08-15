if [[ $OSX -eq 1 ]]; then
    alias ls='ls -G'
fi

if [[ $LINUX -eq 1 ]]; then
    alias ls='ls --color'
    eval `dircolors -b`
fi

alias gits='git status'
alias gitd='git diff'

alias s3cmd='envchain aws s3cmd'
alias ttc='envchain ttc tiny-care-terminal'
alias brew='envchain homebrew brew'

# python
alias pm=python_manage_dotpy
alias re="REUSE_DB=1"
alias nnc="NOSE_NOCAPTURE=1"
alias ve=". ./virtualenv/bin/activate"
alias pyclean="find . -name '*.pyc' -delete"
