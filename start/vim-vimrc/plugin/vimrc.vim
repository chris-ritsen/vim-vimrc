
if &term =~ "xterm" || &term =~ "screen"
	let g:CommandTCancelMap     = ['<C-x>', '<ESC>', '<C-c>']
	let g:CommandTSelectNextMap = ['<C-e>', '<C-n>', '<ESC>OB', '<Down>']
	let g:CommandTSelectPrevMap = ['<C-y>', '<C-p>', '<ESC>OA', '<Up>']
endif

function! VisualSearch(direction) range

	let l:saved_reg = @"
	execute "normal! vgvy"

	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")

	if a:direction == 'b'
		execute "normal ?" . l:pattern . "^M"
	elseif a:direction == 'gv'
		call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
	elseif a:direction == 'f'
		execute "normal /" . l:pattern . "^M"
	endif

	let @" = l:saved_reg
	let @/ = l:pattern

endfunction

" set shell=/bin/bash\ -O\ extglob

" redefine x for virtualEdit so that past end of line, it jumps left to end-of-line
function! Redefine_x_ForVirtualEdit()
  if &ve != "" && col('.') >= col('$')
    normal $
  endif
endfunction

let s:dir = has('win32') ? '~/Application Data/Vim' : match(system('uname'), "Darwin") > -1 ? '~/Library/Vim' : empty($XDG_DATA_HOME) ? '~/.local/share/vim' : '$XDG_DATA_HOME/vim'

if isdirectory(expand(s:dir))

  if &directory =~# '^\.,'
    let &directory = expand(s:dir) . '/swap//,' . &directory
  endif

  if &backupdir =~# '^\.,'
    let &backupdir = expand(s:dir) . '/backup//,' . &backupdir
  endif

  if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
    let &undodir = expand(s:dir) . '/undo//,' . &undodir
  endif

endif

if exists('+undofile')
  set undofile
endif

let i = 1

while i <= 9

  execute 'nnoremap <silent><Leader>' . i . ' :' . i . 'wincmd w<CR>'
  let i = i + 1

endwhile

let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

" :%!python -m json.tool

"au BufReadPre * setlocal foldmethod=indent
"au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"map <silent> <F12> :!php -l %<CR>
"nmap <leader>d :b#<bar>bd#<CR>
"nnoremap n nzz
"nnoremap } }zz
"set foldnestmax=3
"set formatoptions+=a
"set wrapmargin=2
"hi CursorColumn cterm=NONE ctermbg=black ctermfg=white guibg=black guifg=white
"hi CursorLine   cterm=NONE ctermbg=black ctermfg=white guibg=black guifg=white
"map <leader>s ysiw"
"map <silent> <F10> <CR>
"map <silent> <F11> <CR>
"map <silent> <F12> <CR>
"map <silent> <F4> <CR>
"map <silent> <F8> <CR>
"map <silent> <F9> <CR>
"nmap K :Man <cword><CR>
"set cursorcolumn

"hi CursorColumn cterm=NONE ctermbg=black ctermfg=white guibg=black guifg=white
"hi CursorLine   cterm=NONE ctermbg=black ctermfg=white guibg=black guifg=white

function! TextEnableCodeSnip(filetype, start, end, textSnipHl) abort

  let ft = toupper(a:filetype)
  let group = 'textGroup' . ft

  if exists('b:current_syntax')
    let s:current_syntax = b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif

  execute 'syntax include @' . group . ' syntax/' . a:filetype . '.vim'

  try
    execute 'syntax include @' . group . ' after/syntax/' . a:filetype . '.vim'
  catch
  endtry

  if exists('s:current_syntax')
    let b:current_syntax = s:current_syntax
  else
    unlet b:current_syntax
  endif

  execute 'syntax region textSnip' . ft . '
  \ matchgroup = '.a:textSnipHl.'
  \ start = "'.a:start.'" end = "'.a:end.'"
  \ contains = @'.group

endfunction

