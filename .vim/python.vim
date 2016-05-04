"-------------------------------------
" jedi-vim
"-------------------------------------

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



" pyflakes3優先
let s:pyflakes = executable('pyflakes3') ? 'pyflakes3' :
      \          executable('python3') ? 'python3' :
      \          executable('pyflakes') ? 'pyflakes' :
      \          'python'
let s:cmdopt = executable('pyflakes3') ? '' :
      \          executable('python3') ? '-m pyflakes' :
      \          executable('pyflakes') ? '' :
      \          '-m pyflakes'
let g:quickrun_config["watchdogs_checker/pyflakes3"] = {
      \ "command" : s:pyflakes,
      \ "cmdopt" : s:cmdopt,
      \ "exec"    : "%c %o %s:p",
      \ "errorformat" : '%f:%l:%m',
      \ }
unlet s:pyflakes
unlet s:cmdopt

let g:quickrun_config["python/watchdogs_checker"] = {
      \ "type" : "watchdogs_checker/pyflakes3",
      \ }

call watchdogs#setup(g:quickrun_config)
