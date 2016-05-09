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

" 検索結果の個数を表示

nnoremap <expr> / _(":%s/<Cursor>/&/gn")
function! s:move_cursor_pos_mapping(str, ...)
  let left = get(a:, 1, "<Left>")
  let lefts = join(map(split(matchstr(a:str, '.*<Cursor>\zs.*\ze'), '.\zs'), 'left'), "")
  return substitute(a:str, '<Cursor>', '', '') . lefts
endfunction

function! _(str)
  return s:move_cursor_pos_mapping(a:str, "\<Left>")
endfunction



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

" 全角スペース可視化
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

" 最後のカーソル位置を復元する
if has("sutocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \ exe "normal!" g'\"" |
  \ endif
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
" Shift + hで行頭に移動
noremap <S-h> ^
" Shift + jで段落末に移動
noremap <S-j> }
" Shift + kで段落はじめに移動
noremap <S-k> {
" Shift + lで行末に移動
noremap <S-l> $
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

" 簡単にvimrcを開く
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

" 簡単にvimrcをリロード
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

"# quickrun
if !exists("g:quickrun_config")
  let g:quickrun_config = {}
endif
let g:quickrun_config["watchdogs_checker/_"] = {
      \ "outputter/quickfix/open_cmd" : "",
      \ }

"# NERDTree
let g:NERDTreeShowBookmarks=1
if !argc()
  autocmd vimenter * :SrcExplToggle
  autocmd vimenter * NERDTree|normal gg3j
  autocmd vimenter * :TagbarToggle
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


"# vim-markdown
autocmd BufRead,BufNewFile *.{mkd,md} set filetype=markdown
autocmd! FileType markdown hi! def link markdownItalic Normal
autocmd FileType markdown set commentstring=<\!--\ %s\ -->

let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_style_pythonic = 1



"# SrcExpl
if ! empty(dein#get("SrcExpl"))
    let g:SrcExpl_RefreshTime = 1000
    let g:SrcExpl_isUpdateTags = 0
    let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase %'

    function! g:SrcExpl_UpdateAllTags()
      let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase -R .'
      call g:SrcExpl_UpdateTags()
      let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase %'
    endfunction

    let g:SrcExpl_winHeight = 14
    nn [srce] <Nop>
    nm <Leader>E [srce]
    nn <silent> [srce]<CR> :SrcExplToggle<CR>
    nn <silent> [srce]u :call g:SrcExpl_UpdateTags()<CR>
    nn <silent> [srce]a :call g:SrcExpl_UpdateAllTags()<CR>
    nn <silent> [srce]n :call g:SrcExpl_NextDef()<CR>
    nn <silent> [srce]p :call g:SrcExpl_PrevDef()<CR>
  endif



"# tagbar
if ! empty(dein#get("tagbar"))
  let g:tagbar_width = 20
  nn <silent> <leader>t :TagbarToggle<CR>
endif



"# lexima
call lexima#add_rule({'at': '\%#.*[-0-9a-zA-Z_,:]', 'char': '{', 'input': '{'})



"# Seiya.vim
augroup seiya
  au!
  autocmd VimEnter * :SeiyaEnable
augroup END
