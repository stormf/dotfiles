#exports
export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh
GPG_TTY=$(tty)
export GPG_TTY

export EDITOR=vim
export LOCAL_BIN_PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/git-core/contrib/diff-highlight
export PATH=$LOCAL_BIN_PATH:$PATH
export PERSONAL_GIT=~/personal
export DOTFILES=~/personal/dotfiles

if [[ $OSX -eq 1 ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

    # locale
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8

    # OSX stopped shipping openssl headers
    export LDFLAGS="-L/usr/local/opt/openssl/lib"
	export CFLAGS="-I/usr/local/opt/openssl/include"
	export SWIG_FEATURES="-cpperraswarn -includeall -I/usr/local/opt/openssl/include"
fi
