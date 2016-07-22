#exports
#export SSH_AUTH_SOCK=/Users/$USER/.gnupg/S.gpg-agent.ssh
export EDITOR=vim
export LOCAL_BIN_PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/git-core/contrib/diff-highlight
export PATH=$LOCAL_BIN_PATH:$PATH
export PERSONAL_GIT=~/personal/git/
export DOTFILES=~/personal/git/dotfiles

if [[ $OSX -eq 1 ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

    # locale
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
fi
