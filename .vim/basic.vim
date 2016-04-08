"----------------------------
" encoding
"----------------------------

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp932,sjis,euc-jp,iso-2022-jp

" 改行コード
set fileformat=unix
set fileformats=unix,dos,mac


"----------------------------
" Common
"----------------------------
" reset autocmd
augroup vimrc
  autocmd!
augroup END

set number
set ruler
set notitle
set visualbell t_vb=
set wrap
set wildmenu
set cmdheight=2
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
set nowritebackup
set nobackup
set noswapfile
set notimeout
set ttimeout
set timeoutlen=100
set helplang=ja,en
set foldlevel=99
set backspace=indent,eol,start
set clipboard=unnamed,autoselect
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
set virtualedit=all
set matchtime=3
set matchpairs& matchpairs+=<:>
set clipboard+=autoselect


"----------------------------
" Visual
"----------------------------

colorscheme molokai
syntax on
highlight Normal ctermbg=none

set t_Co=256
set colorcolumn=80

set statusline=2
set laststatus=2

set cursorline
highlight clear CursorLine
highlight CursorLine ctermbg=17 guibg=black

augroup cch
  autocmd!
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

highlight SpellBad cterm=underline ctermbg=0


"----------------------------
" Indent
"----------------------------

filetype plugin indent on






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

cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

vmap <C-c> :w !xsel -ib<CR><CR>

" NERDTree
let g:NERDTreeShowBookmarks=1
if !argc()
  autocmd vimenter * NERDTree|normal gg3j
endif

" lightline.vim
let g:lightline = {
  \ 'colorcheme': 'landscape',
  \ }
