#!/bin/bash

DOT_FILES=(".vimrc" ".agignore" ".ctags" ".direnvrc")
FISH_FILES=("config.fish" "fishfile")

echo "-------------- start install dotfiles --------------"

# dotfiles
for file in ${DOT_FILES[@]}
do
    if [ ! -e $HOME/$file ] ; then
        ln -sv $HOME/dotfiles/$file $HOME/$file
    fi
done

# fish shell
if type "fish" > /dev/null 2>&1 ; then
    # fish config files
    for file in ${FISH_FILES[@]}
    do
        if [ ! -e $HOME/.config/fish/$file ] ; then
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
    if [ ! -e $HOME/.config/nvim/init.vim ] ; then
        ln -sv $HOME/dotfiles/.vimrc $HOME/.config/nvim/init.vim
        echo "symbolic link: $HOME/dotfiles/.vimrc -> $HOME/.config/nvim/init.vim"
    fi
fi

echo "-------------- dotfiles install complete! --------------"
