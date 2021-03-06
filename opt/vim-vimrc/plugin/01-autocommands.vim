
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

" Git {{{1

augroup git

" Git commit {{{2

autocmd! FileType gitcommit setlocal textwidth=72 number comments=fb:* commentstring=#\ %s
autocmd! FileType gitrebase setlocal textwidth=72 hlsearch number commentstring=#\ %s
autocmd! FileType gitconfig setlocal textwidth=0 number commentstring=#\ %s

" }}}2

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
autocmd! BufRead,BufNewFile *cs set sw=2 ts=2

" autocmd! Syntax html source $VIMRC_PLUGIN_DIR/conceal.vim

" }}}2

augroup END

" }}}1

" filetypes {{{1

augroup filetypes

" {{{2

" Misc {{{3

autocmd! Syntax mail setlocal commentstring=>\ %s

" need a command to target this same file (autocmds.vim)

" c {{{

autocmd! BufNewFile,BufRead *.c,*.cpp set foldmethod=syntax comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
autocmd! Syntax c,cpp,php,perl setlocal foldmethod=syntax | normal zM
autocmd! FileType c setlocal foldmethod=syntax commentstring=\/\/\ %s

autocmd! BufRead,BufNewFile *.cc set filetype=cpp

autocmd! FileType cpp setlocal foldmethod=syntax comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:- commentstring=\/\/\ %s


" }}}4

" {{{

autocmd! FileType readline setlocal commentstring=#\ %s
autocmd! FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags foldmethod=indent
autocmd! FileType lisp setlocal foldmethod=syntax commentstring=;\ %s

autocmd! BufNewFile,BufRead zathurarc  setlocal commentstring=#\ %s

" }}}

autocmd! FileType make setlocal noexpandtab

" JavaScript {{{

autocmd! BufRead,BufNewFile .eslintrc set filetype=json synmaxcol=512
autocmd! BufRead,BufNewFile *.json setlocal nowrap conceallevel=0 synmaxcol=512
autocmd! BufReadPost *.jshintrc setf json
autocmd! BufReadPost *.babelrc setf json
autocmd! BufWritePre *.js :%s/\s\+$//e
" autocmd! FileType javascript setlocal suffixesadd+=.js foldmethod=marker foldmarker={,} commentstring=\/\/\ %s
autocmd! FileType javascript setlocal suffixesadd+=.js synmaxcol=512

" }}}4

" web dev {{{

autocmd! FileType jsx setlocal softtabstop=2 tabstop=2 shiftwidth=2 expandtab
autocmd! FileType ruby setlocal iskeyword=@,!,?,48-57,_,192-255 softtabstop=2 tabstop=2 shiftwidth=2 expandtab synmaxcol=512 foldmethod=indent regexpengine=1 commentstring=#\ %s
autocmd! FileType slim setlocal iskeyword=@,!,?,48-57,_,192-255 softtabstop=2 tabstop=2 shiftwidth=2 expandtab synmaxcol=512 foldmethod=indent tw=0 commentstring=/\ %s
autocmd! FileType coffee setlocal softtabstop=1 tabstop=2 shiftwidth=2 expandtab synmaxcol=256 tw=0 foldmethod=indent commentstring=#\ %s 
autocmd! FileType yaml setlocal softtabstop=2 tabstop=2 shiftwidth=2 tw=0 foldmethod=indent expandtab commentstring=#\ %s

autocmd! BufNewFile,BufRead *.inky-haml setf haml
autocmd! BufNewFile,BufRead *.inky-slim setf slim
autocmd! BufNewFile,BufRead *.rabl setf ruby
autocmd! BufNewFile,BufRead *.yml.default setf yaml
autocmd! BufNewFile,BufRead *.yml.sample setf yaml

" }}}

" zsh {{{

autocmd! BufRead,BufNewFile /tmp/zsh* set filetype=zsh tw=0 nowrap
autocmd! BufNewFile,BufRead *.zsh set filetype=zsh 
autocmd! FileType zsh setlocal softtabstop=2 tabstop=2 shiftwidth=2 expandtab foldmethod=marker commentstring=#\ %s

" }}}4

autocmd! BufNewFile,BufRead *.ldg,*.ledger setf ledger

" scheme {{{

autocmd! FileType scheme setlocal commentstring=;\ %s
autocmd! BufNewFile,BufRead *.guile setf scheme
autocmd! BufNewFile,BufRead *.csirc setf scheme

" }}}

" Dot Net {{{

autocmd! BufRead,BufNewFile *.aspx,*.asmx,*.ascx set filetype=aspnet
autocmd! FileType cs setlocal commentstring=//\ %s softtabstop=4 tabstop=4 shiftwidth=4
autocmd! FileType vb setlocal commentstring='\ %s

" }}}4

" Stylesheets {{{

autocmd! BufRead,BufNewFile *.css.map set filetype=json

autocmd! FileType css setlocal nowrap tw=0 foldmethod=indent fmr={,} suffixesadd+=.less,.sass,.css
autocmd! FileType less setlocal nowrap tw=0 foldmethod=indent fmr={,}
autocmd! FileType scss setlocal nowrap tw=0 foldmethod=indent fmr={,}

" Intent being to close folds overbase64 images.
autocmd! BufReadPost *.css,*scss silent! g/base64.\+/normal zc

" }}}4

" tex {{{

autocmd! BufRead,BufNewFile *.tex set filetype=tex
autocmd! FileType tex setlocal commentstring=\%\ %s

" }}}

autocmd! FileType text setlocal commentstring=%s

autocmd! BufRead,BufNewFile *.slice,*.path set filetype=systemd 
autocmd! BufRead,BufNewFile *.rules set filetype=udevrules 
autocmd! FileType systemd setlocal tw=0 number commentstring=#\ %s
autocmd! BufRead,BufNewFile ~/.config/systemd/* setlocal filetype=systemd
autocmd! BufRead,BufNewFile ~/.local/share/dbus-1/system.d/* setlocal filetype=xml
autocmd! BufRead,BufNewFile ~/.local/share/dbus-1/services/* setlocal filetype=systemd

autocmd! BufRead,BufNewFile .lynxrc set filetype=lynx
autocmd! BufRead,BufNewFile .offlineimaprc setlocal commentstring=#\ %s

autocmd! BufRead,BufNewFile ~/.Xresources setlocal filetype=xdefaults tw=0
autocmd! BufRead,BufNewFile *.xrdb setlocal filetype=xdefaults tw=0
autocmd! BufRead,BufNewFile *.remote setlocal filetype=conf tw=0 number commentstring=#\ %s 
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

autocmd! BufRead,BufNewFile ~/.config/mpd/books/books.conf set filetype=conf foldmethod=marker foldmarker={,} commentstring=#\ %s  
autocmd! BufRead,BufNewFile ~/.config/mpd/mpd.conf set filetype=conf foldmethod=marker foldmarker={,} commentstring=#\ %s  
autocmd! BufRead,BufNewFile mpd.conf set filetype=conf foldmethod=marker foldmarker={,} commentstring=#\ %s  
autocmd! BufRead,BufNewFile ~/.config/mpd/music/music.conf set filetype=conf foldmethod=marker foldmarker={,} commentstring=#\ %s  
autocmd! BufRead,BufNewFile ~/.config/mpd/stream/stream.conf set filetype=conf foldmethod=marker foldmarker={,} commentstring=#\ %s  
autocmd! BufRead,BufNewFile ~/.config/mpd/voice/voice.conf set filetype=conf foldmethod=marker foldmarker={,} commentstring=#\ %s 

" vimpc {{{

autocmd! BufRead,BufNewFile ~/.vimpcrc set filetype=vim foldmethod=marker foldmarker={,}

" }}}

" }}}

autocmd! BufRead,BufNewFile ~/.config/mpv/mpv.conf setlocal commentstring=#\ %s
autocmd! BufRead,BufNewFile ~/.csgo.autoexec.cfg setlocal foldmethod=marker foldmarker={,} commentstring=\/\/\ %s 

autocmd! BufRead,BufNewFile ~/.offlineimaprc setfiletype conf
autocmd! BufRead,BufWrite *.inc,*.php,*.hs if ! &bin | silent! %s/\s\+$//ge | endif
autocmd! BufRead,BufWrite *.inc,*.php,*.hs if ! &bin | silent! :%s/ \+\ze\t//ge | endif
autocmd! BufReadPre,FileReadPre *.gpg,*.asc set noswapfile

autocmd! BufRead,BufWrite *.xkb set filetype=xkb
autocmd! BufRead,BufWrite ~/xkb/symbols/* set filetype=xkb
autocmd! BufRead,BufWrite /usr/share/X11/xkb/symbols/* set filetype=xkb
autocmd! BufRead,BufWrite ~/.config/X11/xkb/symbols/* set filetype=xkb

autocmd! FileType xkb setlocal foldmethod=marker foldmarker={,} commentstring=\/\/\ %s

" Web servers {{{

autocmd! FileType apache setlocal commentstring=#\ %s
autocmd! FileType nginx setlocal commentstring=#\ %s

" }}}

autocmd! FileType fstab setlocal commentstring=#\ %s
autocmd! FileType haskell setlocal commentstring=--\ %s
autocmd! FileType json setlocal nowrap conceallevel=0 synmaxcol=512
autocmd! FileType lynx setlocal commentstring=#\ %s
autocmd! FileType slrnrc setlocal commentstring=%\ %s
autocmd! FileType svnannotate cmap <buffer> q bwipeout

" text {{{

autocmd! FileType text setlocal commentstring=%s
" autocmd! BufEnter * if &filetype == "" | setlocal filetype=text | endif
autocmd! FileType text setlocal textwidth=78

 " }}}

" xml {{{

autocmd! BufNewFile,BufRead *.svg set foldmethod=syntax
autocmd! FileType xml exe ":silent %!xmllint --format --recover - 2>/dev/null"
autocmd! FileType xml setlocal foldmethod=syntax equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
autocmd! FileType xpm set nowrap
autocmd! Syntax xml,html,xhtml setlocal foldmethod=indent commentstring=\<!--\ %s\ --> | normal zM

" autocmd! FileType xml setlocal foldmethod=syntax commentstring=\<!--\ %s\ -->
" autocmd! Syntax c,cpp,javascript,php,java,xml,html,xhtml setlocal foldmethod=syntax
" autocmd! Syntax c,cpp,javascript,php,xml,html,xhtml,perl normal zC
" autocmd! Syntax c,cpp,javascript,php,xml,html,xhtml,perl normal zR

" }}}

" autocmd! FileType unite call s:unite_settings()

" tmux {{{

autocmd! BufRead,BufNewFile ~/.config/tmux/bind set filetype=tmux
autocmd! BufRead,BufNewFile ~/.config/tmux/tmux.conf set filetype=tmux
autocmd! BufRead,BufNewFile ~/.config/tmux/* set filetype=tmux
autocmd! FileType tmux setlocal commentstring=#\ %s foldmethod=marker tw=0

" }}}4

" }}}3

" lircd

autocmd! BufRead,BufNewFile /usr/local/etc/lirc/lircd.conf.d/lircd.conf setlocal foldmethod=marker commentstring=#\ %s
autocmd! BufRead,BufNewFile /usr/local/etc/lirc/lircd.conf.d/*.conf setlocal foldmethod=marker commentstring=#\ %s

" xmonad {{{3

autocmd! BufRead,BufNewFile ~/.xmonad/xmonad.hs setfiletype haskell | setlocal foldmethod=indent tw=0 commentstring=--\ %s

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

autocmd! FileType .ssh/config set sshconfig
autocmd! FileType sshconfig set nowrap foldmethod=indent commentstring=#\ %s

" }}}3

" vim {{{3

autocmd! BufNewFile,BufRead *.vim setf vim
autocmd! Syntax vim setlocal foldmethod=marker | normal zM

autocmd! BufRead,BufNewFile ~/.config/vim/plugins/pathogen/autoload/pathogen.vim set foldmethod=marker
autocmd! FileType vim setlocal commentstring=\"\ %s comments=b:\"

" This was the default??? not sure what the three-piece comment intent was.
" autocmd! FileType vim setlocal commentstring=\"\ %s comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",b:\"

autocmd! Syntax vim setlocal foldmethod=marker | normal zM

" }}}3

" }}}2

" Python {{{

autocmd! Syntax python setlocal suffixesadd+=.py number foldmethod=indent expandtab shiftwidth=4 softtabstop=4 commentstring=#\ %s 

" }}}

" {{{2

autocmd! BufRead,BufNewFile *.json setlocal conceallevel=0 equalprg=python\ -mjson.tool\ 2>/dev/null
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

autocmd! FileType json setlocal formatoptions=tcq2l foldmethod=syntax softtabstop=2 tabstop=2 textwidth=78 shiftwidth=2 autoindent expandtab synmaxcol=256

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
autocmd! BufRead,BufNewFile notes nnoremap <silent> <leader>l G :r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A?????????
autocmd! BufRead,BufNewFile notes set filetype=text 
autocmd! BufRead,BufNewFile ~/.documents/notes nnoremap <silent> <leader>l <esc>G :r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A?????????
autocmd! BufRead,BufNewFile ~/Documents/notes nnoremap <silent> <leader>l <esc>G :r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A?????????
nnoremap <silent> <leader>l G :r !date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>zt A?????????

" }}}

" abbreviations {{{

" TODO: What this really needs is a staging area for recently added but not
" verified or corrected abbreviations.

" $VIM_BUNDLE_DIR/vimrc/abbrev.vim

" autocmd! BufWritePre *.js :%s/\s\+$//e

autocmd! BufEnter,BufWinEnter,TextChanged,InsertLeave .abbrev.vim :checktime
autocmd! BufEnter,BufWinEnter,TextChanged,InsertLeave abbrev.vim :checktime

autocmd! BufRead,BufNewFile .abbrev.vim  nnoremap <silent> <leader>k :silent! %s/^[\|<=>]\+.*$//g<cr>:sort u<cr><esc>Go<esc>zt0:w<cr>:<esc>
autocmd! BufRead,BufNewFile abbrev.vim nnoremap <silent> <leader>k :silent! %s/^[\|<=>]\+.*$//g<cr>:sort u<cr><esc>Go<esc>zt0:w<cr>:<esc>

" TODO: Need this to run at startup with no issues.

" autocmd! InsertLeave abbrev.vim :checktime

" }}}

" omnisharp {{{

" FIXME: This section is a complete mess.

" Huh? What is <leader>p ... opens some kind of command prompt.

augroup omnisharp_commands
  autocmd!

  if exists('g:OmniSharp_loaded')

		let g:OmniSharp_timeout = 1

    " Showmatch significantly slows down omnicomplete when the first match
    " contains parentheses.

		set noshowmatch

    " Don't autoselect first item in omnicomplete, show if only one item (for
    " preview) remove preview if you don't want to see any documentation
    " whatsoever.

		set completeopt=longest,menuone,preview

    autocmd! BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    " autocmd! FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
    " autocmd! FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    " autocmd! FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " autocmd! FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " autocmd! FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    " autocmd! FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    " autocmd! FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " autocmd! FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    " autocmd! FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    " autocmd! FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    " autocmd! FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    " autocmd! FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    " autocmd! FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    " autocmd! FileType cs setlocal omnifunc=OmniSharp#Complete

    autocmd! FileType cs nnoremap <leader>x :OmniSharpGotoDefinition<cr>
    autocmd! FileType cs setlocal updatetime=500
    autocmd! FileType cs setlocal cmdheight=2

    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

  endif

augroup END

" nnoremap <F2> :OmniSharpRename<cr>
" nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" nnoremap <leader>nm :OmniSharpRename<cr>
" nnoremap <leader>rl :OmniSharpReloadSolution<cr>
" nnoremap <leader>sp :OmniSharpStopServer<cr>
" nnoremap <leader>ss :OmniSharpStartServer<cr>
" nnoremap <leader>th :OmniSharpHighlightTypes<cr>
" nnoremap <leader>tp :OmniSharpAddToProject<cr>

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

" {{{ TODO

" TODO: CmdUndefined - FuncUndefined

" }}}

autocmd! BufRead,BufNewFile Procfile.dev setlocal tw=0

autocmd! BufRead,BufNewFile ~/.config/vim/bundle/vimrc/plugin/autocmds.vim setlocal tw=0
autocmd! BufRead,BufNewFile ~/work/machinetools.com/documents/daily setlocal tw=0

autocmd! FileType elinks setlocal tw=0 number commentstring=#\ %s
autocmd! BufRead,BufNewFile ~/.tmp/vim/books setfiletype vim
autocmd! BufNewFile,BufRead ~/.mednafen/*.cfg setlocal tw=0 number commentstring=#\ %s
autocmd! BufNewFile,BufRead ~/.config/jack/conf.xml setlocal tw=0 number nofoldenable
autocmd! FileType alsaconf setlocal nowrap number commentstring=#\ %s
autocmd! BufRead,BufNewFile mimeapps.list setlocal number textwidth=0 commentstring=#\ %s

autocmd! FileType sh setlocal textwidth=0 number commentstring=#\ %s
autocmd! FileType vue silent! echo context_filetype#get_filetype()
autocmd! FileType vue setlocal foldmethod=indent textwidth=0
autocmd! FileType fstab setlocal textwidth=0 nowrap number commentstring=#\ %s 

set backupskip+=*.gpg
" To avoid that parts of the file is saved to .viminfo when yanking or
" deleting, empty the 'viminfo' option.
" set viminfo=

augroup encrypted
  au!
  " Disable swap files, and set binary file format before reading the file
  autocmd BufReadPre,FileReadPre *.gpg
    \ setlocal noswapfile bin
  " Decrypt the contents after reading the file, reset binary file format
  " and run any BufReadPost autocmds matching the file name without the .gpg
  " extension
  autocmd BufReadPost,FileReadPost *.gpg
    \ execute "'[,']!gpg --decrypt --default-recipient-self" |
    \ setlocal nobin |
    \ execute "doautocmd BufReadPost " . expand("%:r")
  " Set binary file format and encrypt the contents before writing the file
  autocmd BufWritePre,FileWritePre *.gpg
    \ setlocal bin |
    \ '[,']!gpg --encrypt --default-recipient-self
  " After writing the file, do an :undo to revert the encryption in the
  " buffer, and reset binary file format
  autocmd BufWritePost,FileWritePost *.gpg
    \ silent u |
    \ setlocal nobin
augroup END
