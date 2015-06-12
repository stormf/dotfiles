
source ~/.zsh.d/checks.zsh
source ~/.zsh.d/exports.zsh

source ~/.zsh.d/private.zsh

source ~/.zsh.d/opts.zsh
source ~/.zsh.d/functions.zsh
source ~/.zsh.d/prompt.zsh
source ~/.zsh.d/yola.zsh
source ~/.zsh.d/aliases.zsh
source ~/.zsh.d/completions.zsh

source "$DOTFILES/external/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/knife
    zgen oh-my-zsh plugins/brew
    zgen oh-my-zsh plugins/mosh
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load paoloantinori/hhighlighter

    #save all to init script
    zgen save
fi
