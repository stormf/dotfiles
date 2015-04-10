
source ~/.zsh.d/checks.zsh
source ~/.zsh.d/exports.zsh

source ~/.zsh.d/private.zsh

source ~/.zsh.d/opts.zsh
source ~/.zsh.d/functions.zsh
source ~/.zsh.d/prompt.zsh
source ~/.zsh.d/yola.zsh
source ~/.zsh.d/aliases.zsh
source ~/.zsh.d/completions.zsh

source $DOTFILES/external/antigen/antigen.zsh

antigen bundles <<EOBUNDLES
    robbyrussell/oh-my-zsh plugins/knife
    robbyrussell/oh-my-zsh plugins/brew
    robbyrussell/oh-my-zsh plugins/mosh
    paoloantinori/hhighlighter
    zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen apply
