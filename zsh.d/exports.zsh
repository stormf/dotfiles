#exports

export EDITOR=vim
export LOCAL_BIN_PATH=~/bin:$(brew --prefix):$(brew --prefix)/share/git-core/contrib/diff-highlight
export LOCAL_BIN_PATH="$(brew --prefix)/opt/curl/bin:$LOCAL_BIN_PATH"
export LOCAL_BIN_PATH="$(brew --prefix)/opt/openssl@1.1/bin:$LOCAL_BIN_PATH"
export LOCAL_BIN_PATH=~/.rd/bin:$LOCAL_BIN_PATH # rancher desktop
# export LOCAL_BIN_PATH="~/.local/bin:$LOCAL_BIN_PATH" # pipx
export PATH=$LOCAL_BIN_PATH:$PATH

# add gcloud binaries to path
if [ -e "$(brew --prefix)/Caskroom/google-cloud-sdk" ]; then
    export CLOUDSDK_PYTHON="$(brew --prefix)/opt/python@3.11/libexec/bin/python"
    source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
    source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi

export PERSONAL_GIT=~/personal
export DOTFILES=~/personal/dotfiles

if [[ $OSX -eq 1 ]]; then
    #export JAVA_HOME=$(/usr/libexec/java_home -v 11)

    # locale
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8

    # OSX stopped shipping openssl headers
    export LDFLAGS="-L$(brew --prefix)/opt/openssl/lib"
	export CFLAGS="-I$(brew --prefix)/opt/openssl/include"
	export SWIG_FEATURES="-cpperraswarn -includeall -I$(brew --prefix)/opt/openssl/include"
    export LIBRARY_PATH="${LIBRARY_PATH}:$(brew --prefix)/opt/openssl/lib/"
    export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
fi



# PIP should not install packages globally
export PIP_REQUIRE_VIRTUALENV=true

# homebrew disable beer emoji
export HOMEBREW_NO_EMOJI=1

export USE_GKE_GCLOUD_AUTH_PLUGIN=True
