export YOLA_GIT=~/work/git
export DEPLOYCONFIGS_PATH=$YOLA_GIT/deployconfigs/configs
export YOLA_SRC=$YOLA_GIT

yoinstall() {
    activate
    pip install --extra-index-url $YOLAPI_INDEX_URL -U $@
}

yorequirements() {
    activate
    pip install --extra-index-url $YOLAPI_INDEX_URL -U -r ${1:-requirements.txt}
}

yoconfig() {
    if [ -z $1 ]; then
        echo "USAGE: yoconfig appname environment"
    else
        $YOLA_GIT/yoconfigurator/bin/configurator.py --local --configs-dir $DEPLOYCONFIGS_PATH $1 $2
    fi
}

yo() {
    cd $YOLA_GIT/$1
}

# git config --global url.https://git.ct.yola.net/git/.insteadOf yolact:
# git config --global url.git@github.com:.insteadOf gh:
function yola_clone() {(
    set -ex
    local app=$1
    host git.ct.yola.net &> /dev/null
    local ct=$?
    if [ $ct -eq 0 ]; then
        git clone "yolact:yola/$app.git"
    else
        git clone "gh:yola/$app.git"
    fi
    cd "$app"
    git config user.email henk@yola.com
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
