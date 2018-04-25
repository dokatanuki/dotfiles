""""""""""""""""""
"  vim-plug.vim  "
""""""""""""""""""
if has('vim_starting')
	set rtp+=~/.vim/plugged/vim-plug
	if !isdirectory(expand('~/.vim/plugged/vim-plug'))
		echo 'install vim-plug...'
		call system('mkdir -p ~/.vim/plugged/vim-plug')
		call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
	end
endif

call plug#begin('~/.vim/plugged')
	" editing
	Plug 'junegunn/vim-plug', {
		\ 'dir': '~/.vim/plugged/vim-plug/autoload'}
	Plug 'Lokaltog/vim-easymotion'
	Plug 'Yggdroot/indentLine'
	Plug 'kana/vim-smartinput'
	Plug 'junegunn/vim-easy-align'
	Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-line'
	Plug 'kana/vim-operator-user' | Plug 'rhysd/vim-operator-surround' 

	" utilities
	Plug 'vim-scripts/vim-auto-save'
	Plug 'tpope/vim-fugitive'
	Plug 'machakann/vim-highlightedyank'
	Plug 'rhysd/migemo-search.vim'
	Plug 'majutsushi/tagbar'
	Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
	Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
	Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

	" completion and linting
	Plug 'w0rp/ale'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	if has('nvim')
		Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
		Plug 'Shougo/deoplete.nvim'
		Plug 'roxma/nvim-yarp'
		Plug 'roxma/vim-hug-neovim-rpc'
	endif
	Plug 'Shougo/neco-syntax'
	Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

	" python
	Plug 'davidhalter/jedi-vim'

	" colorschemes
	Plug 'tomasr/molokai'
	Plug 'vim-scripts/twilight'
	Plug 'jacoborus/tender.vim', { 'as': 'tender' }
	Plug 'jonathanfilip/vim-lucius'
	Plug 'w0ng/vim-hybrid'

	" filetype
	Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoUpdateBinaries'}
	Plug 'lervag/vimtex', {'for': 'tex'}
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
set autoread
set noerrorbells
set nostartofline
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
" スクロール開始位置
set scrolloff=10
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
	" set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
set bg=dark
colorscheme hybrid

" set airline theme
" let g:airline_theme = ''


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
"  Transparent  "
"""""""""""""""""
" colorschemeの読み込みが完了したあとにカラー設定の上書き
augroup TransparentBG
	autocmd!
"	autocmd Colorscheme * highlight Normal ctermbg=none
"	autocmd Colorscheme * highlight NonText ctermbg=none
"	autocmd Colorscheme * highlight LineNr ctermbg=none
"	autocmd Colorscheme * highlight Folded ctermbg=none
"	autocmd Colorscheme * highlight EndOfBuffer ctermbg=none
augroup END


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
" Jump next(prev) paragraph
noremap <S-j> }
noremap <S-k> {
noremap ; :
noremap : ;
noremap Caps_Lock Zenkaku_Hankaku
inoremap Caps_Lock Zenkaku_Hankaku
inoremap jj <ESC>
inoremap <silent> <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-x>\<C-o>"
inoremap <silent> <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-x>\<C-o>"

" command mode
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" tab
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" toggles
nnoremap <silent> <Leader>tf :NERDTreeToggle<CR>
nnoremap <silent> <Leader>tl :ALEToggle<CR>
nnoremap <silent> <Leader>tt :TagbarToggle<CR>
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

" vimgrep
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>
" binaryや.gitファイルを探索しない
set grepprg=grep\ -rnI\ --exclude-dir=.svn\ --exclude-dir=.git
nnoremap <Leader>g :vimgrep "" **<Left><Left><Left><Left>

" quickfix
augroup QfAutoCommands
	autocmd!
	autocmd QuickFixCmdPost *grep* cwindow
	" Auto-close quickfix window
	autocmd WinEnter * if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&buftype')) == 'quickfix' | quit | endif
augroup END

" vim-easymotion
" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)
nmap <Leader>w <Plug>(easymotion-bd-wl)

" fzf
inoremap <silent> <C-x><C-x><C-j> <Esc>:Snippets<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>


""""""""""""""""""
"  Plugin option "
""""""""""""""""""
" vim-easymotion
let g:EasyMotion_do_mapping=0
let g:EasyMotion_smartcase=1
if executable('cmigemo')
	let g:EasyMotion_use_migemo=1
    cnoremap <expr><CR> migemosearch#replace_search_word()."\<CR>"
endif

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim-operator-surround
" operator mappings
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

" vim-auto-save
let g:auto_save = 1  " enable AutoSave on Vim startup

" fugative
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

" nerdtree
" nerdrreeだけ残ったら自動で閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 隠しファイルの表示
let NERDTreeShowHidden = 1

" undotree
let g:undotree_WindowLayout=2

" airline
let g:airline_skip_empty_sections=1
if $USE_POWERLINE
	let g:airline_powerline_fonts=1
endif

" ale
" ファイルをオープンした際にlintしない(vimgrep用)
let g:ale_lint_on_enter = 0

" deoplete
let g:deoplete#enable_at_startup = 1

" ultisnips 
let g:UltiSnipsExpandTrigger="<tab>"



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
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = ""
let g:jedi#completions_command = ""
let g:jedi#rename_command = ""

" vimtex
let g:latex_latexmk_options = '-pdf'
