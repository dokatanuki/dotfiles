# dotfiles


## Description
Dotfiles for my personal use.  

---

### Requirement
### `Required`
- Neovim or Vim8
- Python3 and "neovim" module
- fish shell
- tmux
### `Optional`
- direnv
- ctags
- ag

---

### Installation
### `Install`
```sh
$ cd ~
$ git clone https://github.com/dokatanuki/dotfiles.git
$ cd dotfiles
$ bash install.sh
```

### `Update vim plugin`
When you launch vim for the first time, vim starts to install vim-plug automatically.  
Then, you need to run PlugInstall in vim cmdline to install plugins listed in ".vimrc".
```
:PlugInstall
```

---

### Note
### Install Vim8 to Ubuntu
```sh
$ sudo apt-add-repository ppa:jonathonf/vim
$ sudo apt update
$ sudo apt install vim
```

---

### Reference
[vim-plug](https://github.com/junegunn/vim-plug "vim-plug")  
[ctag, gtagsで超捗るコードリーディング](https://qiita.com/coil_msp123/items/cb36e6698aa6734a901e "ctag, gtagsで超捗るコードリーディング")  
