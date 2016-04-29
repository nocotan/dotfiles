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

" autocmd初期化
augroup vimrc
  autocmd!
augroup END

" 自動でカレントディレクトリに切り替え
set autochdir
" バックスペースで何でも消せるようにする
set backspace=indent,eol,start
" コマンドラインの高さを2に設定
set cmdheight=2
set foldlevel=99
" サポートする言語
set helplang=ja,en
set helpheight=999
set lazyredraw
set matchpairs& matchpairs+=<:>
" エラーベルを鳴らさない
set noerrorbells
" タイムアウトしない
set notimeout
" タイトルを表示しない
set notitle
set nowritebackup
set nrformats=
" 行番号を表示
set number
" 列番号を表示
set ruler
set scrolloff=3
set sidescrolloff=6
" コマンドを表示
set showcmd
set smarttab
set textwidth=0
set ttimeout
set timeoutlen=100
set ttyfast
set visualbell t_vb=
set virtualedit=block
set wrap



"----------------------------
" File
"----------------------------


" 2byte半角
set ambiwidth=double
" 外部で変更のあったファイルを自動で読み込み
set autoread
" 複数ファイルを開けるようにする
set hidden
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile

" 保存時に行末の空白を除去
autocmd BufWritePre * :%s/\s\+$//ge



"----------------------------
" Visual
"----------------------------

" 背景色を暗くする
set background=dark
" カラースキームを指定
colorscheme hybrid
" シンタックスをonにする
syntax on
highlight Normal ctermbg=None

set t_Co=256
set colorcolumn=80

set statusline=2
set laststatus=2

set cursorcolumn
set cursorline
highlight clear CursorLine
highlight CursorLine ctermbg=0

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



"---------------------------
" Status line
"--------------------------

set statusline=%<
set statusline+=[%n]
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w
set statusline+=%{'['.(&fenc!='?&fenc:&enc).':'.&ff.']'}}}
set statusline+=%y
set statusline+=\
set statusline+=[%{&fileformat}]
set statusline+=%{fugitive#statusline(}}}

if winwidth(0) >= 130
  set statusline+=%F
else
  set statusline+=%t
endif

"----------------------------
" Search
"----------------------------

set hlsearch
set incsearch
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

set display=lastline
set expandtab
set formatoptions-=c
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
set matchtime=3
set showmatch
set softtabstop=0
set shiftwidth=2
set tabstop=2
set whichwrap=b,s,h,l,<,>,[,]
" 括弧の補完
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap [] []<Left>
inoremap {} {}<Left>
inoremap '' ''<Left>
inoremap <> <><Left>
inoremap ** **<Left>

function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=Black gui=reverse
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
set clipboard=unnamedplus
set clipboard+=autoselect



"----------------------------
" mouse
"----------------------------

if has("mouse")
  set mouse=a
  set guioptions+=a
  set ttymouse=xterm2
endif

"----------------------------
" Key mapping
"----------------------------

" esc2回で検索ハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left> <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up> <C-w>-<CR>
nnoremap <S-Down> <C-w>+<CR>
" jjでノーマルモードに移行
inoremap jj <Esc>

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

"# neocomplete

" 自動補完のポップアップ非表示
let g:acp_enableAtStartup=0
" neocompleteを使用する
let g:neocomplete#enable_at_startup=1
" smartcaseを使用する
let g:neocomplete#enable_smart_case=1
" シンタックスの長さを最小限にする
let g:neocomplete#sources#syntax#min_keyword_length=3
let g:neocomplete#lock_buffer_name_pattern='\*ku\*'


"# NERDTree
let g:NERDTreeShowBookmarks=1
if !argc()
  autocmd vimenter * NERDTree|normal gg3j
endif


"# lightline
let g:lightline = {
       \ 'colorscheme': 'wombat',
       \ 'active': {
       \   'right': [ [ 'syntastic', 'lineinfo' ],
       \              [ 'percent' ],
       \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
       \ },
       \ 'component': {
       \   'readonly': '%{&readonly?"⚷":""}',
       \ },
       \ 'component_expand': {
       \   'syntastic': 'SyntasticStatuslineFlag',
       \ },
       \ 'component_type': {
       \   'syntastic': 'error',
       \ },
       \ }
let g:syntastic_mode_map = { 'mode': 'passive' }

augroup reload_vimrc
  autocmd!
  autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END

function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction


"# vim-gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '→'
let g:gitgutter_sign_removed = '✗'



"# evervim
:helptags ~/.vim/bundle/evervim/doc/
source ~/.dotfiles/.vim/password.vim



"# vim-markdown
autocmd BufRead,BufNewFile *.{mkd,md} set filetype=markdown
autocmd! FileType markdown hi! def link markdownItalic Normal
autocmd FileType markdown set commentstring=<\!--\ %s\ -->

let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_style_pythonic = 1
