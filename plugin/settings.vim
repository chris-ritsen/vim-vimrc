
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

" set commentstring=#\ %s
" set completeopt=menuone,menu,longest,preview
" set hl+=D:DiffDelete,T:DiffText,>:SignColumn,-:Conceal

set hl=8:SpecialKey,@:NonText,d:Directory,e:ErrorMsg,i:IncSearch,l:Search

" set hl+=!:CursorColumn,.:CursorLine,o:ColorColumn:set

set hl+=Bs
set hl+=Pn
set hl+=R:SpellRare,L:SpellLocal,+:Pmenu,=:PmenuSel,x:PmenuSbar,X:PmenuThumb
set hl+=\*:TabLine,#:TabLineSel,_:TabLineFill
set hl+=m:MoreMsg,M:ModeMsg,n:LineNr,N:CursorLineNr,r:Question
set hl+=s:StatusLine,S:StatusLineNC,c:VertSplit,t:Title,v:Visual,V:VisualNOS
set hl+=w:WarningMsg,W\ :WildMenu,f:Folded,F:FoldColumn,A:DiffAdd,C:DiffChange

set autoindent
set autoread
set backspace=eol,start,indent
set cmdheight=1
set comments+=fb:•
set comments+=fb:∙
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
set formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*\\\|^\\*\\s*\|^\\s*∙\\s*\|^\\s*•\\s*  
set formatoptions+=njw
set guiheadroom=0
set hidden
set history=10000
set ignorecase
set incsearch
set iskeyword-=-
set iskeyword-=_
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
set noshowmatch
set noshowmode
set novisualbell
set nowrap
set nrformats=octal,hex,alpha " increment strings

set path=.,/usr/include,/usr/local/lib/php/,/usr/share/povray/include

set path+=.,/usr//usr/share/doc/rfc/txt

set printdevice=laserjet
set printheader=
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
set undolevels=10000
set undoreload=10000
set updatetime=1000
set updatetime=500
set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.viminfo
set virtualedit=all
set whichwrap+=<,>,h,l
set wildmenu
set wildmode=list:longest,full
set wmh=0

set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg

set wildignore+=*.android,.adobe,.abgx360,.DS_Store,CFUserTextEncoding
set wildignore+=*.png,*.xpm,*.gif,*.pdf,*.eps,*.tif,*.o,*.obj,.git,*.pyc
set wildignore+=.bitcoin/*,.cmus/*,.sass-cache/*
set wildignore+=.bundler,.config,.cache,.cpan,.dropbox,.dbshell,.cups
set wildignore+=.fontconfig,.dbus-keyrings,.emacs.d,.fonts,.gem,.forever,.npm
set wildignore+=.heroku,.macromedia,.irssi,*.torrent,.mozilla,.npm,.pki,.pip
set wildignore+=.heroku,.oracle,.vim,.adobe,.gem,.cache,.config,.dbus,.fonts
set wildignore+=.node-gyp,.fontconfig,.abgx360,.bower,*.JPG,*.MOV,*.iso,*.PNG
set wildignore+=.remmina,.thumbnails,.VirtualBox,.w3m,node_modules,.node-gyp

" }}}2
 
" gui {{{2

set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor

set guicursor+=a:blinkon0
set guicursor+=n-i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
set guicursor+=n-sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
                                                       
set guioptions-=LTmr

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monaco\ 11
  elseif has("gui_photon")
    set guifont=Monaco\ 11
  elseif has("gui_kde")
    set guifont=Monaco\ 11
  elseif has("x11")
		" TODO: More elaborate here
    set guifont=Monaco\ 11
  else
    set guifont=Monaco\ 11
  endif

	" TODO: Get rid of the ridiculous border

endif

" }}}2

" }}}1

" custom expression for gf {{{

set includeexpr=IncludeExpressionWhatever() 

" }}}

" Dead {{{1

" Hardcopy printing {{{

" Print settings {{{

" set printencoding=utf-8
" set printoptions=left:0pc,right:0pc,top:0pc,bottom:0pc,header:0,duplex:long,wrap:n,number:n,syntax:y,collate:y,portrait:y
" set printfont=courier:h8

" }}}

" }}}

" set t_Co=256
" set ttimeoutlen=50

"}}}1

