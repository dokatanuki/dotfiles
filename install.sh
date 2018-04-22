#!/bin/bash

DOT_FILES=(".vimrc" ".zshenv" ".zsh" ".tmux.conf" ".latexmkrc")

echo "install dotfiles."
echo "----------------------------"

for file in ${DOT_FILES[@]}
do
	if [ -e $HOME/$file ] ; then
		echo "$file is already exist."
	else
		ln -s $HOME/dotfiles/$file $HOME/$file
		echo "symbolic link: $HOME/dotfiles/$file -> $HOME/$file"
	fi
done

mkdir -p $HOME/.vim/ftplugin

ln -s $HOME/dotfiles/.vim/ftplugin/python.vim $HOME/.vim/ftplugin/python.vim
echo "symbolic link: $HOME/dotfiles/.vim/ftplugin/python.vim -> $HOME/.vim/ftplugin/python.vim"

if type "nvim" > /dev/null 2>&1 ; then
	mkdir -p $HOME/.config/nvim
	if [ -e $HOME/.config/nvim/init.vim ] ; then
		echo "init.vim is already exist."
	else
		ln -s $HOME/dotfiles/.vimrc $HOME/.config/nvim/init.vim
		echo "symbolic link: $HOME/dotfiles/.vimrc -> $HOME/.config/nvim/init.vim"
	fi
else
	echo "please install neovim and run this script again."
fi

echo "----------------------------"
echo "dotfiles is installed!"

