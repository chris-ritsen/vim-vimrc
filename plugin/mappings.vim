
" cmap {{{1
" {{{2

cmap w!! w !sudo tee % >/dev/null

" }}}2
" }}}1

" cnoremap {{{1
" {{{2

cnoremap <C-G> <C-U><BS>

" }}}2
" }}}1

" imap {{{1
" {{{2

imap  <nop>
imap <C-@> <C-Space>
imap <C-Space> <C-x><C-o>
imap <C-x><C-o> <nop>

" }}}2
" }}}1

" inoremap {{{1
" {{{2

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
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent> <C-S-j> <cr>
inoremap <silent> <Left> <Esc>:bp<CR>gg
inoremap <silent> <Right> <Esc>:bn<CR>gg
inoremap <up> <nop>

" }}}2
" }}}1

" map {{{1
" {{{2

map <F1> <nop>
map Q <nop>

" }}}2
" }}}1

" nmap {{{1
" {{{2

nmap <space> \
nmap [z zM
nmap <MiddleMouse> <nop>
nmap <s-k> <nop>
nmap <s-k> <nop>
nmap ]z zR

" }}}2
" }}}1

" nnoremap {{{1
" {{{2

nnoremap <C-c> <nop>
nnoremap <F6> :!vlock<cr>
nnoremap <Q <nop>
nnoremap <down> <nop>
nnoremap <expr> <2-LeftMouse> foldclosed(line('.')) == -1 ? "\<2-LeftMouse>" : 'zo'
nnoremap <leader>c :NERDTreeFind<CR>
nnoremap <leader>d :call AddAbbrev()<cr>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>s viw"0pb
nnoremap <silent> <C-h> 1zh
nnoremap <silent> <C-l> 1zl
nnoremap <silent> <Leader>e :e<CR>
nnoremap <silent> <Left> <Esc>:bp<CR>
nnoremap <silent> <Right> <Esc>:bn<CR>
nnoremap <silent> <leader>l :r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A — 
nnoremap <silent><leader>h :noh<CR>
nnoremap <silent>x x:call Redefine_x_ForVirtualEdit()<CR>
nnoremap <up> <nop>
nnoremap J mzJ`z
nnoremap K <nop>
nnoremap Y y$

" }}}2
" }}}1

" noremap {{{1
" {{{2

noremap <2-LeftMouse> :execute 'normal gF'<cr>
noremap <3-LeftMouse> zA<cr>
noremap <RightMouse> 

" }}}2

" {{{2
"
noremap <up> <nop>
noremap <down> <nop>

" }}}2

" {{{2

noremap <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
noremap <leader>gf :e <cfile><cr>
noremap <leader>w <esc>:w!<cr>
noremap <silent> <F2> :NERDTreeToggle<CR>
noremap <silent> <F3> :TagbarToggle<CR>
noremap <silent> <F4> :GundoToggle<CR>
noremap <silent> <F5> :set wrap! <CR>
noremap <silent> <F7> :set list!<CR>
noremap <silent> <F8> :setlocal spell! spelllang=en_us <CR>
noremap <silent> <Left> <Esc>:bp<CR>
noremap <silent> <Right> <Esc>:bn<CR>
noremap <silent> <leader>m :make!<CR>
noremap <silent> <leader>y :wa! \| Git commit -am'updated everything blindly.' && git push<CR>
noremap [Down] gj
noremap [Up] gk
noremap j gj
noremap k gk

" }}}2
" }}}1

" vmap {{{1
" {{{2

vmap <s-k> <nop>

" }}}2
" }}}1

" vnoremap {{{1
" {{{2

vnoremap <Right> <Esc>:bn<CR>
vnoremap <down> <nop>
vnoremap <leader>s "+p
vnoremap <silent> # :call VisualSearch('b')<CR>
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> <Left> <Esc>:bp<CR>
vnoremap <silent> gv :call VisualSearch('gv')<CR>
vnoremap <up> <nop>

" }}}2
" }}}1

" TODO: {{{1
" TODO: set this up {{{2

" %!xmlformat --indent 2 --indent-char ' '  --preserve 'style foreignobject' --outencoding 'utf-8' -

" }}}2
" }}}1

" Dead Code {{{1

" if maparg('<C-L>', 'n') ==# ''
"   nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
" endif

" inoremap <leader>r viwg?
" inoremap <silent> <C-S-j> <cr><esc>:r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A — 
" inoremap <silent> <leader>l <cr><esc>:r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A —
" kmap <leader>s ysiw"
" kmap <silent> <F10> <CR>
" kmap <silent> <F11> <CR>
" kmap <silent> <F12> <CR>
" kmap <silent> <F4> <CR>
" kmap <silent> <F8> <CR>
" kmap <silent> <F9> <CR>
" knmap <leader>d :b#<bar>bd#<CR>
" knmap K :Man <cword><CR>
" knnoremap n nzz
" map <ScrollWheelDown> <C-E>
" map <ScrollWheelUp> <C-Y>
" map <silent> <F12> :!php -l %<CR>
" nmap <leader>y vip :write !ssh macbook say -r250&<cr><cr>
" nnoremap  :!vlock<cr>
" nnoremap <C-S-J> Go<esc>:r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A - 
" nnoremap <F8> :vertical wincmd f<CR> 
" nnoremap <leader><space> :noh<cr>
" nnoremap <silent> <Leader>e :vsplit<bar>wincmd l<bar>exe "norm! Ljz<c-v><cr>"<cr>:set scb<cr>:wincmd h<cr> :set scb<cr>
" nnoremap } }zz
" noremap <3-LeftMouse> <esc>vip :write !ssh macbook say -r275&<cr><cr>
" noremap <C-j> <C-W>j<C-W>_
" noremap <C-k> <C-W>k<C-W>_
" noremap <leader>b :CommandTBuffer<cr>
" noremap <leader>f :CommandTJump<cr>
" noremap <leader>m :MRU<CR>
" noremap <leader>t :CommandT<cr>
" noremap <leader>y :CommandTFlush<cr>
" vmap <leader>y :write !ssh macbook say -r275&<cr><cr>
"call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 0)
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"noremap <leader>b :<C-u>Unite -no-split -start-insert -buffer-name=buffer buffer<cr>
"noremap <leader>f :<C-u>Unite -no-split -start-insert -buffer-name=files file<cr>
"noremap <leader>t :<C-u>Unite -no-split -start-insert -buffer-name=files file_rec/async:!<cr>

" }}}1

