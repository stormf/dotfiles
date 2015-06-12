# virtualenv stuff
export PREVPWD=`pwd`
export PREVENV_PATH=

handle_virtualenv(){
  if [ "$PWD" != "$PREVPWD" ]; then
    PREVPWD="$PWD";
    if [ -n "$PREVENV_PATH" ]; then
      if [ "`echo "$PWD" | grep -c $PREVENV_PATH`" = "0"  ]; then
        deactivate
        PREVENV_PATH=
      fi
    fi

    # activate virtualenv dynamically
    if [ -e "$PWD/.virtualenv" ] && [ "$PWD" != "$PREVENV_PATH" ]; then
      PREVENV_PATH="$PWD"
      name=`cat $PWD/.virtualenv`
      if [ -z $name ]; then
          name=`basename $PWD`
      fi
      workon `basename $PWD`
    fi
  fi
}

source `which virtualenvwrapper_lazy.sh`
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

# disables prompt mangling in virtual_env/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1
