source ~/.zsh.d/checks.zsh
source ~/.zsh.d/exports.zsh

source ~/.zsh.d/functions.zsh
source ~/.zsh.d/completions.zsh
source ~/.zsh.d/aliases.zsh
source ~/.zsh.d/opts.zsh
source ~/.zsh.d/prompt.zsh
source ~/.zsh.d/yola.zsh

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
    zgen oh-my-zsh plugins/django
    zgen oh-my-zsh plugins/extract

    zgen load zdharma/fast-syntax-highlighting
    zgen load paoloantinori/hhighlighter
    zgen load chrissicool/zsh-256color

    #save all to init script
    zgen save
fi

source ~/.zsh.d/private.zsh

# iterm 2 shell integration TODO: source this properly
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

