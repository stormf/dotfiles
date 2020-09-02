
# if using gpg-agent for ssh

#export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh
#GPG_TTY=$(tty)
#export GPG_TTY

# default ssh-agent
# with oh my zsh ssh-agent plugin
zstyle :omz:plugins:ssh-agent agent-forwarding off
zstyle :omz:plugins:ssh-agent lifetime 4h
