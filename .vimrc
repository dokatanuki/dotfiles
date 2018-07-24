""""""""""""""""""
"  vim-plug.vim  "
""""""""""""""""""
" python3 path
let g:python3_host_prog = expand('~/.pyenv/versions/3.6.4/envs/development/bin/python')

if has('vim_starting')
    set rtp+=~/.vim/plugged/vim-plug
    if !isdirectory(expand('~/.vim/plugged/vim-plug'))
        echo 'install vim-plug...'
        call system('mkdir -p ~/.vim/plugged/vim-plug')
        call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
    endif
endif

call plug#begin('~/.vim/plugged')
    " editing
    Plug 'junegunn/vim-plug', {
        \ 'dir': '~/.vim/plugged/vim-plug/autoload'}
    Plug 'Yggdroot/indentLine'
    Plug 'kana/vim-smartinput'
    Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-line'
    Plug 'kana/vim-operator-user' | Plug 'rhysd/vim-operator-surround'

    " utilities
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'scrooloose/nerdtree'
    Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
    Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
    " TODO: gtagsのpython補完がうまく動かないため保留
    " それまではagで代用
    " Plug 'vim-scripts/gtags.vim'
    Plug 'machakann/vim-highlightedyank'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'rking/ag.vim'

    " completion and linting
    Plug 'w0rp/ale'
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug 'zchee/deoplete-clang'
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    Plug 'Shougo/neco-vim'
    Plug 'Shougo/neco-syntax'
    Plug 'ujihisa/neco-look'

    " python
    Plug 'davidhalter/jedi-vim'

    " plantuml
    Plug 'aklt/plantuml-syntax'

    " colorschemes
    Plug 'jonathanfilip/vim-lucius'
    Plug 'w0ng/vim-hybrid'

    " filetype
call plug#end()


""""""""""""""""""""
"  Initialization  "
""""""""""""""""""""
" vimrcのautocmdをすべて削除
augroup vimrc
    autocmd!
augroup END


""""""""""""""
"  filetype  "
""""""""""""""
filetype plugin indent on


"""""""""""""
"  Editing  "
"""""""""""""
set encoding=utf-8
set fileformats=unix,dos,mac
set autoindent
set smartindent
set shiftwidth=2
set autoread
set noerrorbells
set nostartofline
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
" スクロール開始位置
set scrolloff=15
" 補完マップの長さ
set pumheight=10
" バックスペースを有効化
set backspace=indent,eol,start
" 起動時メッセージを無効化
set shortmess+=I
" クリップボードを初期化
set clipboard&
" クリップボードを有効化
if has("nvim")
    set clipboard=unnamedplus
else
    set clipboard=unnamed,autoselect,unnamedplus
endif
set mouse=a


""""""""
"  Ui  "
""""""""
syntax on
set number
" 特殊文字の可視化
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
set ruler
set wrap
set title
set mouse=a
set showcmd
set showmatch
set matchtime=1
set cursorline
set display=lastline
set wildmenu
set wildmode=list:full
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll

" show whitespace errors
hi link WhitespaceError Error
au vimrc Syntax * syn match WhitespaceError /\s\+$\| \+\ze\t/


""""""""""""
"  Colors  "
""""""""""""
" colors
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
    set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
set bg=dark
colorscheme lucius


""""""""""""
"  Search  "
""""""""""""
" インクリメンタルな検索
set incsearch
" 検索結果をハイライト表示
set hlsearch
" 大文字小文字を区別しない
set ignorecase
" 大文字が検索パターンにある場合、ignorecaseを無効化する
set smartcase
" 検索がファイル末尾まで行ったら、ファイル先頭から再開される
set wrapscan


"""""""""""
"  Cache  "
"""""""""""
if !has('nvim')
  set viminfo+=n~/.cache/vim/viminfo
endif
set dir=~/.cache/vim/swap
set noswapfile
set backup
set backupdir=~/.cache/vim/backup
set undofile
set undodir=~/.cache/vim/undo
for s:d in [&dir, &backupdir, &undodir]
  if !isdirectory(s:d)
    call mkdir(iconv(s:d, &encoding, &termencoding), 'p')
  endif
endfor


"""""""""""""""""
"  Keybindings  "
"""""""""""""""""
" Leader key
let mapleader="\<Space>"
" filetype pluginで使用されるLeader key
let maplocalleader="\<Space>\<Space>"
nnoremap <Space> \
xnoremap <Space> \

noremap <S-l> $
noremap <S-h> ^
noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap <S-j> }
noremap <S-k> {
noremap ; :
noremap : ;
noremap Caps_Lock Zenkaku_Hankaku
inoremap Caps_Lock Zenkaku_Hankaku
inoremap jj <ESC>
inoremap <silent> <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-x>\<C-o>"
inoremap <silent> <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-x>\<C-o>"

" tab
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" toggles
nnoremap <silent> <Leader>tf :NERDTreeToggle<CR>
nnoremap <silent> <Leader>tu :UndotreeToggle<CR>

" ctags
set tags=tags;,tag
set notagbsearch
" カーソルの単語の定義先にジャンプ（複数候補はリスト表示）
nnoremap tj :exe("tjump ".expand('<cword>'))<CR>
" tag stack を戻る -> tp(tag pop)よりもtbの方がしっくりきた
nnoremap tb :pop<CR>
" tag stack を進む
nnoremap tn :tag<CR>
" 縦にウィンドウを分割してジャンプ
nnoremap tv :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
" 横にウィンドウを分割してジャンプ
nnoremap th :split<CR> :exe("tjump ".expand('<cword>'))<CR>
" tag list を表示
nnoremap tl :ts<CR>
" tag をインクリメンタルに検索
nnoremap ts :Tags <C-r>=expand("")<CR><CR>

" gtags: pythonの補完がうまくいかないため，さしあたってagで代用
" 定義を探す
" nnoremap gj :GtagsCursor<CR>
" 参照を探す
" nnoremap gk :Gtags -r <C-r><C-w><CR>
" 戻る
" nnoremap gn :cn<CR>
" nnoremap gp :cp<CR>

" quickfix
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>

augroup QfAutoCommands
    autocmd!
    autocmd QuickFixCmdPost *grep* cwindow
    " Auto-close quickfix window
    autocmd WinEnter * if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&buftype')) == 'quickfix' | quit | endif
augroup END

" ag
if executable('ag')
    let g:ag_working_path_mode="r"
    nnoremap <Leader>g :Ag --follow --nocolor --nogroup --hidden -S 
endif

" NERDTree
nnoremap <silent> <Leader>r :NERDTreeFind<CR><C-w><C-w>

" Shortcut
" nnoremap <silent> <Leader>f :Denite file_rec<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>


""""""""""""""""""
"  Plugin option "
""""""""""""""""""
" vim-operator-surround
" operator mappings
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

" nerdtree
augroup NERDTreeAutoCommands
    autocmd!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    " TODO: ファイルが開かれた時にNERDTreeでFindして元に戻る
augroup END
" 隠しファイルの表示
let NERDTreeShowHidden = 1

" undotree
let g:undotree_WindowLayout=2

" airline
let g:airline_skip_empty_sections=1
if $USE_POWERLINE
    let g:airline_powerline_fonts=1
endif

" fzf
let g:fzf_tags_command = 'ctags -R'

" ale
let g:ale_lint_on_enter = 0
"\   'python': ['autopep8', 'isort'],
let g:ale_fixers = {
\   'python': [],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\}
let g:ale_fix_on_save = 1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 2
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1

" deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang'

" Let <Tab> also do completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"close the preview window after completion is done.
augroup DeopleteAutoCommands
    autocmd!
    autocmd CompleteDone * pclose!
augroup END

" ultisnips 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" denite
call denite#custom#var('file_rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-S', '-g', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', [])
call denite#custom#var('grep', 'default_opts',
      \ ['--nocolor', '--nogroup', '--hidden', '-S', '-g'])


"""""""""""""
" filetype  "
"""""""""""""
" jedi-vim
augroup PythonAutoCommands
    autocmd!
    autocmd FileType python setlocal completeopt-=preview
augroup END
let g:jedi#goto_command = ""
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = ""
let g:jedi#usages_command = ""
let g:jedi#completions_command = ""
let g:jedi#rename_command = ""


""""""""
" MISC "
" TODO: デフォルト補完になれてきたら削除する
"" 入力キーの辞書
let s:compl_key_dict = {
      \ char2nr("\<C-l>"): "\<C-x>\<C-l>",
      \ char2nr("\<C-n>"): "\<C-x>\<C-n>",
      \ char2nr("\<C-p>"): "\<C-x>\<C-p>",
      \ char2nr("\<C-k>"): "\<C-x>\<C-k>",
      \ char2nr("\<C-t>"): "\<C-x>\<C-t>",
      \ char2nr("\<C-i>"): "\<C-x>\<C-i>",
      \ char2nr("\<C-]>"): "\<C-x>\<C-]>",
      \ char2nr("\<C-f>"): "\<C-x>\<C-f>",
      \ char2nr("\<C-d>"): "\<C-x>\<C-d>",
      \ char2nr("\<C-v>"): "\<C-x>\<C-v>",
      \ char2nr("\<C-u>"): "\<C-x>\<C-u>",
      \ char2nr("\<C-o>"): "\<C-x>\<C-o>",
      \ char2nr('s'): "\<C-x>s",
      \ char2nr("\<C-s>"): "\<C-x>s"
      \}
" 表示メッセージ
let s:hint_i_ctrl_x_msg = join([
      \ '<C-l>: While lines',
      \ '<C-n>: keywords in the current file',
      \ "<C-k>: keywords in 'dictionary'",
      \ "<C-t>: keywords in 'thesaurus'",
      \ '<C-i>: keywords in the current and included files',
      \ '<C-]>: tags',
      \ '<C-f>: file names',
      \ '<C-d>: definitions or macros',
      \ '<C-v>: Vim command-line',
      \ "<C-u>: User defined completion ('completefunc')",
      \ "<C-o>: omni completion ('omnifunc')",
      \ "s: Spelling suggestions ('spell')"
      \], "\n")
function! s:hint_i_ctrl_x() abort
  echo s:hint_i_ctrl_x_msg
  let c = getchar()
  return get(s:compl_key_dict, c, nr2char(c))
endfunction

inoremap <expr> <C-x>  <SID>hint_i_ctrl_x()"""""""
