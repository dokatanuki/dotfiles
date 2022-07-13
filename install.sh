#!/bin/bash

# Check requirements
if !(type "zsh" > /dev/null 2>&1) ; then
    cat << EOS
Please install zsh
    $ apt-get install zsh
EOS
    exit
elif !(type "nvim" > /dev/null 2>&1) ; then
    cat << EOS
Please install neovim
    $ add-apt-repository ppa:neovim-ppa/unstable
    $ apt-get update
    $ apt-get install neovim
EOS
    exit
elif !(type "tmux" > /dev/null 2>&1) ; then
    cat << EOS
Please install tmux
    $ apt-get install tmux
EOS
    exit
elif !(type "ag" > /dev/null 2>&1) ; then
    cat << EOS
Please install silversearcher-ag
    $ apt-get install silversearcher-ag
EOS
    exit
elif [ ! -e $HOME/.pyenv ] ; then
    cat << EOS
Please install pyenv
See README ("Install pyenv and pyenv-virtualenv" section)
EOS
    exit
fi

DOT_FILES=(".zshrc" ".vimrc" ".agignore" ".ctags" ".tmux.conf")

# Create symbolic links
for file in ${DOT_FILES[@]}
do
    if [ ! -e $HOME/$file ] ; then
        ln -sv $HOME/dotfiles/$file $HOME/$file
    fi
done

if type "nvim" > /dev/null 2>&1 ; then
    mkdir -p $HOME/.config/nvim
    if [ ! -e $HOME/.config/nvim/init.vim ] ; then
        ln -sv $HOME/dotfiles/.vimrc $HOME/.config/nvim/init.vim
    fi
fi
