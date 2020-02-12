#########
# zplug #
#########
# install
if [ ! -e $HOME/.zplug ] ; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

# initialize
source $HOME/.zplug/init.zsh

# plugin
# completion and linting
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/enhancd", use:init.sh

# utils
zplug "zsh-users/zsh-history-substring-search"
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf

zplug "nojhan/liquidprompt"

# install plugin
if ! zplug check ; then
    zplug install
fi

# load plugin
zplug load


###########
# plugins #
###########
# enhancd
export ENHANCD_FILTER=fzf
export ENHANCD_DISABLE_DOT=1
export ENHANCD_DISABLE_HOME=1
alias j="cd -"


############################
#  Environment Variables  #
###########################
export LANG=ja_JP.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=nvim


#########
# alias #
#########
alias ls='ls -aF -G'
alias ll='ls -lh'
alias la='ls -lAh'

alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -p'

alias ps='ps -axf'

alias ag='ag -S'
alias grep='grep --color=auto --exclude-dir={.git,dummy} --exclude={dummy,hoge}'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

alias tmp='nvim ~/tmp.md'


###########
# history #
###########
# ヒストリの共有する
setopt share_history
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000


########
# tool #
########
# neovim
if type "nvim" > /dev/null 2>&1; then
    alias vim="nvim"
else
    alias vim="/usr/bin/vim"
fi
export XDG_CONFIG_HOME=~/.config

# pyenv, pyenv-virtualenv
if [ -e $HOME/.pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    path=(
        $PYENV_ROOT/bin
        $path
    )
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# rbenv
if type "rbenv" > /dev/null 2>&1; then
    export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"
    eval "$(rbenv init -)"
fi

# direnv
if type "direnv" > /dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi

# fzf
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'


######
# os #
######
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -Fa'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -Fa --color=auto'
        ;;
esac
