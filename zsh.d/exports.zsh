#exports

export EDITOR=vim
export LOCAL_BIN_PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/git-core/contrib/diff-highlight
export LOCAL_BIN_PATH="/usr/local/opt/curl/bin:$LOCAL_BIN_PATH"
export LOCAL_BIN_PATH="/usr/local/opt/openssl@1.1/bin:$LOCAL_BIN_PATH"
export PATH=$LOCAL_BIN_PATH:$PATH

source ~/google-cloud-sdk/path.zsh.inc

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

# homebrew disable beer emoji
export HOMEBREW_NO_EMOJI=1
