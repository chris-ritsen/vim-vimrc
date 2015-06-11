
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
" imap <C-x><C-o> <nop>

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
nmap <s-k> <nop>
nmap <s-k> <nop>
nmap ]z zR

" }}}2

" }}}1

" nnoremap {{{1

" {{{2

" nnoremap <leader>s viw"0pb

nnoremap <C-c> <nop>
nnoremap <F6> :!vlock<cr>
nnoremap <Q <nop>
nnoremap <down> <nop>
nnoremap <silent> <leader>N :NERDTreeToggle<CR>
nnoremap <leader>d :call AddAbbrev()<cr>
nnoremap <silent> <leader>n :NERDTreeFind<CR>
nnoremap <silent> <C-h> 1zh
nnoremap <silent> <C-l> 1zl
nnoremap <silent> <Leader>e :e<CR>
nnoremap <silent><leader>h :noh<CR>
nnoremap <silent>x x:call Redefine_x_ForVirtualEdit()<CR>
nnoremap <up> <nop>
nnoremap J mzJ`z
nnoremap K <nop>
nnoremap Y y$

" Stay away from that side of the keyboard!

nnoremap <silent> <Delete> <nop>
nnoremap <silent> <End> <nop>
nnoremap <silent> <Home> <nop>
nnoremap <silent> <Left> <Esc>:bp<CR>
nnoremap <silent> <Left> <nop>
nnoremap <silent> <PageDown> <nop>
nnoremap <silent> <PageUp> <nop>
nnoremap <silent> <Right> <Esc>:bn<CR>
nnoremap <silent> <Right> <nop>


" }}}2

" }}}1

" noremap {{{1

" {{{2

noremap <up> <nop>
noremap <down> <nop>

" }}}2

" {{{2
"
" surprisingly few mappings here.

noremap <leader>gf :e <cfile><cr>
noremap <leader>w <esc>:w!<cr>
noremap <silent> <F2> :NERDTreeToggle<CR>
noremap <silent> <F3> :TagbarToggle<CR>
noremap <silent> <F4> :GundoToggle<CR>
noremap <silent> <F5> :set wrap! <CR>
noremap <silent> <F7> :set list!<CR>
noremap <silent> <F8> :setlocal spell! spelllang=en_us <CR>

noremap <silent> <leader>m :make!<CR>

noremap <silent> <leader>y <esc>:wa! \| Git commit -am'updated everything blindly.' && git push<CR>

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

" vnoremap <leader>s "+p

vnoremap <Right> <Esc>:bn<CR>
vnoremap <down> <nop>
vnoremap <silent> # :call VisualSearch('b')<CR>
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> <Left> <Esc>:bp<CR>
vnoremap <silent> gv :call VisualSearch('gv')<CR>
vnoremap <up> <nop>

" }}}2

" }}}1

" TODO: {{{1

" TODO: set this up {{{2

" cmap <c-j> <esc>

imap <c-j> <esc>
nmap <c-j> :

" %!xmlformat --indent 2 --indent-char ' '  --preserve 'style foreignobject' --outencoding 'utf-8' -

" }}}2

" }}}1

" Mouse {{{1

" noremap <RightMouse> 

inoremap <MouseMiddle> "*p
nmap <MiddleMouse> <nop>
nnoremap <expr> <2-LeftMouse> foldclosed(line('.')) == -1 ? "\<2-LeftMouse>" : 'zo'
noremap <2-LeftMouse> :execute 'normal gF'<cr>
noremap <3-LeftMouse> zA<cr>
noremap <RightMouse> <nop>

" }}}1

" Dead Code {{{1

" }}}1

