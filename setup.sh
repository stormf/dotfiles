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

if [ ! -e ~/.vimrc ]; then
	ln -s "$DOTFILES/vimrc" ~/.vimrc
	echo ".vimrc installed successfully"
fi

if [ ! -e ~/.zshrc ]; then
	ln -s "$DOTFILES/zshrc" ~/.zshrc
	echo ".zshrc installed successfully"
fi

if [ ! -e ~/.gitconfig ]; then
	ln -s "$DOTFILES/gitconfig" ~/.gitconfig
	echo ".gitconfig installed successfully"
fi
