# dotfiles


## Description
Dotfiles for my personal use.  


## Requirement
### Required
- Neovim or Vim8 (I haven't tested Vim8)
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
- move cursol to an arbitrary position  
If cmigemo is installed, you can search japanese with romaji.  
```
<Leader>s
```

- jump next paragraph
```
<S-j>
```

- jump previous paragraph
```
<S-k>
```

- delete text between "  
on text you wanna delete
```
di"
```

## Reference
[zplug](https://github.com/zplug/zplug "zplug")  
[awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins "awesome-zsh-plugins")  
[vim-plug](https://github.com/junegunn/vim-plug "vim-plug")  
