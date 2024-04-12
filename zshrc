SOURCE_DIR=~/.zsh.d

source $SOURCE_DIR/checks.zsh
source $SOURCE_DIR/exports.zsh
source $SOURCE_DIR/ssh.zsh

source $SOURCE_DIR/functions.zsh
source $SOURCE_DIR/completions.zsh
source $SOURCE_DIR/aliases.zsh
source $SOURCE_DIR/opts.zsh
source $SOURCE_DIR/prompt.zsh
source $SOURCE_DIR/autosuggest.zsh

# load plugins and create a zgen save for fast startup
source $SOURCE_DIR/zgen.zsh

source $SOURCE_DIR/private.zsh
source $SOURCE_DIR/tal.zsh

source $SOURCE_DIR/dockerfunc.zsh

# iterm 2 shell integration TODO: source this properly
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
