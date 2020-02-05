source ~/.zsh.d/checks.zsh
source ~/.zsh.d/exports.zsh

source ~/.zsh.d/functions.zsh
source ~/.zsh.d/completions.zsh
source ~/.zsh.d/aliases.zsh
source ~/.zsh.d/opts.zsh
source ~/.zsh.d/prompt.zsh

# load plugins and create a zgen save for fast startup
source ~/.zsh.d/zgen.zsh

source ~/.zsh.d/private.zsh

# iterm 2 shell integration TODO: source this properly
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

