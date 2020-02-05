#exports
export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh
GPG_TTY=$(tty)
export GPG_TTY

export EDITOR=vim
export LOCAL_BIN_PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/git-core/contrib/diff-highlight
export LOCAL_BIN_PATH="/usr/local/opt/curl/bin:$LOCAL_BIN_PATH"
export PATH=$LOCAL_BIN_PATH:$PATH
export PERSONAL_GIT=~/personal
export DOTFILES=~/personal/dotfiles

if [[ $OSX -eq 1 ]]; then
    #export JAVA_HOME=$(/usr/libexec/java_home -v 11)

    # locale
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8

    # OSX stopped shipping openssl headers
    export LDFLAGS="-L/usr/local/opt/openssl/lib"
	export CFLAGS="-I/usr/local/opt/openssl/include"
	export SWIG_FEATURES="-cpperraswarn -includeall -I/usr/local/opt/openssl/include"
fi

export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

# PIP should not install packages globally
export PIP_REQUIRE_VIRTUALENV=true
