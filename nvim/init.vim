source $HOME/.dotfiles/nvim/plugins.vim


" enable filetype detection and ft specific plugin/indent
filetype plugin indent on

" enable syntax highlight and completion
setlocal conceallevel=0
syntax on
set synmaxcol=200

" encoding setting
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

" color scheme
set background=dark
set t_Co=256

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

" general
set number
set autoindent
set splitright
set clipboard=unnamed
set history=1000
set nofoldenable
set confirm
set backspace=indent,eol,start
set mouse=a
set report=0
set nowrap
set display=lastline
set scrolloff=5
set showmatch
set showcmd
set notitle
set laststatus=2
set matchtime=2
set nobackup
set nowb
set noswapfile
set shortmess+=c
set pumheight=10
set formatoptions=Mm

" highlight
set hls
set cursorline
set cursorcolumn
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn

" tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set shiftround

" search & replace
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split
set nohlsearch

" key maps
inoremap <silent> jj <ESC>

nmap <Leader>w :w!<cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

function! IsEndSemicolon()
    let c = getline(".")[col("$")-2]
    if c != ';'
        return 1
    else
        return 0
    endif
endfunction

inoremap <expr>;; IsEndSemicolon() ? "<C-O>$;<CR>" : "<C-O>$<CR>"

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END


" set filetypes
autocmd FileType c setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

let g:python_highlight_all = 1

" templates
" C++ template
autocmd BufNewFile *.cpp 0r $HOME/.dotfiles/.template/template.cc

" python template
autocmd BufNewFile *.py 0r $HOME/.dotfiles/.template/template.py

" HTML template
autocmd BufNewFile *.html 0r $HOME/.dotfiles/.template/template.html

" XMLSchema template
autocmd BufNewFile *.xsd 0r $HOME/.dotfiles/.template/template.xsd

" XML template
autocmd BufNewFile *.xml 0r $HOME/.dotfiles/.template/template.xml


" denite.vim
nnoremap [denite] <Nop>
nmap <C-d> [denite]

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

noremap [denite] :Denite file_rec -mode=insert

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:NERDTreeDirArrows = 1
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeWinPos = "left"

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('cc',     'darkcyan',  'none', 'darkcyan',  '#151515')
call NERDTreeHighlightFile('cpp',     'darkcyan',  'none', 'darkcyan',  '#151515')
call NERDTreeHighlightFile('hh',     'green',  'none', 'green',  '#151515')
call NERDTreeHighlightFile('hpp',     'green',  'none', 'green',  '#151515')
call NERDTreeHighlightFile('h',     'green',  'none', 'green',  '#151515')
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('sh',     'darkgreen',  'none', 'darkgreen',  '#151515')

" deoplete
let g:deoplete#enable_at_startup = 1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = 'E:'
let g:airline#extensions#ale#warning_symbol = 'W:'

" ale_lint
let g:ale_sign_column_always = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
let g:ale_linters = {
\   'python': ['flake8'],
\}

let g:ale_cpp_clang_options = "-std=c++17 -Wall -I$HOME/lib/libtorch/include/torch/csrc/api/include/ -I$HOME/lib/libtorch/include/"
let g:ale_cpp_gcc_options = "-std=c++17 -Wall -I$HOME/lib/libtorch/include/torch/csrc/api/include/ -I$HOME/lib/libtorch/include/"

nmap [ale] <Nop>
map <C-k> [ale]
nmap <silent> [ale]<C-P> <Plug>(ale_previous)
nmap <silent> [ale]<C-N> <Plug>(ale_next)

" impsort
autocmd BufWritePre *.py ImpSort!

" indent_guides
let g:indent_guides_enable_on_vim_startup = 1

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight=1
let g:cpp_concepts_highlight = 1

let c_no_curly_error=1
let g:ycm_show_diagnostics_ui=0

" vim-flake8
autocmd BufWritePost *.py call Flake8()

" jedi-vim
" set completeopt=menuone
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#show_call_signatures = 0
autocmd FileType python setlocal completeopt-=preview
