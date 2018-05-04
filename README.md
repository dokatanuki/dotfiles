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
- ctags
### `Optional`
- tmux
- cmigemo
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
Then, you need to run PlugInstall command in vim cmdline to install plugins listed in ".vimrc".
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
Vim8 might raise error even if :echo has("python3") is 1.  
You should check python3 path run in Vim8.  
```
:python3 print(sys.path)
```
Install neovim module to python3 printed.  

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

---

### Reference
[zplug](https://github.com/zplug/zplug "zplug")  
[awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins "awesome-zsh-plugins")  
[vim-plug](https://github.com/junegunn/vim-plug "vim-plug")  
[latexmk で楽々 TeX タイプセットの薦め](https://konn-san.com/prog/why-not-latexmk.html "latexmk で楽々 TeX タイプセットの薦め")  
[ミニマリストのためのVim + Tex環境](https://qiita.com/kota9/items/e6c6726a693118299d6b "ミニマリストのためのVim + Tex環境")  
