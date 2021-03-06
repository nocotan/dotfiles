set nocompatible               " be iMproved
filetype off                   " required!

set runtimepath+=~/.vim/bundle/neobundle.vim/


" let Vundle manage Vundle
" required!
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"------------------
" vimproc
"------------------
"NeoBundle 'Shougo/vimproc.vim', {
"            \ 'build': {
"            \     'windows': 'tools\\update-dll-mingw',
"            \     'cygwin': 'make -f make_cygwin.mak',
"            \     'mac': 'make -f make_mac.mak',
"            \     'linux': 'make',
"            \     'unix': 'gmake',
"            \     },
"            \ }


"------------------
" Code Completions
"------------------
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'ervandew/supertab'
NeoBundle 'mattn/emmet-vim'
" snippets
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'
"------ snipmate dependencies -------
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'

"-----------------
" Fast navigation
"-----------------
NeoBundle 'Lokaltog/vim-easymotion'

"--------------
" Fast editing
"--------------
"NeoBundle 'godlygeek/tabular'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'tpope/vim-surround'

"--------------
" IDE features
"--------------
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Lokaltog/vim-powerline'
" NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'
"NeoBundleLazy 'wesleyche/SrcExpl', {
"            \ 'autoload' : { 'commands': ['SrcExplToggle']}}
NeoBundle 'Xuyuanp/nerdtree-git-plugin'

"-------------
" Other Utils
"-------------
NeoBundle 'nvie/vim-togglemouse'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'rhysd/accelerated-jk'
"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------
NeoBundle 'tpope/vim-pathogen'

"------- web backend ---------
NeoBundle '2072/PHP-Indenting-for-VIm'
NeoBundle 'lepture/vim-jinja'

"------- web frontend ----------
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'nono/jquery.vim'
NeoBundle 'othree/html5.vim'
NeoBundleLazy 'othree/yajs.vim', {'filetypes': ['html', 'php', 'javascript']}
NeoBundle 'nicklasos/vim-jsx-riot'
NeoBundle 'slim-template/vim-slim'

"------- markup language -------
NeoBundle "rcmdnk/vim-markdown"
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

"------------- LaTex -----------
NeoBundle 'lervag/vimtex'

"------------ toml -------------
NeoBundle "cespare/vim-toml"

" -------- Typescript ---------
NeoBundle "leafgarland/typescript-vim"

" ----------- Dart -------------
NeoBundle "dart-lang/dart-vim-plugin"

"------ Python -------
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'vim-python/python-syntax'
NeoBundle 'davidhalter/jedi-vim'

"------- Ruby --------

"------ C/C++ --------
NeoBundle 'octol/vim-cpp-enhanced-highlight'
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'vim-scripts/gtags.vim'

"------- Scala -------
NeoBundle 'derekwyatt/vim-scala'

"------- Go ----------
NeoBundleLazy 'fatih/vim-go', { 'autoload': { 'filetypes': 'go' } }

"------- Julia ----------
NeoBundle 'JuliaEditorSupport/julia-vim'

"------ Rust ---------
NeoBundle 'rhysd/rust-doc.vim'
NeoBundle 'rust-lang/rust.vim'

"------ Elixir -------
NeoBundle "elixir-lang/vim-elixir"

"------- OCaml -------
NeoBundle 'cohama/the-ocamlspot.vim'

"------ Haskell ------
NeoBundle 'dag/vim2hs'
NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'ujihisa/ref-hoogle'
NeoBundle 'ujihisa/unite-haskellimport'

"----- Arduino -------
NeoBundle "sudar/vim-arduino-syntax"

"------- FPs ------
NeoBundle 'kien/rainbow_parentheses.vim'

"--------------
" Color Schemes
"--------------
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'cocopon/iceberg.vim'
"NeoBundle 'justb3a/vim-smarties'
"NeoBundle 'nocotan/ncer.vim'
"NeoBundle 'jacoborus/tender.vim'
"NeoBundle 'Lokaltog/vim-distinguished'
"NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'chriskempson/vim-tomorrow-theme'
"NeoBundle 'fisadev/fisa-vim-colorscheme'
"NeoBundle 'rickharris/vim-blackboard'
"NeoBundle 'rickharris/vim-monokai'
"NeoBundle 'tpope/vim-vividchalk'
"NeoBundle 'w0ng/vim-hybrid'

call neobundle#end()
NeoBundleCheck

filetype plugin indent on
