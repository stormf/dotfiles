
source ~/.zsh.d/checks.zsh
source ~/.zsh.d/exports.zsh


# Stop oh-my-zsh auto updating
DISABLE_AUTO_UPDATE="true"

# zgen to load plugins FAST
source "$DOTFILES/external/zgen/zgen.zsh"
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/aws
    zgen oh-my-zsh plugins/knife
    zgen oh-my-zsh plugins/django
    zgen oh-my-zsh plugins/extract

    zgen load zsh-users/zsh-syntax-highlighting
    zgen load paoloantinori/hhighlighter

    #save all to init script
    zgen save
fi

source ~/.zsh.d/private.zsh

source ~/.zsh.d/opts.zsh
source ~/.zsh.d/functions.zsh
source ~/.zsh.d/prompt.zsh
source ~/.zsh.d/yola.zsh
source ~/.zsh.d/aliases.zsh
source ~/.zsh.d/completions.zsh

# iterm 2 shell integration TODO: source this properly
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
