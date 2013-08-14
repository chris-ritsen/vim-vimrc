inoremap <down> <nop>
inoremap <up> <nop>
inoremap <silent> <Left> <Esc>:bp<CR>
inoremap <silent> <Right> <Esc>:bn<CR>
" inoremap <leader>r viwg?
nnoremap <silent><leader>h :noh<CR>
noremap <silent> <F2> :NERDTreeToggle<CR>

if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

inoremap <F10> <nop>
inoremap <F11> <nop>
inoremap <F12> <nop>
inoremap <F1> <nop>
inoremap <F2> <nop>
inoremap <F3> <nop>
inoremap <F4> <nop>
inoremap <F5> <nop>
inoremap <F6> <nop>
inoremap <F7> <nop>
inoremap <F8> <nop>
inoremap <F9> <nop>

" nnoremap  :!vlock<cr>
nnoremap <silent>x x:call Redefine_x_ForVirtualEdit()<CR>
noremap <C-j> <C-W>j<C-W>_
noremap <C-k> <C-W>k<C-W>_
noremap <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
noremap <leader>gf :e <cfile><cr>
noremap <leader>m :MRU<CR>
noremap <leader>w <esc>:w!<cr>
noremap <silent> <F3> :TagbarToggle<CR>
noremap <silent> <F4> :GundoToggle<CR>
noremap <silent> <F5> :set wrap! <CR>
noremap <silent> <F7> :set list!<CR>
noremap <silent> <F8> :setlocal spell! spelllang=en_us <CR>
noremap [Down] gj
noremap [Up] gk
noremap j gj
noremap k gk

nnoremap <Q <nop>
nnoremap <down> <nop>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>c :NERDTreeFind<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>s viw"0pb
nnoremap <silent> <Left> <Esc>:bp<CR>
nnoremap <silent> <Right> <Esc>:bn<CR>
nnoremap <up> <nop>
nnoremap J mzJ`z
nnoremap K <nop>
nnoremap Y y$
noremap <down> <nop>
noremap <leader>b :CommandTBuffer<cr>
noremap <leader>f :CommandTJump<cr>
noremap <leader>t :CommandT<cr>
" noremap <leader>y :CommandTFlush<cr>
noremap <silent> <Left> <Esc>:bp<CR>
noremap <silent> <Right> <Esc>:bn<CR>
noremap <up> <nop>
vnoremap <Right> <Esc>:bn<CR>
vnoremap <down> <nop>
vnoremap <leader>s "+p
vnoremap <silent> # :call VisualSearch('b')<CR>
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> <Left> <Esc>:bp<CR>
vnoremap <silent> gv :call VisualSearch('gv')<CR>
vnoremap <up> <nop>

"map <leader>s ysiw"
"map <silent> <F10> <CR>
"map <silent> <F11> <CR>
"map <silent> <F12> :!php -l %<CR>
"map <silent> <F12> <CR>
"map <silent> <F4> <CR>
"map <silent> <F8> <CR>
"map <silent> <F9> <CR>
"nmap <leader>d :b#<bar>bd#<CR>
"nmap K :Man <cword><CR>
"nnoremap n nzz
"nnoremap } }zz

" map <ScrollWheelUp> <C-Y>
" map <ScrollWheelDown> <C-E>

inoremap <silent> <C-S-j> <cr>
" inoremap <silent> <C-S-j> <cr><esc>:r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A - 
" nnoremap <C-S-J> Go<esc>:r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A - 
" inoremap <silent> <leader>l <cr><esc>:r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A - 
nnoremap <silent> <leader>l :r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A - 

