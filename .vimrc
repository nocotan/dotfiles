if has('vim_starting')
    " 初回起動時のみruntimepathにneobundleのパスを指定する
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
autocmd vimenter * if !argc() | NERDTree | endif

if has("gui_running")
    set lines=40 columns=120
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" インストールするプラグインをここに記述

NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'grep.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'hokaccha/vim-html5validator'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'marcus/rsense'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'osyo-manga/vim-watchdogs'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neocomplcache-rsense.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'supermomonga/neocomplete-rsense.vim'
NeoBundle 'szw/vim-tags'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/restart.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'ujihisa/ref-hoogle'
NeoBundle 'ujihisa/unite-haskellimport'
NeoBundleLazy 'Valloric/YouCompleteMe'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundleLazy 'vim-jp/cpp-vim', {
            \ 'autoload' : {'filetypes' : 'cpp'}
            \ }

call neobundle#end()
NeoBundleCheck

" C++
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = '-std=c++14'

" Haskell
let $PATH = $PATH . ':' . expand('~/.cabal/bin/')
let g:indent_guides_enable_on_vim_startup = 1
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}


let g:neocomplcache#sources#rsense#home_directory = '/opt/rsense-0.3'
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 20
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
if !exists('g:neocomplcache_delimiter_patterns')
    let g:neocomplcache_delimiter_patterns = {}
endif

let g:rsenseUseOmniFunc = 1

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

augroup cpp-path
    autocmd!
    autocmd FileType cpp setlocal path=.,/usr/include,/usr/local/include
augroup END

colorscheme jellybeans
syntax on
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
set display=lastline
set pumheight=10
set showmatch
set matchtime=1
set noswapfile
nnoremap + <C-a>
nnoremap - <C-x>
set nocompatible
set title
set number
set ambiwidth=double
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set nrformats-=octal
set hidden
set history=100
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set background=dark
set wildmenu
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set autowrite
set autoindent
set mouse=a             " Enable mouse usage (all modes)
set t_Co=256
set clipboard=unnamed,autoselect
set laststatus=2
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
