
" Binary {{{1

augroup Binary

" TODO: - Make this also work without matching filenames
autocmd!

" TODO: - Check return value of xdd for errors
autocmd! BufReadPre *.exe let &bin=1

autocmd! BufReadPost *.exe if &bin | silent %!xxd -c 16
autocmd! BufReadPost *.exe set ft=xxd | endif

autocmd! BufWritePre *.exe if &bin | silent %!xxd -r -c 16
autocmd! BufWritePre *.exe endif

autocmd! BufWritePost *.exe if &bin | silent %!xxd -c 16
autocmd! BufWritePost *.exe set nomod | endif

augroup END

" }}}1

" Work {{{1

augroup Work

" Use four spaces, conceal as two {{{2

let g:hostname = substitute(system('hostname'), "\n", "", "")
let g:hostname_work = 'work_vm'

autocmd! BufRead,BufNewFile *.cshtml setlocal filetype=cshtml commentstring=@*%s*@
" autocmd! BufRead,BufNewFile *.cshtml if g:hostname == g:hostname_work | setlocal filetype=cshtml commentstring=@*%s*@ | source $VIMRC_PLUGIN_DIR/conceal.vim | endif
" autocmd! BufRead,BufNewFile *cs if g:hostname == g:hostname_work | source $VIMRC_PLUGIN_DIR/conceal.vim | endif

" autocmd! Syntax html source $VIMRC_PLUGIN_DIR/conceal.vim

" }}}2

augroup END

" }}}1

" filetypes {{{1

augroup filetypes

" {{{2

" Misc {{{3

" c {{{

autocmd! BufNewFile,BufRead *.c,*.cpp set foldmethod=syntax
autocmd! Syntax c,cpp,php,perl setlocal foldmethod=syntax | normal zM
autocmd! FileType c setlocal foldmethod=syntax commentstring=\/\/\ %s

" }}}4

" {{{

autocmd! FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags foldmethod=indent
autocmd! FileType lisp setlocal foldmethod=syntax commentstring=;\ %s

" }}}

autocmd! FileType make setlocal noexpandtab

" JavaScript {{{

autocmd! BufRead,BufNewFile .eslintrc set filetype=json
autocmd! BufReadPost *.jshintrc setf json
autocmd! BufWritePre *.js :%s/\s\+$//e
autocmd! FileType javascript setlocal foldmethod=marker foldmarker={,}
autocmd! Syntax javascript,vim setlocal foldmethod=marker | normal zM

" }}}4

" zsh {{{

autocmd! BufRead,BufNewFile /tmp/zsh* set filetype=zsh tw=0 nowrap
autocmd! BufNewFile,BufRead *.zsh set foldmethod=marker

" }}}4

autocmd! BufNewFile,BufRead *.ldg,*.ledger setf ledger

" Dot Net {{{

autocmd! BufRead,BufNewFile *.aspx,*.asmx,*.ascx set filetype=aspnet
autocmd! FileType cs setlocal commentstring=//\ %s softtabstop=4 tabstop=4 shiftwidth=4
autocmd! FileType vb setlocal commentstring='\ %s

" }}}4

" Stylesheets {{{

autocmd! BufRead,BufNewFile *.css.map set filetype=json

autocmd! FileType css setlocal nowrap foldmethod=indent fmr={,}
autocmd! FileType less setlocal nowrap foldmethod=indent fmr={,}
autocmd! FileType scss setlocal nowrap foldmethod=indent fmr={,}

" Intent being to close folds overbase64 images.
autocmd! BufReadPost *.css,*scss silent! g/base64.\+/normal zc

" }}}4

autocmd! BufRead,BufNewFile *.json set filetype=json
autocmd! BufRead,BufNewFile *.tex set filetype=tex

autocmd! BufRead,BufNewFile .lynxrc set filetype=lynx
autocmd! BufRead,BufNewFile .offlineimaprc setlocal commentstring=#\ %s

autocmd! BufRead,BufNewFile ~/.Xresources setlocal filetype=xdefaults
autocmd! BufRead,BufNewFile ~/.config/X11/* setlocal filetype=xdefaults
autocmd! BufRead,BufNewFile ~/.config/tidy/* setlocal filetype=tidy

autocmd! FileType xdefaults setlocal commentstring=/*\ %s\ */

autocmd! BufRead,BufNewFile /etc/X11/xorg.conf.d/* setfiletype xf86conf

autocmd! BufRead,BufNewFile ~/.festivalrc setfiletype lisp

autocmd! BufRead,BufNewFile /etc/nginx/nginx.conf,/usr/local/nginx/conf/* setfiletype nginx

" Email {{{

autocmd! BufRead,BufNewFile ~/.config/mailcap setlocal nowrap
autocmd! BufRead,BufNewFile ~/.mail/* if &filetype == '' | setfiletype mail | endif
autocmd! BufRead,BufNewFile ~/mail/* if &filetype == '' | setfiletype mail | endif

" mutt {{{

autocmd! BufRead,BufNewFile ~/.config/mutt/* if &filetype == '' | setfiletype muttrc | endif " would also like nowrap
autocmd! BufRead,BufNewFile /tmp/mutt* if &filetype == '' | setfiletype mail | endif

" }}}5

" }}}4

autocmd! BufRead,BufNewFile ~/.drirc set filetype=xml

" mpd {{{

autocmd! BufRead,BufNewFile ~/.config/mpd/books/books.conf set filetype=conf foldmethod=marker foldmarker={,}
autocmd! BufRead,BufNewFile ~/.config/mpd/mpd.conf set filetype=conf foldmethod=marker foldmarker={,}
autocmd! BufRead,BufNewFile ~/.config/mpd/music/music.conf set filetype=conf foldmethod=marker foldmarker={,}
autocmd! BufRead,BufNewFile ~/.config/mpd/stream/stream.conf set filetype=conf foldmethod=marker foldmarker={,}
autocmd! BufRead,BufNewFile ~/.config/mpd/voice/voice.conf set filetype=conf foldmethod=marker foldmarker={,}

" vimpc {{{

autocmd! BufRead,BufNewFile ~/.vimpcrc set filetype=vim foldmethod=marker foldmarker={,}

" }}}

" }}}

autocmd! BufRead,BufNewFile ~/.csgo.autoexec.cfg setlocal foldmethod=marker foldmarker={,} commentstring=\/\/\ %s 

autocmd! BufRead,BufNewFile ~/.offlineimaprc setfiletype conf
autocmd! BufRead,BufWrite *.inc,*.php,*.hs if ! &bin | silent! %s/\s\+$//ge | endif
autocmd! BufRead,BufWrite *.inc,*.php,*.hs if ! &bin | silent! :%s/ \+\ze\t//ge | endif
autocmd! BufReadPre,FileReadPre *.gpg,*.asc set noswapfile

autocmd! BufRead,BufWrite *.xkb set filetype=xkb
autocmd! BufRead,BufWrite ~/xkb/symbols/* set filetype=xkb
autocmd! BufRead,BufWrite ~/.config/X11/xkb/symbols/* set filetype=xkb

autocmd! FileType xkb setlocal foldmethod=marker foldmarker={,} commentstring=\/\/\ %s

" Web servers {{{

autocmd! FileType apache setlocal commentstring=#\ %s
autocmd! FileType nginx setlocal commentstring=#\ %s

" }}}

autocmd! FileType fstab setlocal commentstring=#\ %s
autocmd! FileType haskell setlocal commentstring=--\ %s
autocmd! FileType json setlocal nowrap
autocmd! FileType lynx setlocal commentstring=#\ %s
autocmd! FileType slrnrc setlocal commentstring=%\ %s
autocmd! FileType svnannotate cmap <buffer> q bwipeout

" text {{{

autocmd! FileType text setlocal commentstring=%s
autocmd! BufEnter * if &filetype == "" | setlocal filetype=text | endif
autocmd! FileType text setlocal textwidth=78

 " }}}

" xml {{{

autocmd! BufNewFile,BufRead *.svg set foldmethod=syntax
autocmd! FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
autocmd! FileType xpm set nowrap
autocmd! Syntax xml,html,xhtml setlocal foldmethod=indent commentstring=\<!--\ %s\ --> | normal zM

" autocmd! FileType xml setlocal foldmethod=syntax commentstring=\<!--\ %s\ -->
" autocmd! Syntax c,cpp,javascript,php,java,xml,html,xhtml setlocal foldmethod=syntax
" autocmd! Syntax c,cpp,javascript,php,xml,html,xhtml,perl normal zC
" autocmd! Syntax c,cpp,javascript,php,xml,html,xhtml,perl normal zR

" }}}

" autocmd! FileType unite call s:unite_settings()

" tmux {{{

autocmd! BufRead,BufNewFile ~/.config/tmux/* set filetype=tmux
autocmd! BufRead,BufNewFile ~/.config/tmux/**/* set filetype=tmux
autocmd! FileType tmux setlocal commentstring=#\ %s foldmethod=marker tw=0

" }}}4

" }}}3

" lircd

autocmd! BufRead,BufNewFile /usr/local/etc/lirc/lircd.conf.d/lircd.conf setlocal foldmethod=marker commentstring=#\ %s
autocmd! BufRead,BufNewFile /usr/local/etc/lirc/lircd.conf.d/*.conf setlocal foldmethod=marker commentstring=#\ %s

" xmonad {{{3

autocmd! BufRead,BufNewFile ~/.xmonad/xmonad.hs setfiletype haskell | set foldmethod=indent commentstring=--\ %s

" }}}3

" xmodmap {{{3

autocmd! BufRead,BufNewFile ~/.xmodmap setfiletype xmodmap | set foldmethod=marker commentstring=!\ %s

" }}}3

" xbindkeys {{{3

autocmd! BufRead,BufNewFile ~/.xbindkeys setfiletype conf | set foldmethod=indent commentstring=#\ %s

" }}}3

" irssi {{{3

autocmd! BufRead,BufNewFile ~/.irssi/config,~/.irssi/default.theme setfiletype conf | set foldmethod=marker fmr={,}

" }}}3

" SSH {{{3

autocmd! FileType sshconfig set nowrap foldmethod=indent

" }}}3

" vim {{{3

autocmd! BufNewFile,BufRead *.vim setf vim

autocmd! BufRead,BufNewFile ~/.config/vim/plugins/pathogen/autoload/pathogen.vim set foldmethod=marker
autocmd! FileType vim setlocal commentstring=\"\ %s comments=b:\"

" This was the default… not sure what the three-piece comment intent was.
" autocmd! FileType vim setlocal commentstring=\"\ %s comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",b:\"

" ajhsdkfjahsdf kasjhdfk asdhfja sdfhafks djhasdf lashdf alskfhj asldhf
" asdfkljhas dfkljh sadfkljahs dfdjhfkas

autocmd! Syntax vim setlocal foldmethod=marker | normal zM


" }}}3

" }}}2

" {{{2

autocmd! BufRead,BufNewFile *.json setlocal equalprg=python\ -mjson.tool\ 2>/dev/null
autocmd! FileType json setlocal equalprg=python\ -mjson.tool\ 2>/dev/null

" }}}2

autocmd! BufRead,BufNewFile * if &fileformat == 'unix' | syntax match Invisible /\r$/ conceal | setlocal conceallevel=2 | endif

augroup END

" }}}1

" Misc {{{1

augroup misc

" {{{2

autocmd! BufEnter * if exists('b:winview') | call winrestview(b:winview) | endif
autocmd! BufLeave * let b:winview = winsaveview()
autocmd! BufRead,BufNewFile /etc/pacman.conf set commentstring=#\ %s
autocmd! BufReadPost *.doc %!antiword "%"
autocmd! BufReadPost *.pdf silent %!pdftotext -layout -nopgbrk "%" -
autocmd! BufReadPre *.doc set hlsearch!
autocmd! BufReadPre *.doc set ro
autocmd! BufWritePre /tmp/* setlocal noundofile
autocmd! FocusGained * :
autocmd! FocusLost * :
autocmd! FocusLost * silent! wa
autocmd! bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" }}}2

augroup END

" }}}1

" JSON {{{1

augroup json_autocmd

" json filetype {{{2

autocmd! FileType json set autoindent
autocmd! FileType json set expandtab
autocmd! FileType json set foldmethod=syntax
autocmd! FileType json set formatoptions=tcq2l
autocmd! FileType json set softtabstop=2 tabstop=2
autocmd! FileType json set textwidth=78 shiftwidth=2

" }}}2

augroup END

" }}}1

" Classic ASP {{{

autocmd! FileType aspvbs setlocal noexpandtab commentstring='\ %s foldmethod=indent ts=4
autocmd! BufRead,BufNewFile *XpoNlm.XpoNlm.Web/main/**.inc setlocal filetype=aspvbs

" }}}1

" Notes {{{

autocmd! FileType vidir-ls setlocal tw=0

" TODO: I really want this!
" autocmd! BufEnter,BufWinEnter,WinEnter notes execute "normal zt"

autocmd! BufRead,BufNewFile colorscheme wombat256mod
autocmd! BufRead,BufNewFile notes nnoremap <silent> <leader>l G :r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A — 
autocmd! BufRead,BufNewFile notes set filetype=text 
autocmd! BufRead,BufNewFile ~/.documents/notes nnoremap <silent> <leader>l <esc>G :r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A — 
autocmd! BufRead,BufNewFile ~/Documents/notes nnoremap <silent> <leader>l <esc>G :r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A — 

" }}}

" abbreviations {{{

" TODO: What this really needs is a staging area for recently added but not
" verified or corrected abbreviations.

" $VIM_BUNDLE_DIR/vimrc/plugin/abbrev.vim

" autocmd! BufWritePre *.js :%s/\s\+$//e

autocmd! BufEnter,BufWinEnter,TextChanged,InsertLeave .abbrev.vim :checktime
autocmd! BufEnter,BufWinEnter,TextChanged,InsertLeave abbrev.vim :checktime

autocmd! BufRead,BufNewFile .abbrev.vim  nnoremap <silent> <leader>k :silent! %s/^[\|<=>]\+.*$//g<cr>:sort u<cr><esc>Go<esc>gg:w<cr>:<esc>0 
autocmd! BufRead,BufNewFile abbrev.vim nnoremap <silent> <leader>k :silent! %s/^[\|<=>]\+.*$//g<cr>:sort u<cr><esc>Go<esc>gg:w<cr>:<esc>0

" TODO: Need this to run at startup with no issues.

" autocmd! InsertLeave abbrev.vim :checktime

" }}}

" omnisharp {{{

augroup omnisharp_commands
  autocmd!

  if exists('g:OmniSharp_loaded')
    " FIXME: check if OmniSharp has been loaded before adding these autocommands

    autocmd! BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " autocmd! BufWritePost *.cs call OmniSharp#AddToProject()
    " autocmd! CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " autocmd! FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
    " autocmd! FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    " autocmd! FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " autocmd! FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    " autocmd! FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    " autocmd! FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " autocmd! FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    " autocmd! FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    " autocmd! FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    " autocmd! FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    " autocmd! FileType cs nnoremap <leader>gd :OmniSharpGotoDefinition<cr>
    " autocmd! FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    " autocmd! FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    " autocmd! FileType cs setlocal omnifunc=OmniSharp#Complete

    " autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>

  endif

augroup END

" }}}

" Dead {{{1

" augroup vimrc_autocmds
"   autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"   autocmd BufEnter * match OverLength /\%82v/
" augroup END

"autocmd BufReadPre * setlocal foldmethod=indent
"autocmd BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"autocmd BufWinEnter *.* if expand("%") != "" | loadview | endif
"autocmd BufWinLeave *.* if expand("%") != "" | mkview! | endif
"autocmd CursorHold * if getcmdwintype() == '' | checktime | endif
"autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
"autocmd FileChangedShell * if getcmdwintype() == '' | checktime | endif
"autocmd FileChangedShellPost * if getcmdwintype() == '' | checktime | endif
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline

" if v:version >= 700
" endif

" autocmd! BufEnter *.org call org#SetOrgFileType()
" autocmd! BufRead,BufNewFile ~/.gnupg/* if &filetype == 'conf' | setfiletype gpg | endif
" autocmd! BufRead,BufWrite,BufWritePost,BufNewFile *.org

" autocmd! BufEnter *.org call org#SetOrgFileType()
" autocmd! BufRead,BufNewFile ~/.gnupg/* if &filetype == 'conf' | setfiletype gpg | endif
" autocmd! BufRead,BufWrite,BufWritePost,BufNewFile *.org

"autocmd! CursorHold * silent checktime

" }}}1

" TODO: CmdUndefined - FuncUndefined

