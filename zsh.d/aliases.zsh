if [[$LINUX -eq 1]]; then
    alias ls='ls -G'
else
    alias ls='ls --color'
    eval `dircolors -b`
fi
