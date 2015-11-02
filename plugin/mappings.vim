
" cmap {{{

" {{{

cmap <c-a> <home>
cmap <c-b> <left>
cmap <c-d> <delete>
cmap <c-f> <right>
cmap <c-n> <up>
cmap <c-p> <up>
cmap w!! w !sudo tee % >/dev/null


" }}}

" }}}

" cnoremap {{{

" {{{

cnoremap <C-G> <C-U><BS>

" }}}

" }}}

" imap {{{

" {{{

imap  <nop>
imap <C-@> <C-Space>
imap <C-Space> <C-x><C-o>

" Disable onmifunc
imap <C-x><C-o> <nop>

" }}}

" }}}

" inoremap {{{

" {{{

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

" }}}

" }}}

" map {{{

" {{{

map <F1> <nop>
map Q <nop>

" }}}

" }}}

" nmap {{{

" {{{

nmap <space> \
nmap [z zM
nmap <s-k> <nop>
nmap <s-k> <nop>
nmap ]z zR

" }}}

" }}}

" nnoremap {{{

" {{{

" nnoremap <leader>s viw"0pb
" nnoremap <silent> <leader>l <esc> normal if &ft == 'text' | normal '<esc>GG :r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A —' | endif

nnoremap <C-c> <nop>
nnoremap <F6> :!vlock<cr>
nnoremap <Q <nop>
nnoremap <down> <nop>
nnoremap <leader>d :call AddAbbrev()<cr>

nnoremap <silent> <C-h> 1zh
nnoremap <silent> <C-l> 1zl

nnoremap <silent> <left> 7zh
nnoremap <silent> <right> 7zl

nnoremap <silent> <up> 7<c-y>
nnoremap <silent> <down> 7<c-e>

nnoremap <silent> <Leader>e :e<CR>
nnoremap <silent> <leader>N :NERDTreeToggle<CR>
nnoremap <silent> <leader>h :noh<CR>
nnoremap <silent> <leader>n :NERDTreeFind<CR>
nnoremap <silent> x x:call Redefine_x_ForVirtualEdit()<CR>

" nnoremap <up> <nop>

nnoremap J mzJ`z
nnoremap K <nop>
nnoremap Y y$

" Stay away from that side of the keyboard!

nnoremap <silent> <Delete> <nop>
nnoremap <silent> <End> <nop>
nnoremap <silent> <Home> <nop>

" nnoremap <silent> <Left> <Esc>:bp<CR>
" nnoremap <silent> <Left> <nop>

nnoremap <silent> <PageDown> <nop>
nnoremap <silent> <PageUp> <nop>

" nnoremap <silent> <Right> <Esc>:bn<CR>
" nnoremap <silent> <Right> <nop>


" }}}

" }}}

" noremap {{{

" {{{

" noremap <up> <nop>
" noremap <down> <nop>

" }}}

" {{{
"
" surprisingly few mappings here.

noremap <leader>gf :e <cfile><cr>

noremap <silent> <leader>w <esc>:execute ":silent w!"<cr>
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

" }}}

" }}}

" vmap {{{

" {{{

vmap <s-k> <nop>

" }}}

" }}}

" vnoremap {{{

" {{{

" vnoremap <leader>s "+p

vnoremap <Right> <Esc>:bn<CR>
vnoremap <down> <nop>
vnoremap <silent> # :call VisualSearch('b')<CR>
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> <Left> <Esc>:bp<CR>
vnoremap <silent> gv :call VisualSearch('gv')<CR>
vnoremap <up> <nop>

" }}}

" }}}

" TODO: {{{

" TODO: set this up {{{

" cmap <c-j> <esc>

" Why the hell did you enable this?
" imap <c-j> <esc>
" nmap <c-j> :

" %!xmlformat --indent 2 --indent-char ' '  --preserve 'style foreignobject' --outencoding 'utf-8' -

" }}}

" }}}

" Mouse {{{

" noremap <RightMouse> 

inoremap <MouseMiddle> "*p
nmap <MiddleMouse> <nop>
nnoremap <expr> <2-LeftMouse> foldclosed(line('.')) == -1 ? "\<2-LeftMouse>" : 'zo'
noremap <2-LeftMouse> :execute 'normal gF'<cr>
noremap <3-LeftMouse> zA<cr>
noremap <RightMouse> <nop>

" }}}

" Change color schemes {{{

nnoremap <silent> 1<leader> <nop>
nnoremap <silent> <leader>1 <esc>:colorscheme default<cr>:syntax off<cr>
nnoremap <silent> <leader>2 <esc>:colorscheme wombat256mod<cr>:syntax off<cr>
nnoremap <silent> <leader>3 <esc>:syntax off<cr>
nnoremap <silent> <leader>4 <esc>:syntax on<cr>

" }}}

" omnisharp {{{

nnoremap <leader>rn :OmniSharpRename<cr>
nnoremap <leader>ca :OmniSharpGetCodeActions<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
nnoremap <leader>tp :OmniSharpAddToProject<cr>
vnoremap <leader>ga :call OmniSharp#GetCodeActions('visual')<cr>

" }}}

" unite {{{

" nnoremap <leader>a :Unite -no-split history/yank<cr>
" nnoremap <leader>b :Unite -prompt= -no-split -multi-line buffer<cr>
" nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
" nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files -multi-line -start-insert file<cr>
" nnoremap <leader>j :<C-u>Unite -no-split -buffer-name=jump -multi-line -start-insert jump<cr>
" nnoremap <leader>p <nop>
" nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru -start-insert file_mru<cr>
" nnoremap <leader>s :Unite -no-split -quick-match -auto-preview buffer<cr>
" nnoremap <leader>s :Unite -no-split -quick-match buffer<cr>
" nnoremap <leader>t :<C-u>Unite -no-split -start-insert file_rec/async:!<CR>
" nnoremap <leader>t :Unite -no-split -start-insert file_rec/async<cr>
" nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>

nnoremap <leader>g :<C-u>Unite -no-split -buffer-name=buffers -start-insert buffer<cr>
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files -no-auto-highlight -no-resize -no-cursor-line -start-insert file_rec/async:.<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=files -no-auto-highlight -no-resize -no-cursor-line -start-insert neomru/file:.<cr>

" What?  The ! makes this only go to the original directory - usually the
" user's home directory.  It's a source argument— the target kirectories split
" by newlines.

" nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>

" }}}

" Dead Code {{{

" }}}

