#!/bin/bash

DOT_FILES=(".vimrc" ".zshenv" ".zsh" ".tmux.conf" ".latexmkrc")

echo "uninstall dotfiles."
echo "----------------------------"

for file in ${DOT_FILES[@]}
do
	if [ -e $HOME/$file ] ; then
		unlink $HOME/$file
		echo "unlink: $HOME/$file"
	fi
done

if [ -e $HOME/.config/nvim/init.vim ] ; then
	unlink $HOME/.config/nvim/init.vim
	echo "unlink: $HOME/.config/nvim/init.vim"
fi

echo "----------------------------"
echo "dotfiles is uninstalled!"

