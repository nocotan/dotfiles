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

NeoBundle 'drillbits/nyan-modoki.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'grep.vim'
NeoBundle 'itchyny/landscape.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tomasr/molokai'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'vim-scripts/AnsiEsc.vim'
call neobundle#end()

filetype plugin indent on

NeoBundleCheck
