# Stop oh-my-zsh auto updating | `omz update` to manual update
DISABLE_AUTO_UPDATE="true"

# zgen to load plugins FAST
source "$DOTFILES/external/zgen/zgen.zsh"
if ! zgen saved; then
    echo "Creating a zgen save"

    # update zgen once a week
    # export $(envchain homebrew env | grep HOMEBREW_GITHUB_API_TOKEN)
    zgen load unixorn/autoupdate-zgen

    # zgen load nnao45/zsh-kubectl-completion

    zgen oh-my-zsh

    # plugins

    zgen oh-my-zsh plugins/ssh-agent

    zgen oh-my-zsh plugins/screen
    zgen oh-my-zsh plugins/emoji
    zgen oh-my-zsh plugins/fzf
    zgen oh-my-zsh plugins/extract

    # fish like suggestions as you type
    # slow with kubernetes, see autosuggest.zsh
    zgen load zsh-users/zsh-autosuggestions

    zgen load paoloantinori/hhighlighter
    zgen load chrissicool/zsh-256color
    zgen load zdharma/fast-syntax-highlighting

    # zgen oh-my-zsh plugins/macos

    #save all to init script
    zgen save
fi
