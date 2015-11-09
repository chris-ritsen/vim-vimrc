
" AddAbbrev {{{

function! AddAbbrev()

  " TODO: I doubt the reliability of this function.

  " TODO: Handle <c-c> and restore spell setting, <cword>.

  " {{{

  call inputsave()

  " }}}

  " {{{

  let incorrect_word = expand('<cword>')

  " }}}

  " {{{

  silent! redir @a
  silent! set spell?
  silent! redir END

  " }}}

  " {{{

  if match(@a, 'no') == -1
    let has_spell = 'true'
  else
    let has_spell = 'false'
  endif

  " }}}

  " {{{

  set spell
  normal 1z=

  " }}}

  " Preserve initial spell setting {{{

  let s_prompt = 'iab ' . incorrect_word . ' '
  let possible_correct_word = expand('<cword>')
  let correct_word = input(s_prompt, possible_correct_word)
  let abbrev_entry = 'iab ' . incorrect_word . ' ' . correct_word

  " }}}

  " {{{

  if empty(correct_word)
    silent! exec 'u'

    if has_spell == 'false'
      set nospell
    endif

    return
  endif

  " }}}

  " {{{

  if correct_word == possible_correct_word
    " Some nonsense was selected, such as punctuation

    if has_spell == 'false'
      set nospell
    endif

    "return
  endif

  " }}}

  " {{{

  " TODO: Replace word under cursor with user's final correction
  if correct_word != possible_correct_word
    " Sample word was not the desired correction

    silent! exec 'u'
    silent! exec 'normal' 'ciw' . correct_word
  endif

  " }}}

  " {{{

  " let a:abbrev_file = '$VIMRC_PLUGIN_DIR/abbrev.vim'
  let a:abbrev_file = '/home/chris/.config/vim/bundle/vimrc/plugin/abbrev.vim'
  let a:lines = [abbrev_entry]

  " }}}

  " {{{

  " TODO: Check for a faster way of doing this

  call writefile(readfile(a:abbrev_file)+a:lines, a:abbrev_file)
  execute 'iab ' incorrect_word . ' ' . correct_word

  call inputrestore()

  if has_spell == 'false'
    set nospell
  endif

  " }}}

endfunction

" }}}

" TempSetBinaryForNoeol {{{

function! s:TempSetBinaryForNoeol()

" {{{

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

" }}}

endfunction 

" }}}

" TempRestoreBinaryForNoeol {{{

function! s:TempRestoreBinaryForNoeol()

" {{{

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

" }}}

endfunction

" }}}

" set {{{

function! Set(what)
  exe 'set ' . substitute(a:what, '\v.+', '\L&', 'g')
endfunction

" }}}

" sort by number {{{

function! Sort_By_Number()

" {{{

  :sort n /\%V[.]r/

" }}}

endfunction

" }}}

" Vidir Sanitize {{{1

function! Vidir_Sanitize(content)

  " set mark {{{2

  mark z

  " }}}2

  " {{{2

  " messes up folding

  :silent! %s/,/./g

  " }}}2

  " {{{2

  :silent! %s/[$]/S/g

  " }}}2

  " {{{2
  :silent! %s/\v[/_-]@<\=[a-z]/\U&/g
  " }}}2

  " {{{2
  :silent! %s/\v[ÅÄ]/A/g
  " }}}2

  " {{{2
  :silent! %s/\v[Ö]/O/g
  " }}}2

  " {{{2
  :silent! %s/\v[åä]/a/g
  " }}}2

  " {{{2
  :silent! %s/\v[ö]/o/g
  " }}}2

  " {{{2
  :silent! %s/\v_(Feat|The|It|Of|At)_/\L&/ig
  " }}}2

  " {{{2
  :silent! %s/\v_(Och|N[åa]n)_/\L&/g
  " }}}2

  " {{{2
  :silent! %s/\v_+\ze[.]|\zs[.]\ze_+//g
  " }}}2

  " {{{2
  :silent! %s/\v_-_/-/g
  " }}}2

  " {{{2

  :silent! %s/\v[;<>*|'&!#)([\]{}]//g

  " }}}2

  " Messed up folding

  :silent! %s/\v-{2,}/-/g
  :silent! %s/\v[_]{2,}/_/g

  " {{{2

  if (a:content == 'music') || (a:content == 'mvid')

    " {{{

    :silent! %s/\v^\s*[0-9]+\s+\zs\s+/_/g
    :silent! %s/\(\_^[ ]*\)\@<![ ]\+/_/g
    :silent! %s/\v[&]/feat/g
    :silent! %s/\v(_[el]p[_]?)/\U\1/ig
    :silent! %s/\v([_-]?cd[sm][_-]?|flac|[_-]demo|vinyl|[_-](web|pcb|osv))/\U\1/ig

    " }}}

  elseif (a:content == 'tv')

    " {{{

    :silent! %s/\v^\s*[0-9]+\s+\zs\s+/./g
    :silent! %s/\(\_^[ ]*\)\@<![ ]\+/./g
    :silent! %s/\v[.]-[.]/./g

    " }}}

  else

    " {{{

    :silent! %s/\v[&]/and/g

    " }}}

  endif

  " }}}2

  " go to mark and delete {{{2

  'z
  delmark z

  " }}}2

endfunction

" }}}1

" Vidir - sort-of-TitleCase helper {{{

function! Vidir_SmartUC()

" substitute {{{

  :s/\w\@<=\ze\u/_/g
  :s/\v_+/_/g
  ":s/\<\@<![A-Z]/_&/g

" }}}

endfunction

" }}}

" sub - TitleCase word {{{

function! TitleCaseCenter()

  let word = expand('<cword>')
  s/\w\+/\u&/g
  center
  echo "Word under cursor was " . word

endfunction

" }}}

" sub - trailing trash {{{

function! RemoveTrailingCrap()

  if search('\s\+$', 'n')
    :%s/\s\+$//
  endif

  if search( nr2char(182) . '$' )
    :execute ":%s/" . nr2char(182) . "//"
  endif

endfunction

" }}}

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

" preview markdown {{{

function! Markdown_Preview()

" {{{

  :silent exe '!markdown_preview ' . expand('%:p')

" }}}

endfu

" }}}

" ls(1) colors {{{

function! LS()

  " :source /home/scp1/dev/vim-lscolors/plugin/lscolors.vim

endfu

" }}}

" shorten cwd {{{

function! CurDir()

  let curdir = substitute(getcwd(), '/home/scp1/', '~/', '')
  return curdir
  za

endfunction

" }}}

" syn group for item under cursor {{{

" nmap <C-e> :call SynStack()<CR>

function! SynStack()

  " Guard {{{

  if !exists("*synstack")

    return

  endif

  " }}}

  " echo {{{

  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')

  " }}}

endfunction

" }}}

" folding - add markers {{{

function! AddFoldMarkers()

" {{{

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

" }}}

endfunction

" }}}

" sort - by line length {{{

function! SortLen()

" {{{

  mark z
  %s/\v^/\=len(getline('.')) . '↑'/
  sort n
  %s/\v^\d+↑//
  normal G
  'z
  delmark z

" }}}

endfu

" }}}

" viminfo - save cursor position {{{

autocmd BufReadPost * call SetCursorPosition()

function! SetCursorPosition()

" viminfo - save cursor position {{{

  if &filetype !~ 'svn\|commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  end

" }}}

endfunction

" }}}

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

" Dead {{{

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

" IncludeExpressionWhatever {{{

function! IncludeExpressionWhatever()

  " TODO: Loop until root is reached, or file is found.  Probably safe to
  " remove the leading slash first, as it would be reached eventually
  " regardless.

  " FIXME: The reliability of this function is in doubt.

  let retval = substitute(expand('%:p'), expand('%:h:t').'.*',  v:fname, 'g')

  " while empty(matchstr("/whatever/path/here", "/", 0)) == 0

    " Value starts with a slash—stop recursing.
    " return v:fname

    " endwhile

  if filereadable(retval)

    return retval

  else

    " echo input(retval)

    return v:fname

  endif

  " TODO: This needs to recurse up the directory until a match is fount or the
  " root is reached.

  " includeexpr=substitute('test', 'test',  v:fname, 'g')
  " return expand("<cfile>")

endfunction

" }}}

" function to print a hard copy with paps {{{

function! PrintHardCopy()
  execute '!paps --columns=4 --landscape --left-margin=54 --right-margin=0 --bottom-margin=9 --top-margin=18 --font="Monaco 3" < % > out.ps && ps2pdf out.ps out.pdf && lpr out.pdf && rm out.ps out.pdf'
  " execute '!paps --left-margin=18 --right-margin=18 --bottom-margin=0 --top-margin=0 --font="Monaco 8" < % > out.ps && ps2pdf out.ps out.pdf && lpr out.pdf && rm out.ps out.pdf'
  " execute '!paps --left-margin=18 --right-margin=18 --font="Monaco 8" < % > out.ps | ps2pdf out.ps out.pdf && zathura out.pdf'

endfunction

" }}}

