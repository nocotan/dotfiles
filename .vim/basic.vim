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

set ambiwidth=double              " Use twice the width of ASCII characters.
set autochdir                     " Switch chdir automatically.
set autoread                      " Switch back to using the global value.
set backspace=indent,eol,start    " Delete all by backspace .
set cmdheight=2                   " Show 2lines fo cmd line.
set foldlevel=99
set helplang=ja,en
set helpheight=999
set hidden
set matchpairs& matchpairs+=<:>
set nobackup
set noerrorbells
set noswapfile
set notimeout
set notitle
set nowritebackup
set nrformats=
set number
set ruler
set scrolloff=3
set sidescrolloff=6
set showcmd
set smarttab
set textwidth=0
set ttimeout
set timeoutlen=100
set visualbell t_vb=
set virtualedit=all
set wrap



"----------------------------
" Visual
"----------------------------

set background=dark
colorscheme hybrid
syntax on
highlight Normal ctermbg=none

set t_Co=256
set colorcolumn=80

set statusline=2
set laststatus=2

set cursorcolumn
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
" vimrc
"----------------------------

" easy open vimrc
if has("win64")
  let vimrcbody = '$HOME/_vimrc'
else
  let vimrcbody = '$HOME/.vimrc'
endif

function! OpenFile(file)
  let empty_buffer=
    \ line('$')==1 && strlen(getline('1'))==0
  if empty_buffer && !&modified
    execute 'e ' . a:file
  else
    execute 'tabnew ' . a:file
  endif
endfunction

command! OpenMyVimrc call OpenFile(vimrcbody)
nnoremap <Space><Space> :<C-u>OpenMyVimrc<CR>

" easy reload vimrc
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    execute 'source ' . a:file
  endif
  echo 'Reload vimrc.'
endfunction

nnoremap <F5> <Esc>:<C-u>source $MYVIMRC<CR>
      \ :source $MYVIMRC<CR>
      \ :call SourceIfExists('~/vimfiles/ftplugin/' . &filetype . '.vim')<CR>



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
