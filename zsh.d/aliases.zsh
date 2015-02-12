if [[ $OSX -eq 1 ]]; then
    alias ls='ls -G'
fi

if [[ $LINUX -eq 1 ]]; then
    alias ls='ls --color'
    eval `dircolors -b`
fi
