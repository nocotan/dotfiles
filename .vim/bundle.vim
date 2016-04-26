" 起動時にruntimepathにNeoBundleのパスを追加する
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

" NeoBundleのバージョン管理
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'andviro/flake8-vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'drillbits/nyan-modoki.vim'
NeoBundle 'grep.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'itchyny/landscape.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'jmcantrell/vim-virtualenv'
NeoBundle 'lambdalisue/vim-django-support'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'othree/html5.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tomasr/molokai'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'wakatime/vim-wakatime'
NeoBundle 'w0ng/vim-hybrid'
call neobundle#end()

filetype plugin indent on

NeoBundleCheck
