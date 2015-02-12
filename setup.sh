#!/bin/bash

realpath() {
    [[ $1 = /* ]] && echo $1 || echo "$PWD/${1#./}"
}

SCRIPT_PATH=`realpath $0`
DOTFILES=`dirname $SCRIPT_PATH`

if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi

if [ ! -d ~/.vim/backup ]; then
    mkdir ~/.vim/backup
fi

if [ ! -d ~/.vim/bundle ]; then
    mkdir ~/.vim/bundle
fi

if [ ! -e ~/.vim/bundle/Vundle.vim ]
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ ! -e ~/.vimrc ]; then
    ln -s "$DOTFILES/vimrc" ~/.vimrc
    echo ".vimrc installed successfully"
    vim +PluginInstall +qall
    echo "Plugins installed"
fi

if [ ! -e ~/.zshrc ]; then
    ln -s "$DOTFILES/zshrc" ~/.zshrc
    ln -s "$DOTFILES/zsh.d" ~/.zsh.d
    echo ".zshrc installed successfully"
fi

if [ ! -e ~/.gitconfig ]; then
    ln -s "$DOTFILES/gitconfig" ~/.gitconfig
    echo ".gitconfig installed successfully"
fi

