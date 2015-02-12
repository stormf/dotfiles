export YOLA_GIT=~/work/git
export DEPLOYCONFIGS_PATH=$YOLA_GIT/deployconfigs/configs
export YOLA_SRC=$YOLA_GIT

yoinstall() {
    pip install --extra-index-url $YOLAPI_INDEX_URL -U $@
}

yorequirements() {
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
