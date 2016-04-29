"-------------------------------------
" jedi-vim
"-------------------------------------

let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
  let g:jedi#auto_vim_configuration = 0
  let g:jedi#popup_select_first = 0
  let g:jedi#rename_command = '<Leader>R'
  let g:jedi#goto_command = '<Leader>G'
endfunction

autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled=0
let g:jedi#auto_vim_configuration=0

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns={}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

if version < 600
    syntax clear
elseif exists('b:current_after_syntax')
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match pythonOperator "\(+\|=\|-\|\^\|\*\)"
syn match pythonDelimiter "\(,\|\.\|:\)"
syn keyword pythonSpecialWord self

hi link pythonSpecialWord    Special
hi link pythonDelimiter      Special

let b:current_after_syntax = 'python'

let &cpo = s:cpo_save
unlet s:cpo_save

" docstringは表示しない
autocmd FileType python setlocal completeopt-=preview
