#!/bin/bash

# Check requirements
if !(type "zsh" > /dev/null 2>&1) ; then
    cat << EOS
Please install zsh
e.g. sudo apt-get install zsh
EOS
    exit
elif !(type "nvim" > /dev/null 2>&1) ; then
    cat << EOS
Please install neovim
e.g. sudo add-apt-repository ppa:neovim-ppa/unstable
     sudo apt-get update
     sudo apt-get install neovim
EOS
    exit
elif !(type "tmux" > /dev/null 2>&1) ; then
    cat << EOS
Please install tmux
e.g. sudo apt-get install tmux
EOS
    exit
elif [ ! -e $HOME/.pyenv ] ; then
    cat << EOS
Please install pyenv
See README ("Install pyenv and pyenv-virtualenv" section)
EOS
    exit
fi

# Define config files
DOT_FILES=(".zshrc" ".vimrc" ".tmux.conf" ".agignore" ".ctags" ".direnvrc" ".latexmkrc")

# Dotfiles
for file in ${DOT_FILES[@]}
do
    if [ ! -e $HOME/$file ] ; then
        ln -sv $HOME/dotfiles/$file $HOME/$file
    fi
done

# Neovim
if type "nvim" > /dev/null 2>&1 ; then
    mkdir -p $HOME/.config/nvim
    if [ ! -e $HOME/.config/nvim/init.vim ] ; then
        ln -sv $HOME/dotfiles/.vimrc $HOME/.config/nvim/init.vim
    fi
fi
