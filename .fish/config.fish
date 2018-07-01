###############
# ENVIRONMENT #
###############
set fish_greeting ''
set -x LANG ja_JP.UTF-8
set -x TERM xterm-256color
set -x EDITOR vim
set -x XDG_CONFIG_HOME ~/.config

## vi mode
function fish_mode_prompt 
end
fish_vi_key_bindings


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

# gitのbranch名取得
function _git_branch
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
end

# 右prompt
function fish_right_prompt
    echo (_git_branch)
end

# my change directory
function j
    z -l | awk '{ print $2 }' | fzf | read selected_dir

    if test -n $selected_dir
        cd $selected_dir
    end
end

##########
# PLUGIN #
##########
# z
eval (mkdir -p $HOME/.z)
set -x Z_CMD 'z'
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

# fzf
set -x FZF_DEFAULT_COMMAND 'ag --hidden -g ""'
set -x FZF_DEFAULT_OPTS '--height 40% --reverse --border'

# tmux: bashから起動, tmuxのデフォルトシェルをfishにしてある