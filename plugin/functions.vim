
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

    return
  endif

  " TODO: Replace word under cursor with user's final correction
  if correct_word != possible_correct_word
    " Sample word was not the desired correction
    silent! exec 'u'
    silent! exec 'normal' 'ciw' . correct_word
  endif

  let a:abbrev_file = expand('$VIMRC_PLUGIN_DIR/abbrev.vim')
  let a:lines = [abbrev_entry]

  " TODO: Check for a faster way of doing this
  call writefile(uniq(sort(readfile(a:abbrev_file)+a:lines)), a:abbrev_file)
  execute 'iab ' incorrect_word . ' ' . correct_word

  call inputrestore()

  if has_spell == 'false'
    set nospell
  endif
endfunction

