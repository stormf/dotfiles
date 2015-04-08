
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
antigen bundle robbyrussell/oh-my-zsh plugins/knife
antigen bundle robbyrussell/oh-my-zsh plugins/brew
antigen bundle robbyrussell/oh-my-zsh plugins/mosh
antigen bundle paoloantinori/hhighlighter
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply
