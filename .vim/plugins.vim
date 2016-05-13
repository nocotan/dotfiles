" Flags
let s:use_dein = 1

" vi非互換
if !&compatible
  set nocompatible
endif

" dein.vimのディレクトリ
let s:vimdir = $HOME . "/.vim"
if has("vim_starting")
  if ! isdirectory(s:vimdir)
    call system("mkdir " . s:vimdir)
  endif
endif

" dein
let s:dein_enabled = 0
if s:use_dein && v:version >= 704
  let s:dein_enabled = 1
  let s:dein_dir = s:vimdir . '/dein'
  let s:dein_github = s:dein_dir . '/repos/github.com'
  let s:dein_repo_name = 'Shougo/dein.vim'
  let s:dein_repo_dir = s:dein_github . '/' . s:dein_repo_name

  if !isdirectory(s:dein_repo_dir)
    echo "dein is not installed, install now "
    let s:dein_repo = "https://github.com/" . s:dein_repo_name
    echo "git clone " . s:dein_repo . " " . s:dein_repo_dir
    call system("git clone " . s:dein_repo . " " . s:dein_repo_dir)
  endif
  let &runtimepath = &runtimepath . "," . s:dein_repo_dir

  if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#add('Shougo/dein.vim')

    call dein#add('airblade/vim-gitgutter')
    call dein#add('bronson/vim-trailing-whitespace')
    call dein#add('davidhalter/jedi-vim')
    call dein#add('drillbits/nyan-modoki.vim')
    call dein#add('fisadev/vim-isort')
    call dein#add('grep.vim')
    call dein#add('hail2u/vim-css3-syntax')
    call dein#add('hynek/vim-python-pep8-indent')
    call dein#add('itchyny/landscape.vim')
    call dein#add('itchyny/lightline.vim')
    call dein#add('jmcantrell/vim-virtualenv')
    call dein#add('jceb/vim-hier')
    call dein#add('justmao945/vim-clang')
    call dein#add('kakkyz81/evervim')
    call dein#add('kannokanno/previm')
    call dein#add('kchmck/vim-coffee-script')
    call dein#add('lambdalisue/vim-django-support')
    call dein#add('mattn/emmet-vim')
    call dein#add('mattn/webapi-vim')
    call dein#add('majutsushi/tagbar')
    call dein#add('miyakogi/seiya.vim')
    call dein#add('nathanaelkane/vim-indent-guides')
    call dein#add('othree/html5.vim')
    call dein#add('osyo-manga/shabadou.vim')
    call dein#add('osyo-manga/vim-watchdogs')
    call dein#add('plasticboy/vim-markdown')
    call dein#add('scrooloose/nerdtree')
    call dein#add('scrooloose/syntastic')
    call dein#add('Shougo/neoinclude.vim')
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/unite-outline')
    call dein#add('Shougo/vimproc')
    call dein#add('tell-k/vim-autopep8')
    call dein#add('thinca/vim-quickrun')
    call dein#add('tomasr/molokai')
    call dein#add('tomtom/tcomment_vim')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tyru/open-browser.vim')
    call dein#add('ujihisa/unite-colorscheme')
    call dein#add('vim-scripts/AnsiEsc.vim')
    call dein#add('vim-scripts/ctags.vim')
    call dein#add('vim-scripts/errormarker.vim')
    call dein#add('vim-scripts/Flake8-vim')
    call dein#add('vim-scripts/sudo.vim')
    call dein#add('wakatime/vim-wakatime')
    call dein#add('wesleyche/SrcExpl')
    call dein#add('w0ng/vim-hybrid')

    call dein#end()
    call dein#save_state()
  endif

  if dein#check_install()
    call dein#install()
  endif
endif

filetype indent on
filetype plugin on
