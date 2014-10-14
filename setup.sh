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

if [ ! -e ~/.vim/autoload/pathogen.vim ]; then
    echo "Installing pathogen"
    mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
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


#fizsh
if [ ! -e ~/.fizsh ]; then
    echo "fizsh not installed, cannot configure"
else
    if [ -e ~/.fizsh/fizsh-prompt.zsh ]; then
        mv ~/.fizsh/fizsh-prompt.zsh ~/.fizsh/fizsh-prompt.zsh.orig
    fi
    ln -s $DOTFILES/fizsh-prompt.zsh ~/.fizsh/fizsh-prompt.zsh
    if [ -e ~/.fizsh/fizshrc ]; then
        mv ~/.fizsh/fizshrc ~/.fizsh/fizshrc.orig
    fi
    ln -s $DOTFILES/fizshrc ~/.fizshrc
    echo "fizsh configured, run \"chsh -s /bin/fizsh\" to change your default shell"
fi
