#exports
export EDITOR=vim
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PIP_DOWNLOAD_CACHE=~/.cache/pip/
export PERSONAL_GIT=~/personal/git/

if [[ $OSX -eq 1 ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

    # locale
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
fi
