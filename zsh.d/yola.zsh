export YOLA_GIT=~/work/git
export DEPLOYCONFIGS_PATH=$YOLA_GIT/deployconfigs/configs
export YOLA_SRC=$YOLA_GIT

yoinstall() {
    activate
    export LDFLAGS="-L$(brew --prefix openssl)/lib"
    export CFLAGS="-I$(brew --prefix openssl)/include"
    export SWIG_FEATURES="-cpperraswarn -includeall -I$(brew --prefix openssl)/include"
    pip install -i $YOLAPI_INDEX_URL -U $@
    unset LDFLAGS
    unset CFLAGS
    unset SWIG_FEATURES
}

yorequirements() {
    . ./virtualenv/bin/activate
    export LDFLAGS="-L$(brew --prefix openssl)/lib"
    export CFLAGS="-I$(brew --prefix openssl)/include"
    export SWIG_FEATURES="-cpperraswarn -includeall -I$(brew --prefix openssl)/include"
    pip install -i $YOLAPI_INDEX_URL -r ${1:-requirements.txt}
    unset LDFLAGS
    unset CFLAGS
    unset SWIG_FEATURES
}

yoconfig() {
    if [ -z $1 ]; then
        echo "USAGE: yoconfig appname environment"
    else
        $YOLA_GIT/yoconfigurator/bin/configurator.py --local --configs-dir $DEPLOYCONFIGS_PATH $@
    fi
}

yo() {
    cd $YOLA_GIT/$1
}

# git config --global url.http://git.ct.yola.net/git/.insteadOf yolact:
# git config --global url.git@github.com:.insteadOf gh:
function yola_clone() {(
    cd $YOLA_SRC 
    local app=$1
    host git.ct.yola.net &> /dev/null
    local ct=$?
    if [ $ct -eq 0 ]; then
        git clone "yolact:yola/$app.git"
    else
        git clone "gh:yola/$app.git"
    fi
    cd "$app"
    git config user.email storm@yola.com
    if [ $ct -eq 0 ]; then
        git remote rename origin ctmirror
        git remote add origin "gh:yola/$app.git"
    else
        git remote add ctmirror "yolact:yola/$app.git"
    fi
    git fetch origin
    git branch --set-upstream-to origin/master master
)}

alias odoor="curl -d \"Outer=open-door\" ${YOLA_DOOR_URL}"
alias idoor="curl -d \"Inner=open-door\" ${YOLA_DOOR_URL}"

python_manage_dotpy () {
    # kill pyc files
    find . -name '*.pyc' -maxdepth 5 -delete
    # find manage.py
    mandotpy=`find . -iname manage.py -maxdepth 3 | head -1`
    if [[ -e $mandotpy ]]; then
        python $mandotpy $@
    else
        echo "No fucking clue where manage.py is."
    fi
}

