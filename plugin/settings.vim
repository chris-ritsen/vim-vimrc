
set backspace=eol,start,indent
set path=.,/usr/include,/usr/local/lib/php/,/usr/share/povray/include,/usr/share/doc/rfc/txt
set cmdheight=1
set tags=~/.git/tags,./tags,./TAGS,tags,TAGS,./tags,/usr/include/tags
set completeopt=menuone,menu,longest,preview
set dir=~/.vim/swap//,/tmp//,.
set encoding=utf-8
set expandtab
set fileformats+=mac
set fillchars=
set foldlevel=20
set foldlevelstart=20
set foldminlines=1
set hidden
set history=10000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linebreak
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set magic
set mat=2
set mouse=a
set mousehide
set mousemodel=extend
set nocursorline
set noerrorbells
set nolazyredraw
set nomodeline
set noshowcmd
set novisualbell
set nrformats=octal,hex,alpha " increement strings
set number
set ruler 
set shiftwidth=2
set shortmess=filmnwxstToOI
set showmatch
set showtabline=0 " 0: never, 1: only when 1+ tabs, 2: always
set smartcase
set softtabstop=2
set spellfile=~/.config/vim/spell/dict.add
set spelllang=en_us
set splitbelow
set splitright
set t_vb=
set tabstop=2
set textwidth=80
set tm=500
set ttyfast
set ttymouse=xterm2 " Fixes resizing splits in tmux
set undodir=~/.vim/undo     " where to save undo histories
set undofile                " Save undo's after file closes
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.viminfo
set virtualedit=all
set whichwrap+=<,>,h,l
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.eps,*.tif,*.o,*.obj,.git,*.pyc,.android,.adobe,.abgx360,.DS_Store,CFUserTextEncoding,.bundler,.config,.cache,.cpan,.dropbox,.dbshell,.cups,.fontconfig,.dbus-keyrings,.emacs.d,.fonts,.gem,.forever,.npm,.heroku,.oracle,.vim,.adobe,.gem,.cache,.config,.dbus,.fonts,.heroku,.macromedia,.irssi,*.torrent,.mozilla,.npm,.pki,.pip,.remmina,.thumbnails,.VirtualBox,.w3m,node_modules,.node-gyp,.node-gyp,.fontconfig,.abgx360,.bower,*.JPG,*.MOV,*.iso,*.PNG,.bitcoin/*,.cmus/*,.sass-cache/*
set wildmenu
set wildmode=list:longest,full
set wmh=0
set wrap

if &tabpagemax < 50
  set tabpagemax=50
endif

