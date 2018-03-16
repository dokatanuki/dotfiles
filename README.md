# dotfiles


## Description
Dotfiles for my personal use.  


## Requirement
### Required
- Neovim
- Zsh
- Git
- fzf
- ctags
### Optional
- tmux
- cmigemo


## Installation
### Install
```sh
$ cd ~
$ git clone https://github.comdokatanuki/dotfiles.git
$ cd dotfiles
$ bash install.sh
```

### Update vim plugin
When you launch vim for the first time, vim starts to install vim-plug automatically.  
Then, you need to run PlugInstall command in vim cmdline to install plugins listed in ".vimrc".
```
:PlugInstall
```


## Uninstallation
### Uninstall
```sh
$ cd ~/dotfiles
$ bash uninstall.sh
```
If you want to uninstall completely, remove ~/.zplug and ~/.vim dirs.  
Note that removing these directories may affect your previous environment.  

## Note
### Vim
Tips how to edit with least key typing.
- add text end of sentence
```
<Leader>L
A
```
- change text middle of sentence
```
<Leader>s
```
- scroll half of page
```
<S-j> or <S-k>
```
- change forcused tab
```
<Leader>s
```
- add " surround a current line
```
sail""
```


## Reference
[zplug](https://github.com/zplug/zplug "zplug")  
[awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins "awesome-zsh-plugins")  
[vim-plug](https://github.com/junegunn/vim-plug "vim-plug")  
