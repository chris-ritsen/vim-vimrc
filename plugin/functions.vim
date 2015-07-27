
" AddAbbrev {{{1

function! AddAbbrev()

  " TODO: I doubt the reliability of this function.

  " TODO: Handle <c-c> and restore spell setting, <cword>.

  " {{{2

  call inputsave()

  " }}}2

  " {{{2

  let incorrect_word = expand('<cword>')

  " }}}2

  " {{{2

  silent! redir @a
  silent! set spell?
  silent! redir END

  " }}}2

  " {{{2

  if match(@a, 'no') == -1
    let has_spell = 'true'
  else
    let has_spell = 'false'
  endif

  " }}}2

  " {{{2

  set spell
  normal 1z=

  " }}}2

  " Preserve initial spell setting {{{2

  let s_prompt = 'iab ' . incorrect_word . ' '
  let possible_correct_word = expand('<cword>')
  let correct_word = input(s_prompt, possible_correct_word)
  let abbrev_entry = 'iab ' . incorrect_word . ' ' . correct_word

  " }}}2

  " {{{2

  if empty(correct_word)
    silent! exec 'u'

    if has_spell == 'false'
      set nospell
    endif

    return
  endif

  " }}}2

  " {{{2

  if correct_word == possible_correct_word
    " Some nonsense was selected, such as punctuation

    if has_spell == 'false'
      set nospell
    endif

    "return
  endif

  " }}}2

  " {{{2

  " TODO: Replace word under cursor with user's final correction
  if correct_word != possible_correct_word
    " Sample word was not the desired correction

    silent! exec 'u'
    silent! exec 'normal' 'ciw' . correct_word
  endif

  " }}}2

  " {{{2

  " let a:abbrev_file = '$VIMRC_PLUGIN_DIR/abbrev.vim'
  let a:abbrev_file = '/home/chris/.config/vim/bundle/vimrc/plugin/abbrev.vim'
  let a:lines = [abbrev_entry]

  " }}}2

  " {{{2

  " TODO: Check for a faster way of doing this

  call writefile(readfile(a:abbrev_file)+a:lines, a:abbrev_file)
  execute 'iab ' incorrect_word . ' ' . correct_word

  call inputrestore()

  if has_spell == 'false'
    set nospell
  endif

  " }}}2

endfunction

" }}}1

" {{{1
function! s:unite_settings()

  " {{{2

  let b:SuperTabDisabled = 1

  " {{{3

  " Enable navigation with control-j and control-k in insert mode
  " imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  " imap <buffer> <C-j>   <Plug>(unite_do_default_action)
  " imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  " nnoremap <silent><buffer> <C-j> <Plug>(unite_do_default_action)

  " }}}3

  " }}}2

endfunction

" }}}1

" {{{1

function! s:TempSetBinaryForNoeol()

  let s:save_binary = &binary

  if ! &eol && ! &binary
    let s:save_view = winsaveview()
    setlocal binary

    if &ff == "dos" || &ff == "mac"
      if line('$') > 1
        undojoin | exec "silent 1,$-1normal! A\<C-V>\<C-M>"
      endif
    endif

    if &ff == "mac"
      undojoin | %join!
    endif
  endif

endfunction " }}}1

" {{{1

function! s:TempRestoreBinaryForNoeol()

  if ! &eol && ! s:save_binary
    if &ff == "dos"
      if line('$') > 1
        silent! undojoin | silent 1,$-1s/\r$//e
      endif
    elseif &ff == "mac"
      silent! undojoin | silent %s/\r/\r/ge
    endif

    setlocal nobinary
    call winrestview(s:save_view)

  endif

endfunction

" }}}1

" {{{1

function! Set(what)
  exe 'set ' . substitute(a:what, '\v.+', '\L&', 'g')
endfunction

" }}}1

" {{{1

function! Sort_By_Number()

" {{{2

  :sort n /\%V[.]r/

" }}}2

endfunction

" }}}1

" Vidir Sanitize {{{1

function! Vidir_Sanitize(content)

  " {{{2

  mark z

  "silent! %s/\(\_^[ ]*\)\@<![ ]\+/_/g
  "%s/\(\_^\s*\|\_^\s\+\d\+\)\@<!\s/_/g

  " }}}2

  " Rules {{{2

  silent! %s/\v[åä]/a/g
  silent! %s/\v[ö]/o/g
  silent! %s/\v[ÅÄ]/A/g
  silent! %s/\v[Ö]/O/g
  silent! %s/,/./g
  silent! %s/\v[;<>*|'&!#)([\]{}]//g
  silent! %s/\v_+\ze[.]|\zs[.]\ze_+//g
  silent! %s/[$]/S/g
  silent! %s/\v-{2,}/-/g
  silent! %s/\v_-_/-/g
  silent! %s/\v[_]{2,}/_/g
  silent! %s/\v[/_-]@<\=[a-z]/\U&/g
  silent! %s/\v_(Feat|The|It|Of|At)_/\L&/ig
  silent! %s/\v_(Och|N[åa]n)_/\L&/g

  " }}}2

  " {{{2

  if (a:content == 'music') || (a:content == 'mvid')

    " {{{3

    :silent! %s/\v^\s*[0-9]+\s+\zs\s+/_/g
    :silent! %s/\(\_^[ ]*\)\@<![ ]\+/_/g
    :silent! %s/\v[&]/feat/g
    :silent! %s/\v(_[el]p[_]?)/\U\1/ig
    :silent! %s/\v([_-]?cd[sm][_-]?|flac|[_-]demo|vinyl|[_-](web|pcb|osv))/\U\1/ig

    " }}}3

  elseif (a:content == 'tv')

    " {{{3

    :silent! %s/\v^\s*[0-9]+\s+\zs\s+/./g
    :silent! %s/\(\_^[ ]*\)\@<![ ]\+/./g
    :silent! %s/\v[.]-[.]/./g

    " }}}3

  else

    " {{{3

    :silent! %s/\v[&]/and/g

    " }}}3

  endif

  " }}}2

  " {{{2

  'z
  delmark z

  " }}}2

endfunction

" }}}1

" Vidir - sort-of-TitleCase helper {{{1

function! Vidir_SmartUC()

" substitute {{{2

  :s/\w\@<=\ze\u/_/g
  :s/\v_+/_/g
  ":s/\<\@<![A-Z]/_&/g

" }}}2

endfunction

" }}}1

" sub - TitleCase word {{{1

function! TitleCaseCenter()

  let word = expand('<cword>')
  s/\w\+/\u&/g
  center
  echo "Word under cursor was " . word

endfunction

" }}}1

" sub - trailing trash {{{1

function! RemoveTrailingCrap()

  if search('\s\+$', 'n')
    :%s/\s\+$//
  endif

  if search( nr2char(182) . '$' )
    :execute ":%s/" . nr2char(182) . "//"
  endif

endfunction

" }}}1

" toggle number/relativenumber {{{

function! ToggleRelativeAbsoluteNumber()
  exe 'set ' . (&number ? 'relativenumber' : 'number')
endfunction

" }}}

" toggle spell {{{

function! ToggleSpell()

  exe 'set ' . (&spell ? 'nospell' : 'spell')

endfunction

" }}}

" toggle paste {{{

fun! TogglePaste()

  echohl Number
  exe 'set ' . (&paste ? 'nopaste' : 'paste')
  echo &paste

endfun

" }}}

" preview markdown {{{1

function! Markdown_Preview()

" {{{2

  :silent exe '!markdown_preview ' . expand('%:p')

" }}}2

endfu

" }}}1

" ls(1) colors {{{

function! LS()

  " :source /home/scp1/dev/vim-lscolors/plugin/lscolors.vim

endfu

" }}}

" shorten cwd {{{1

function! CurDir()

  let curdir = substitute(getcwd(), '/home/scp1/', '~/', '')
  return curdir
  za

endfunction

" }}}1

" syn group for item under cursor {{{1

" nmap <C-e> :call SynStack()<CR>

function! SynStack()

  " Guard {{{2

  if !exists("*synstack")

    return

  endif

  " }}}

  " echo {{{2

  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')

  " }}}

endfunction

" }}}1

" folding - add markers {{{1

function! AddFoldMarkers()

" {{{2

  let comment_char = '#'
  let fold_marker_end   = '}}}'
  let fold_marker_start = '{{{'

  if (&ft == 'vim')

    let comment_char = '"'

  elseif (&ft == 'xdefaults')

    let comment_char = '!'

  elseif (&ft == 'lisp')

    let comment_char = ';;'

  endif

  setlocal formatoptions=
  setlocal virtualedit=all

  normal ^77li{{{

  " to close the unexpected fold :) }}}

  normal o
  normal o
  normal o

  put = comment_char . fold_marker_end
  normal kkk

" }}}2

endfunction

" }}}1

" sort - by line length {{{1

function! SortLen()

" {{{2

  mark z
  %s/\v^/\=len(getline('.')) . '↑'/
  sort n
  %s/\v^\d+↑//
  normal G
  'z
  delmark z

" }}}2

endfu

" }}}1

" viminfo - save cursor position {{{1

autocmd BufReadPost * call SetCursorPosition()

function! SetCursorPosition()

" viminfo - save cursor position {{{2

  if &filetype !~ 'svn\|commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  end

" }}}2

endfunction

" }}}1

" % filesize {{{
function! FileSize()

  let bytes = getfsize(expand("%:p"))

  if bytes <= 0
    return "0"
  endif

  if bytes < 1024
    return bytes
  else
    return (bytes / 1024) . "K"
  endif

endfunction

"}}}

" Dead {{{1

" augroup automatic_noeol
"   autocmd!
"   autocmd BufWritePre  * call <SID>TempSetBinaryForNoeol()
"   autocmd BufWritePost * call <SID>TempRestoreBinaryForNoeol()
" augroup END

"" highlights - hl match under cursor differently from Search                 {{{
"fu! HL_Search_Cword()
"  let s:old_cpo = &cpo
"  set cpo&vim
"
"'
"    let s:search_cword_cursor_modified='red'
"  endif
"
"  if exists('b:search_cword_item')
"    try
"      call matchdelete(b:search_cword_item)
"    catch /^Vim\%((\a\+\)\=:E/ " ignore E802,E803
"    endtry
"  endif
"
"  " :silent !printf '\e]12;\#242424\a'
"  hi Search       ctermfg=196 cterm=bold  ctermbg=232
"  hi search_cword ctermfg=232 ctermbg=196 cterm=underline
"
"  let b:search_cword_item = matchadd('search_cword', (&ic ? '\c' : '') . '\%#' . @/, 1)
"
"  let &cpo = s:old_cpo
"  "let &t_EI = '\  if ! exists('s:search_cword_cursor_modified')
"    silent !printf ghlights - hl every even/odd line                                        {{{
"fu! OddEvenHL()
"  syn match oddEven /^.*$\n/ nextgroup=oddOdd
"  syn match oddOdd  /^.*$\n/ nextgroup=oddEven
"
"  hi oddEven ctermbg=233
"  hi oddOdd  ctermbg=234
"endfu
"
""}}}

"" cabs - less stupidity                                                      {{{
"fu! Single_quote(str)
"  return "'" . substitute(copy(a:str), "'", "''", 'g') . "'"
"endfu

""fu! Cabbrev(key, value)
""  exe printf('cabbrev <expr> %s (getcmdtype() == ":" && getcmdpos() <= %d) ? %s : %s',
""    \ a:key, 1+len(a:key), Single_quote(a:value), Single_quote(a:key))
""endfu
""}}}
""}}}

" }}}1

