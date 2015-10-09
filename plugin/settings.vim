
" Settings {{{1

" Guard {{{2

if &tabpagemax < 50
  set tabpagemax=50
endif

if has('mouse_urxvt') && $TERM == 'rxvt-unicode-256color' && $TMUX == ''
  " TODO: Interferes with tmux
  set ttymouse=urxvt
else
  set ttymouse=xterm2
endif

if &diff
  set diffopt+=iwhite
endif

"}}}2

" General Settings {{{2

" set completeopt=menuone,menu,longest,preview

set autoindent
set autoread
set backspace=eol,start,indent
set cmdheight=1
set comments+=fb:•
set commentstring=#\ %s
set completeopt=
set cpoptions=aABceFsJ "+=J
set dictionary+=/usr/share/dict/words
set dir=~/.vim/swap//,/tmp//,.
set encoding=utf-8
set expandtab
set fileformats+=mac
set fillchars=
set foldlevel=20
set foldlevelstart=20
set foldmethod=marker
set foldminlines=1
set formatoptions+=nj
set guiheadroom=0
set hidden
set history=10000
set ignorecase
set incsearch
set iskeyword-=_-
set laststatus=0
set linebreak
set listchars=eol:$,tab:>-,trail:~ ",extends:>,precedes:<
set magic
set mat=2
set mouse=a
set mousehide
set mousemodel=extend
set nocursorline
set noerrorbells
set nohlsearch
set nolazyredraw
set nomodeline
set nonumber
set noruler
set noshowcmd
set noshowmode
set novisualbell
set nowrap
set nrformats=octal,hex,alpha " increment strings
set path=.,/usr/include,/usr/local/lib/php/,/usr/share/povray/include,/usr/share/doc/rfc/txt
set scrollopt=jump,hor,ver
set sessionoptions-=localoptions
set sessionoptions-=options
set shiftwidth=2
set shortmess=filmnwxstToOIW
set showmatch
set showtabline=0
set sidescroll=1
set sidescrolloff=0
set smartcase
set softtabstop=2
set spellfile=~/.config/vim/spell/dict.add
set spelllang=en_us
set splitbelow
set splitright
set suffixesadd+=.js,.h,.inc,.txt
set switchbuf=useopen,usetab,newtab
set synmaxcol=0
set t_vb=
set tabstop=2
set tags=~/.git/tags,./tags,./TAGS,tags,TAGS,./tags,/usr/include/tags
set textwidth=78
set timeoutlen=500
set ttyfast
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undolevels=10000
set undoreload=10000
set undoreload=9999
set updatetime=1000
set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.viminfo
set virtualedit=all
set whichwrap+=<,>,h,l
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.eps,*.tif,*.o,*.obj,.git,*.pyc,.android,.adobe,.abgx360,.DS_Store,CFUserTextEncoding,.bundler,.config,.cache,.cpan,.dropbox,.dbshell,.cups,.fontconfig,.dbus-keyrings,.emacs.d,.fonts,.gem,.forever,.npm,.heroku,.oracle,.vim,.adobe,.gem,.cache,.config,.dbus,.fonts,.heroku,.macromedia,.irssi,*.torrent,.mozilla,.npm,.pki,.pip,.remmina,.thumbnails,.VirtualBox,.w3m,node_modules,.node-gyp,.node-gyp,.fontconfig,.abgx360,.bower,*.JPG,*.MOV,*.iso,*.PNG,.bitcoin/*,.cmus/*,.sass-cache/*
set wildmenu
set wildmode=list:longest,full
set wmh=0

" }}}2
 
" gui {{{2

set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set guicursor+=a:blinkon0
                                                       
set guioptions-=L guioptions-=T guioptions-=m guioptions-=r

" }}}2

"}}}1

" Dead {{{1

" set t_Co=256
" set ttimeoutlen=50

"}}}1

