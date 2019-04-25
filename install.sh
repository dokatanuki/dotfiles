#!/bin/bash

# Check requirements
if !(type "fish" > /dev/null 2>&1) ; then
    cat << EOS
Please install fish
e.g. sudo apt-get install fish
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
DOT_FILES=(".bashrc" ".vimrc" ".tmux.conf" ".agignore" ".ctags" ".direnvrc" ".latexmkrc")
FISH_FILES=("config.fish" "fishfile")

# Dotfiles
for file in ${DOT_FILES[@]}
do
    if [ ! -e $HOME/$file ] ; then
        ln -sv $HOME/dotfiles/$file $HOME/$file
    fi
done

# Fish shell
if type "fish" > /dev/null 2>&1 ; then
    # Fish config files
    mkdir -p $HOME/.config/fish
    for file in ${FISH_FILES[@]}
    do
        if [ ! -e $HOME/.config/fish/$file ] ; then
            ln -sv $HOME/dotfiles/.fish/$file $HOME/.config/fish/$file
        fi
    done
    # Fisher
    if type "fisher" > /dev/null 2>&1 ; then
        curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
    fi
fi

# Neovim
if type "nvim" > /dev/null 2>&1 ; then
    mkdir -p $HOME/.config/nvim
    if [ ! -e $HOME/.config/nvim/init.vim ] ; then
        ln -sv $HOME/dotfiles/.vimrc $HOME/.config/nvim/init.vim
    fi
fi

# UltiSnips
if [ ! -e $HOME/.vim/UltiSnips ] ; then
    ln -sv $HOME/dotfiles/.vim/UltiSnips/ $HOME/.vim/UltiSnips
fi

# ftdetect
if [ ! -e $HOME/.vim/ftdetect ] ; then
    ln -sv $HOME/dotfiles/.vim/ftdetect/ $HOME/.vim/ftdetect
fi
if [ ! -e $HOME/.config/nvim/ftdetect ] ; then
    ln -sv $HOME/dotfiles/.vim/ftdetect/ $HOME/.config/nvim/ftdetect
fi
