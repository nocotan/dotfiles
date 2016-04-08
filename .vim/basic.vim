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
set cmdheight=2
set smarttab
set showcmd
set nowritebackup
set nobackup
set noswapfile
set notimeout
set ttimeout
set timeoutlen=100
set helplang=ja,en
set foldlevel=99
set backspace=indent,eol,start
set virtualedit=all
set matchpairs& matchpairs+=<:>


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
set autoindent
set smartindent
set cindent



"----------------------------
" Search
"----------------------------

set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan



"----------------------------
" Complete
"----------------------------

set wildmenu
set wildmode=list:full
set history=1000
set complete+=k


"----------------------------
" Input assist
"----------------------------


set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
set whichwrap=b,s,h,l,<,>,[,]
set showmatch
set matchtime=3
set expandtab
set tabstop=2
set softtabstop=0
set shiftwidth=2
set display=lastline

" 括弧の補完
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap [] []<Left>
inoremap {} {}<Left>
inoremap '' ''<Left>
inoremap <> <><Left>
inoremap ** **<Left>

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



"----------------------------
" Clipboard
"----------------------------

set clipboard=unnamed,autoselect
set clipboard+=autoselect



"----------------------------
" Key mapping
"----------------------------
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

vmap <C-c> :w !xsel -ib<CR><CR>



"----------------------------
" Plugins
"----------------------------

"# NERDTree
let g:NERDTreeShowBookmarks=1
if !argc()
  autocmd vimenter * NERDTree|normal gg3j
endif


"# neocomplete
let g:acp_enableAtStartup=0
let g:neocomplete#enable_at_startup=1
let g:neocomplete#source#syntax#min_keyword_length=3
let g:neocomplete#lock_buffer_name_pattern='\*ku\*'
let g:neocomplete#force_overwrite_completefunc=1


"# lightline
let g:lightline = {
       \ 'active': {
       \   'right': [ [ 'syntastic', 'lineinfo' ],
       \              [ 'percent' ],
       \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
       \ },
       \ 'component_expand': {
       \   'syntastic': 'SyntasticStatuslineFlag',
       \ },
       \ 'component_type': {
       \   'syntastic': 'error',
       \ }
       \ }
let g:syntastic_mode_map = { 'mode': 'passive' }
augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction
