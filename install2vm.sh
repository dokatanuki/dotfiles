#!/bin/bash

DOT_FILES=(".vimrc" ".zshenv" ".agignore" ".ctags" ".tmux.conf")
ZSH_FILES=(".zshrc")

# dotfiles
for file in ${DOT_FILES[@]}
do
    if [ ! -e $HOME/$file ] ; then
        ln -sv $HOME/dotfiles/$file $HOME/$file
    fi
done

# zsh shell
if type "zsh" > /dev/null 2>&1 ; then
    if [ ! -e $HOME/.zplug ] ; then
        curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
    fi
    # zsh config files
    mkdir -p $HOME/.zsh
    for file in ${ZSH_FILES[@]}
    do
        if [ ! -e $HOME/.zsh/$file ] ; then
            ln -sv $HOME/dotfiles/.zsh/$file $HOME/.zsh/$file
        fi
    done
fi

# Neovim
if type "nvim" > /dev/null 2>&1 ; then
    mkdir -p $HOME/.config/nvim
    if [ ! -e $HOME/.config/nvim/init.vim ] ; then
        ln -sv $HOME/dotfiles/.vimrc $HOME/.config/nvim/init.vim
    fi
fi
