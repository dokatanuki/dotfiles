# dotfiles


### Description
Dotfiles for my personal use.

### Caution
Assume that your default shell is bash.
bash will automatically execute tmux(tmux's default shell is fish, see `.tmux.conf`) and exit.
This makes it possible that default shell is bash but run fish like a default shell.

### Requirement
### `Required`
- Neovim
- pyenv(python3 and 'neovim' module)
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

---

### Note
### `Install pyenv and pyenv-virtualenv`
```sh
$ sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
$ git clone https://github.com/pyenv/pyenv.git ~/.pyenv
$ git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
```

### `Fix error: -bash: warning: setlocale: LC_ALL: cannot change locale (ja_JP.UTF-8)`
```sh
$ localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
```
