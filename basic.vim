colorscheme molokai
syntax on

function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

set encoding=utf-8
set title
set ruler
set number
set wildmenu
set statusline=2
set laststatus=2
set cmdheight=2
set t_Co=256
set expandtab
set tabstop=2
set softtabstop=0
set shiftwidth=2
set hlsearch
set showmatch
set cindent
set smartindent
set smarttab
set whichwrap=b,s,h,l,<,>,[,]
set showcmd
set ignorecase
set smartcase
set noincsearch
set nobackup
set noswapfile
set backspace=indent,eol,start
set clipboard=unnamed,autoselect
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

" NERDTree
let g:NERDTreeShowBookmarks=1
if !argc()
  autocmd vimenter * NERDTree|normal gg3j
endif

" lightline.vim
let g:lightline = {
  \ 'colorcheme': 'landscape',
  \ }
