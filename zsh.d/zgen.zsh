# Stop oh-my-zsh auto updating
DISABLE_AUTO_UPDATE="true"

# zgen to load plugins FAST
source "$DOTFILES/external/zgen/zgen.zsh"
if ! zgen saved; then
    echo "Creating a zgen save"

    # update zgen once a week
    zgen load unixorn/autoupdate-zgen

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/aws
    zgen oh-my-zsh plugins/knife
    zgen oh-my-zsh plugins/knife_ssh
    zgen oh-my-zsh plugins/docker

    zgen oh-my-zsh plugins/screen
    zgen oh-my-zsh plugins/vscode
    zgen oh-my-zsh plugins/iterm2
    zgen oh-my-zsh plugins/emoji

    zgen oh-my-zsh plugins/extract

    zgen load zdharma/fast-syntax-highlighting
    zgen load paoloantinori/hhighlighter
    zgen load chrissicool/zsh-256color

    zgen oh-my-zsh plugins/osx

    # k is a zsh script / plugin to make directory listings more readable,
    # adding a bit of color and some git status information on files and directories
    # unalias k # something is aliasing k to kubectl
    zgen load supercrabtree/k

    #save all to init script
    zgen save
fi
