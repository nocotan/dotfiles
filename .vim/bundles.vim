set nocompatible               " be iMproved
filetype off                   " required!

set runtimepath+=~/.vim/bundle/neobundle.vim/

" let Vundle manage Vundle
" required!
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"------------------
" Code Completions
"------------------
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'ervandew/supertab'
" snippets
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'
"------ snipmate dependencies -------
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'

"-----------------
" Fast navigation
"-----------------
NeoBundle 'edsono/vim-matchit'
NeoBundle 'Lokaltog/vim-easymotion'

"--------------
" Fast editing
"--------------
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'nathanaelkane/vim-indent-guides'

"--------------
" IDE features
"--------------
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'humiaozuzu/TabBar'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'bronson/vim-trailing-whitespace'

"-------------
" Other Utils
"-------------
" NeoBundle 'humiaozuzu/fcitx-status'
NeoBundle 'nvie/vim-togglemouse'

"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------
"------- web backend ---------
NeoBundle '2072/PHP-Indenting-for-VIm'
"NeoBundle 'tpope/vim-rails'
NeoBundle 'lepture/vim-jinja'
"NeoBundle 'digitaltoad/vim-jade'

"------- web frontend ----------
NeoBundle 'othree/html5.vim'
" NeoBundle 'tpope/vim-haml'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'nono/jquery.vim'
" NeoBundle 'groenewege/vim-less'
" NeoBundle 'wavded/vim-stylus'
" NeoBundle 'nono/vim-handlebars'

"------- markup language -------
NeoBundle 'tpope/vim-markdown'
" NeoBundle 'timcharper/textile.vim'

"------- Ruby --------
" NeoBundle 'tpope/vim-endwise'

"------- Go ----------
NeoBundle 'fatih/vim-go'

"------- FPs ------
NeoBundle 'kien/rainbow_parentheses.vim'
" NeoBundle 'wlangstroth/vim-racket'
" NeoBundle 'vim-scripts/VimClojure'
" NeoBundle 'rosstimson/scala-vim-support'

"--------------
" Color Schemes
"--------------
NeoBundle 'rickharris/vim-blackboard'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'rickharris/vim-monokai'
NeoBundle 'tpope/vim-vividchalk'
NeoBundle 'Lokaltog/vim-distinguished'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'fisadev/fisa-vim-colorscheme'
NeoBundle 'w0ng/vim-hybrid'

call neobundle#end()

filetype plugin indent on     " required!
