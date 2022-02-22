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

" " source {{{1

" " bootstrap {{{2

" source $VIMRC_PLUGIN_DIR/_bootstrap.vim

call plug#begin()
" (Linux/macOS): '~/.vim/plugged'

" Plug 'https://github.com/junegunn/vim-cfr'

Plug 'https://github.com/AndrewRadev/switch.vim'
Plug 'https://github.com/Shougo/context_filetype.vim'
Plug 'https://github.com/Shougo/vimproc.vim'
Plug 'https://github.com/cespare/vim-toml'
Plug 'https://github.com/christoomey/vim-sort-motion'
Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/digitaltoad/vim-pug'
Plug 'https://github.com/jamessan/vim-gnupg'
Plug 'https://github.com/kchmck/vim-coffee-script'
Plug 'https://github.com/leafOfTree/vim-svelte-plugin'
Plug 'https://github.com/leafOfTree/vim-vue-plugin'
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/michalbachowski/vim-wombat256mod'
Plug 'https://github.com/moll/vim-node'
Plug 'https://github.com/mustache/vim-mustache-handlebars'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/prabirshrestha/vim-lsp'
Plug 'https://github.com/preservim/nerdcommenter'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/slim-template/vim-slim'
Plug 'https://github.com/tmux-plugins/vim-tmux'
Plug 'https://github.com/tpope/vim-abolish'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-rbenv'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'https://github.com/tyru/caw.vim'
Plug 'https://github.com/vim-scripts/AdvancedSorters'
Plug 'https://github.com/vim-scripts/mru.vim'

if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" " }}}2

" }}}1

" if empty($VIM_QUICK) || $VIM_ABBREV

if $VIM_ABBREV
  if empty($VIM_QUICK)
    packadd vim-abbrev
  endif
endif

vnoremap <F2> d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

set modeline
set modelines=5

cnoremap w!! w !sudo tee > /dev/null %

set pdev=HP_LaserJet_Pro_M201dw

" set lazyredraw
" redraw!

set path+=**,/home/chris/.documents/**,/home/chris/.config/**

autocmd FileType denite call s:denite_my_settings()

function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

nnoremap <silent> <leader>d <esc>vip:call AC()<CR>

if &term =~ "linux"
	colorscheme ron
else
	colorscheme wombat256mod
endif
