
function! AddAbbrev()
  call inputsave()
  " TODO: Preserve initial spell setting
  set spell

  let incorrect_word = expand('<cword>')
  let s_prompt = 'iab ' . incorrect_word . ' '

  " TODO: Avoid changing the buffer until the end
  normal 1z=

  let possible_correct_word = expand('<cword>')
  let correct_word = input(s_prompt, possible_correct_word)

  if empty(correct_word)
    return
  endif

  let abbrev_entry = 'iab ' . incorrect_word . ' ' . correct_word
  " TODO: Use a env variable for the abbreviation file instead
  let a:abbrev_file = '/home/chris/.config/vim/bundle/vimrc/plugin/abbrev.vim'
  let a:lines = [abbrev_entry]

  " TODO: Check for a faster way of doing this
  call writefile(readfile(a:abbrev_file)+a:lines, a:abbrev_file)
  execute 'iab ' incorrect_word . ' ' . correct_word

  " TODO: Replace word under cursor with user's final correction
  call inputrestore()
endfunction

