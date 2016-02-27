  1 if has('vim_starting')↲
  2     " 初回起動時のみruntimepathにneobundleのパスを指定する↲
  3     set runtimepath+=~/.vim/bundle/neobundle.vim/↲
  4 endif↲
  5 autocmd vimenter * if !argc() | NERDTree | endif↲
  6 ↲
  7 if has("gui_running")↲
  8     set lines=40 columns=120↲
  9 endif↲
 10 ↲
 11 " NeoBundleを初期化↲
 12 call neobundle#begin(expand('~/.vim/bundle/'))↲
 13 NeoBundleFetch 'Shougo/neobundle.vim'↲
 14 " インストールするプラグインをここに記述↲
 15 ↲
 16 NeoBundle 'bronson/vim-trailing-whitespace'↲
 17 NeoBundle 'eagletmt/ghcmod-vim'↲
 18 NeoBundle 'elixir-lang/vim-elixir'↲
 19 NeoBundle 'grep.vim'↲
 20 NeoBundle 'hail2u/vim-css3-syntax'↲
 21 NeoBundle 'hokaccha/vim-html5validator'↲
 22 NeoBundle 'itchyny/lightline.vim'↲
 23 NeoBundle 'jelera/vim-javascript-syntax'↲
 24 NeoBundle 'kana/vim-filetype-haskell'↲
 25 NeoBundle 'marcus/rsense'↲
 26 NeoBundle 'nathanaelkane/vim-indent-guides'↲
 27 NeoBundle 'nanotech/jellybeans.vim'↲
 28 NeoBundle 'othree/html5.vim'↲
 NORMAL  .vimrc                                     unix | utf-8 | vim    6%    9:5  
".vimrc" 145L, 4167C
