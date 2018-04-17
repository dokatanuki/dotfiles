# 環境変数
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

##############
# completion #
##############
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

############
# vcs_info #
############
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

##########
# option #
##########
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

##########
# keymap #
##########

#########
# alias #
#########
alias ll='ls -l'
alias ls='ls -aF'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '
alias -g L='| less'
alias -g G='| grep'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

############
# function #
############

########
# tool #
########
# conda 
alias activate="source $PYENV_ROOT/versions/anaconda3-4.4.0/bin/activate"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# neovim
if type "nvim" > /dev/null 2>&1; then
	alias vim="nvim"
else
fi
export XDG_CONFIG_HOME=~/.config

# tmux
if type "tmux" > /dev/null 2>&1 ; then
	[[ -z "$TMUX" && ! -z "$PS1" ]] && exec tmux
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

#########
# zplug #
#########
# install
if [ ! -e $HOME/.zplug ] ; then
    printf "Install zplug? [y/N]: "
    if read -q; then
        curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
    fi
fi

# initialize
source $HOME/.zplug/init.zsh

# plugin
# completion and linting
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "b4b4r07/enhancd, use:init.sh"

# utils
zplug "zsh-users/zsh-history-substring-search"
zplug "junegunn/fzf-bin, from:gh-r, as:command, rename-to:fzf"

# prompt
zplug "mafredri/zsh-async, from:github"
zplug "sindresorhus/pure, use:pure.zsh, from:github, as:theme"


# install plugin
if ! zplug check ; then
    zplug install
fi

# load plugin
zplug load
