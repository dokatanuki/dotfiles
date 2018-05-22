# dotfiles


## Description
Dotfiles for my personal use.  

---

### Requirement
### `Required`
- Neovim or Vim8
- Zsh
- Git
- fzf
- Python3
### `Optional`
- tmux
- direnv
- ctags
- gtags
- latexmk

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

### Uninstallation
### `Uninstall`
```sh
$ cd ~/dotfiles
$ bash uninstall.sh
```
<br>
If you want to uninstall completely, remove ~/.zplug and ~/.vim dirs.  
Note that removing these directories may affect your previous environment.  

---

### Note
### Install Vim8 to Ubuntu
```sh
$ sudo apt-add-repository ppa:jonathonf/vim
$ sudo apt update
$ sudo apt install vim
```
Vim8 might raise error even if :echo has("python3") is True.  
Maybe your vim refers system python.  
(If you use pyenv or something like that, this problem might occur.)  
```
:python3 print(sys.path)
```
You should add python3 path manually to ".vim/ftplugin/python.vim".  

### Install latexmk
### `MacOS`
```sh
$ brew cask install mactex
```
### `Ubuntu`
```sh
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-add-repository:texlive-backports/ppa
$ sudo apt-get install texlive-lang-cjk
$ sudo apt-get install latexmk
```

### Install gtags
### `MacOS or Linux`
Assume that you already downloaded gtags source and extract it.  
```sh
$ ./configure
$ make
$ cd global-xxx
$ cp global/global ~/bin
$ cp gtags/gtags ~/bin
```

---

### Reference
[zplug](https://github.com/zplug/zplug "zplug")  
[awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins "awesome-zsh-plugins")  
[vim-plug](https://github.com/junegunn/vim-plug "vim-plug")  
[latexmk で楽々 TeX タイプセットの薦め](https://konn-san.com/prog/why-not-latexmk.html "latexmk で楽々 TeX タイプセットの薦め")  
[ミニマリストのためのVim + Tex環境](https://qiita.com/kota9/items/e6c6726a693118299d6b "ミニマリストのためのVim + Tex環境")  
