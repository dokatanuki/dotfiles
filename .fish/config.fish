###############
# ENVIRONMENT #
###############
set fish_greeting ''
set -x LANG ja_JP.UTF-8
set -x TERM xterm-256color
set -x EDITOR vim
set -x XDG_CONFIG_HOME ~/.config


#########
# ALIAS #
#########
alias ag='ag -S'
alias cp='cp -iv'
alias grep='grep -rn --color=auto --exclude-dir={.git,dummy} --exclude={dummy,hoge}'
alias ls='ls -aF -G'
alias mkdir='mkdir -p'
alias mv='mv -iv'
alias rm='rm -iv'
alias ..='cd ..'


############
# FUNCTION #
############
# override default cd command
function cd
    builtin cd $argv[1]
    ls
end


##########
# PLUGIN #
##########
# z
eval (mkdir -p $HOME/.z)
set -x Z_CMD 'j'
set -x Z_DATA "$HOME/.z/.z"



#################
# EXTERNAL TOOL #
#################
# Neovim
if test (string length (type 'nvim')) -gt 0
    set -x EDITOR nvim
    alias vim='nvim'
end

# pyenv, pyenv-virtualenv
if test (string length (type 'pyenv')) -gt 0
    set -x PYENV_ROOT "$HOME/.pyenv"
    set -x PATH $PYENV_ROOT $PATH
    status --is-interactive; and source (pyenv init -|psub); and source (pyenv virtualenv-init -|psub)
end

# direnv
if test (string length (type 'direnv')) -gt 0
    eval (direnv hook fish)
end

# fzf TODO: fzfで隠しファイルも検索
set -x FZF_DEFAULT_COMMAND 'ag --hidden -g ""'
set -x FZF_DEFAULT_OPTS '--height 40% --reverse --border'

# tmux: bashから起動, tmuxのデフォルトシェルをfishにしてある
