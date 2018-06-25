#!/bin/bash

DOT_FILES=(".vimrc" ".tmux.conf")
FISH_FILES=("config.fish" "fishfile")

echo "install dotfiles."
echo "----------------------------"

# dotfiles
for file in ${DOT_FILES[@]}
do
	if [ -e $HOME/$file ] ; then
        echo "hoge"
	else
		ln -sv $HOME/dotfiles/$file $HOME/$file
	fi
done

# fish shell
if type "fish" > /dev/null 2>&1 ; then
    # fish config files
    for file in ${FISH_FILES[@]}
    do
        if [ -e $HOME/.config/.fish/$file ] ; then
            echo "hoge"
        else
            ln -sv $HOME/dotfiles/.fish/$file $HOME/.config/fish/$file
        fi
    done

    # fisher
    if type "fisher" > /dev/null 2>&1 ; then
		echo "-------------- download fisher --------------"
        curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
        echo "-------------- fisher install complete! --------------"
    fi
fi

# Neovim
if type "nvim" > /dev/null 2>&1 ; then
	mkdir -p $HOME/.config/nvim
	if [ -e $HOME/.config/nvim/init.vim ] ; then
		echo "init.vim is already exist."
	else
		ln -sv $HOME/dotfiles/.vimrc $HOME/.config/nvim/init.vim
		echo "symbolic link: $HOME/dotfiles/.vimrc -> $HOME/.config/nvim/init.vim"
	fi
fi

echo "----------------------------"
echo "dotfiles is installed!"

