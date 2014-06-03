
cmap w!! w !sudo tee % >/dev/null
cnoremap <C-G> <C-U><BS>
imap  <nop>
imap <C-@> <C-Space>
imap <C-Space> <C-x><C-o>
inoremap <F10> <nop>
inoremap <F11> <nop>
inoremap <F12> <nop>
inoremap <F1> <nop>
inoremap <F2> <nop>
inoremap <F3> <nop>
inoremap <F4> <nop>
inoremap <F5> <nop>
inoremap <F6> <esc>:!vlock<cr>
inoremap <F6> <nop>
inoremap <F7> <nop>
inoremap <F8> <nop>
inoremap <F9> <nop>
inoremap <MouseMiddle> "*p
inoremap <down> <nop>
inoremap <silent> <C-S-j> <cr>
inoremap <silent> <Left> <Esc>:bp<CR>
inoremap <silent> <Right> <Esc>:bn<CR>
inoremap <up> <nop>
map <F1> <nop>
map Q <nop>
nmap <space> \
nmap [z zM
nmap ]z zR
nnoremap <C-c> <nop>
nnoremap <F6> :!vlock<cr>
nnoremap <Q <nop>
nnoremap <down> <nop>
nnoremap <expr> <2-LeftMouse> foldclosed(line('.')) == -1 ? "\<2-LeftMouse>" : 'zo'
nnoremap <leader>c :NERDTreeFind<CR>
nnoremap <leader>d :call AddAbbrev()<cr>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>s viw"0pb
nnoremap <silent> <Left> <Esc>:bp<CR>
nnoremap <silent> <Right> <Esc>:bn<CR>
nnoremap <silent> <leader>l :r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A — 
nnoremap <silent><leader>h :noh<CR>
nnoremap <silent>x x:call Redefine_x_ForVirtualEdit()<CR>
nnoremap <up> <nop>
nnoremap J mzJ`z
nnoremap K <nop>
nnoremap Y y$
noremap <2-LeftMouse> :execute 'normal gf'<cr>
noremap <3-LeftMouse> zA<cr>
" noremap <C-j> <C-W>j<C-W>_
" noremap <C-k> <C-W>k<C-W>_
noremap <RightMouse> 
noremap <down> <nop>

" noremap <leader>t :CommandT<cr>
" noremap <leader>b :CommandTBuffer<cr>
" noremap <leader>f :CommandTJump<cr>


noremap <leader>b :<C-u>Unite -no-split -start-insert -buffer-name=buffer buffer<cr>
noremap <leader>f :<C-u>Unite -no-split -start-insert -buffer-name=files file<cr>

let g:unite_source_rec_max_cache_files = 0
call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 0)
call unite#filters#matcher_default#use(['matcher_fuzzy'])

noremap <leader>t :<C-u>Unite -no-split -start-insert -buffer-name=files file_rec/async:!<cr>

noremap <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
noremap <leader>gf :e <cfile><cr>
noremap <leader>m :MRU<CR>
noremap <leader>w <esc>:w!<cr>
noremap <silent> <F2> :NERDTreeToggle<CR>
noremap <silent> <F3> :TagbarToggle<CR>
noremap <silent> <F4> :GundoToggle<CR>
noremap <silent> <F5> :set wrap! <CR>
noremap <silent> <F7> :set list!<CR>
noremap <silent> <F8> :setlocal spell! spelllang=en_us <CR>
noremap <silent> <Left> <Esc>:bp<CR>
noremap <silent> <Right> <Esc>:bn<CR>
noremap <silent> <leader>y :Git commit -am'update' && git push<CR>
noremap <silent> <leader>yp :Git commit -am'update' && git push<CR>
noremap <up> <nop>
noremap [Down] gj
noremap [Up] gk
noremap j gj
noremap k gk
vnoremap <Right> <Esc>:bn<CR>
vnoremap <down> <nop>
vnoremap <leader>s "+p
vnoremap <silent> # :call VisualSearch('b')<CR>
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> <Left> <Esc>:bp<CR>
vnoremap <silent> gv :call VisualSearch('gv')<CR>
vnoremap <up> <nop>

nnoremap <silent> <C-h> 1zh
nnoremap <silent> <C-l> 1zl

" if maparg('<C-L>', 'n') ==# ''
"   nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
" endif

nnoremap <silent> <Leader>e :vsplit<bar>wincmd l<bar>exe "norm! Ljz<c-v><cr>"<cr>:set scb<cr>:wincmd h<cr> :set scb<cr>

" inoremap <leader>r viwg?
" inoremap <silent> <C-S-j> <cr><esc>:r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A — 
" inoremap <silent> <leader>l <cr><esc>:r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A —
" map <ScrollWheelDown> <C-E>
" map <ScrollWheelUp> <C-Y>
" nmap <leader>y vip :write !ssh macbook say -r250&<cr><cr>
" nnoremap  :!vlock<cr>
" nnoremap <C-S-J> Go<esc>:r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A - 
" nnoremap <leader><space> :noh<cr>
" noremap <3-LeftMouse> <esc>vip :write !ssh macbook say -r275&<cr><cr>
" noremap <leader>y :CommandTFlush<cr>
" vmap <leader>y :write !ssh macbook say -r275&<cr><cr>
":nnoremap <F8> :vertical wincmd f<CR> 
"Disable Ex mode
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

