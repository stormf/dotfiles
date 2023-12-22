# Stop oh-my-zsh auto updating | `omz update` to manual update
DISABLE_AUTO_UPDATE="true"

# zgen to load plugins FAST
source "$DOTFILES/external/zgenom/zgenom.zsh"
if ! zgenom saved; then
    echo "Creating a zgenom save"

    # update zgenom once a week
    # export $(envchain homebrew env | grep HOMEBREW_GITHUB_API_TOKEN)
    zgenom autoupdate

    # zgen load nnao45/zsh-kubectl-completion

    zgenom ohmyzsh

    # plugins

    zgenom ohmyzsh plugins/ssh-agent

    zgenom oh-my-zsh plugins/screen
    zgenom ohmyzsh plugins/emoji
    zgenom ohmyzsh plugins/fzf
    zgenom ohmyzsh plugins/extract

    # fish like suggestions as you type
    # slow with kubernetes, see autosuggest.zsh
    zgenom load zsh-users/zsh-autosuggestions

    zgenom load paoloantinori/hhighlighter
    zgenom load chrissicool/zsh-256color
    zgenom load zdharma-continuum/fast-syntax-highlighting

    # zgen oh-my-zsh plugins/macos

    #save all to init script
    zgenom save

    zgenom compile "$HOME/.zshrc"

fi
