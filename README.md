# dotfiles


### Description
Dotfiles for my personal use.  

### Caution
Assume that your default shell is bash.  
bash will automatically execute tmux(tmux's default shell is fish) and exit.  
This makes it possible that default shell is bash but run fish like a default shell.  

### Requirement
### `Required`
- Neovim or Vim8
- Python3 and 'neovim' module
- fish shell
- tmux
### `Optional`
- ag
- ctags
- direnv

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
### `Install Vim8 to Ubuntu`
```sh
$ sudo apt-add-repository ppa:jonathonf/vim
$ sudo apt update
$ sudo apt install vim
```

### `Install pyenv and pyenv-virtualenv`
```sh
$ sudo apt-get -y install zlib1g libbz2-dev tk-dev libssl-dev libreadline-dev libsqlite3-dev libffi-dev
$ git clone https://github.com/pyenv/pyenv.git ~/.pyenv
$ git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
```
Init script is written at "config.fish".

---

### Reference
[iTerm2 Hotkey Settings](https://qiita.com/okamu_/items/a5086d2d5ba405f35acb "iTerm2")
[vim-plug](https://github.com/junegunn/vim-plug "vim-plug")  
[ctag, gtagsで超捗るコードリーディング](https://qiita.com/coil_msp123/items/cb36e6698aa6734a901e "ctag, gtagsで超捗るコードリーディング")  
[ag: The Silver Searcher](https://github.com/ggreer/the_silver_searcher "The Silver Searcher")
