# Stop oh-my-zsh auto updating
DISABLE_AUTO_UPDATE="true"

# zgen to load plugins FAST
source "$DOTFILES/external/zgen/zgen.zsh"
if ! zgen saved; then
    echo "Creating a zgen save"

    # update zgen once a week
    zgen load unixorn/autoupdate-zgen

    # zgen load nnao45/zsh-kubectl-completion

    zgen oh-my-zsh

    # plugins

    # k is a zsh script / plugin to make directory listings more readable,
    # adding a bit of color and some git status information on files and directories
    # unalias k # omz kubectl plugin is aliasing k to kubectl
    zgen load supercrabtree/k

    zgen oh-my-zsh plugins/ssh-agent

    # zgen oh-my-zsh plugins/docker
    # zgen oh-my-zsh plugins/gcloud
    # zgen oh-my-zsh plugins/helm
    # zgen oh-my-zsh plugins/terraform

    zgen oh-my-zsh plugins/screen
    zgen oh-my-zsh plugins/emoji
    zgen oh-my-zsh plugins/fzf

    zgen oh-my-zsh plugins/extract

    # fish like suggestions as you type
    # slow with kubernetes
    #zgen load zsh-users/zsh-autosuggestions

    zgen load paoloantinori/hhighlighter
    zgen load chrissicool/zsh-256color
    zgen load zdharma/fast-syntax-highlighting

    zgen oh-my-zsh plugins/osx

    #save all to init script
    zgen save
fi
