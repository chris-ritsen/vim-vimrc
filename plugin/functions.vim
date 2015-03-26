
function! AddAbbrev()
  call inputsave()
  let incorrect_word = expand('<cword>')

  " Preserve initial spell setting
  silent! redir @a
  silent! set spell?
  silent! redir END

  if match(@a, 'no') == -1
    let has_spell = 'true'
  else
    let has_spell = 'false'
  endif

  set spell
  normal 1z=

  let s_prompt = 'iab ' . incorrect_word . ' '
  let possible_correct_word = expand('<cword>')
  let correct_word = input(s_prompt, possible_correct_word)
  let abbrev_entry = 'iab ' . incorrect_word . ' ' . correct_word

  if empty(correct_word)
    silent! exec 'u'

    if has_spell == 'false'
      set nospell
    endif

    return
  endif

  if correct_word == possible_correct_word
    " Some nonsense was selected, such as punctuation
    if has_spell == 'false'
      set nospell
    endif

    "return
  endif

  " TODO: Replace word under cursor with user's final correction
  if correct_word != possible_correct_word
    " Sample word was not the desired correction
    silent! exec 'u'
    silent! exec 'normal' 'ciw' . correct_word
  endif

  " TODO: Use a env variable for the abbreviation file instead
  let a:abbrev_file = '/home/chris/.config/vim/bundle/vimrc/plugin/abbrev.vim'
  let a:lines = [abbrev_entry]

  " TODO: Check for a faster way of doing this
  call writefile(readfile(a:abbrev_file)+a:lines, a:abbrev_file)
  execute 'iab ' incorrect_word . ' ' . correct_word

  call inputrestore()

  if has_spell == 'false'
    set nospell
  endif
endfunction

function! s:unite_settings()
  let b:SuperTabDisabled = 1
  " Enable navigation with control-j and control-k in insert mode
  " imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  " imap <buffer> <C-j>   <Plug>(unite_do_default_action)
  " imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  " nnoremap <silent><buffer> <C-j> <Plug>(unite_do_default_action) 
endfunction

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

endfunction
 
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

"    File: $HOME/etc/functions.vim
"  Author: Magnus Woldrich <m@japh.se>
" Updated: 2012-01-23 09:11:36

". do stuff with lines matching pattern
" :g/\v^#\w+/let @" .= getline('.')."\n"|d _

fu! Set(what)
  exe 'set ' . substitute(a:what, '\v.+', '\L&', 'g')
endfu

fu! Sort_By_Number()
  :sort n /\%V[.]r/
endfu
" Vidir - sanitize filenames                                                 {{{
fu! Vidir_Sanitize(content)
  mark z

  "silent! %s/\(\_^[ ]*\)\@<![ ]\+/_/g
  "%s/\(\_^\s*\|\_^\s\+\d\+\)\@<!\s/_/g

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

  if (a:content == 'music') || (a:content == 'mvid')
    "silent! %s/\v./\L&/g
    silent! %s/\v^\s*[0-9]+\s+\zs\s+/_/g
    silent! %s/\(\_^[ ]*\)\@<![ ]\+/_/g
    :silent! %s/\v[&]/feat/g
    :silent! %s/\v(_[el]p[_]?)/\U\1/ig
    :silent! %s/\v([_-]?cd[sm][_-]?|flac|[_-]demo|vinyl|[_-](web|pcb|osv))/\U\1/ig
  elseif (a:content == 'tv')
    :silent! %s/\v^\s*[0-9]+\s+\zs\s+/./g
    silent! %s/\(\_^[ ]*\)\@<![ ]\+/./g
    silent! %s/\v[.]-[.]/./g
  else
    :silent! %s/\v[&]/and/g
  endif

  'z
  delmark z
endfu
"}}}

" Vidir - sort-of-TitleCase helper                                           {{{
fu! Vidir_SmartUC()
  :s/\w\@<=\ze\u/_/g
  :s/\v_+/_/g
  ":s/\<\@<![A-Z]/_&/g
endfu
"}}}

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

" sub - TitleCase word                                                       {{{
fu! TitleCaseCenter()
  let word = expand('<cword>')
  s/\w\+/\u&/g
  center
  echo "Word under cursor was " . word
endfu
"}}}
" sub - trailing trash                                                       {{{
fu! RemoveTrailingCrap()
  if search('\s\+$', 'n')
    :%s/\s\+$//
  endif
  if search( nr2char(182) . '$' )
    :execute ":%s/" . nr2char(182) . "//"
  endif
endfu
"}}}
" toggle number/relativenumber                                               {{{
fu! ToggleRelativeAbsoluteNumber()
  exe 'set ' . (&number ? 'relativenumber' : 'number')
endfu
"}}}
" toggle spell                                                               {{{
fu! ToggleSpell()
  exe 'set ' . (&spell ? 'nospell' : 'spell')
endfu
"}}}

" toggle paste                                                               {{{
fun! TogglePaste()
  echohl Number
  exe 'set ' . (&paste ? 'nopaste' : 'paste')
  echo &paste
endfun
"}}}

" preview markdown                                                           {{{
fu! Markdown_Preview()
  :silent exe '!markdown_preview ' . expand('%:p')
endfu
"}}}

" ls(1) colors                                                               {{{
fu! LS()
  " :source /home/scp1/dev/vim-lscolors/plugin/lscolors.vim
endfu
"}}}

" shorten cwd                                                                {{{
fu! CurDir()
  let curdir = substitute(getcwd(), '/home/scp1/', '~/', '')
  return curdir
endfu
"}}}

" syn group for item under cursor                                            {{{
" nmap <C-e> :call SynStack()<CR>
fu! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfu
"}}}

" folding - add markers                                                      {{{
fu! AddFoldMarkers()
  setl virtualedit=all

  let comment_char = '#'
  if(&ft == 'vim')
    let comment_char = '"'
  elseif(&ft == 'xdefaults')
    let comment_char = '!'
  elseif(&ft == 'lisp')
    let comment_char = ';;'
  endif

  let fold_marker_start = '{{{'
  let fold_marker_end   = '}}}'

  setl formatoptions=
  normal ^77li{{{
  " to close the unexpected fold :) }}}
  normal o
  normal o
  normal o

  put = comment_char . fold_marker_end
  normal kkk
endfu
"}}}

" sort - by line length                                                      {{{
fu! SortLen()
  mark z
  %s/\v^/\=len(getline('.')) . '↑'/
  sort n
  %s/\v^\d+↑//
  normal G
  'z
  delmark z
endfu
"}}}

" viminfo - save cursor position                                             {{{
autocmd BufReadPost * call SetCursorPosition()
fu! SetCursorPosition()
  if &filetype !~ 'svn\|commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  end
endfu
"}}}

" % filesize                                                                 {{{
fu! FileSize()
  let bytes = getfsize(expand("%:p"))
  if bytes <= 0
    return "0"
  endif
  if bytes < 1024
    return bytes
  else
    return (bytes / 1024) . "K"
  endif
endfu
"}}}


augroup automatic_noeol
  autocmd!
  autocmd BufWritePre  * call <SID>TempSetBinaryForNoeol()
  autocmd BufWritePost * call <SID>TempRestoreBinaryForNoeol()
augroup END

autocmd FileType unite call s:unite_settings()

