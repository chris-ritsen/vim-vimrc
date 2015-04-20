
" Web Development {{{1

autocmd! BufReadPost *.jshintrc setf json
autocmd! BufWritePre *.js :%s/\s\+$//e

" {{{2

autocmd! FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags foldmethod=indent
autocmd! FileType javascript setlocal foldmethod=marker foldmarker={,}
autocmd! FileType xml setlocal foldmethod=syntax

" }}}2
" }}}1

" {{{1

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

  autocmd! BufRead,BufNewFile *.cshtml if g:hostname == g:hostname_work | setlocal filetype=html commentstring=@*%s*@ | source $VIMRC_PLUGIN_DIR/conceal.vim | endif
  autocmd! BufRead,BufNewFile *.js,*cs if g:hostname == g:hostname_work | source $VIMRC_PLUGIN_DIR/conceal.vim | endif

  autocmd! Syntax html source $VIMRC_PLUGIN_DIR/conceal.vim

  " }}}2

augroup END

" }}}1

" {{{1

augroup filetypes 

  " {{{2
  autocmd! BufEnter * if &filetype == "" | setlocal filetype=text | endif
  autocmd! BufNewFile,BufRead *.zsh set foldmethod=marker

  autocmd! BufNewFile,BufRead *.c,*.cpp set foldmethod=syntax
  autocmd! BufNewFile,BufRead *.css,*.scss set foldmethod=marker fmr={,}
  autocmd! BufNewFile,BufRead *.ldg,*.ledger setf ledger
  autocmd! BufNewFile,BufRead *.svg set foldmethod=syntax
  autocmd! BufNewFile,BufRead *.vim set commentstring=" %s
  autocmd! BufRead,BufNewFile *.aspx,*.asmx,*.ascx set filetype=aspnet 
  autocmd! BufRead,BufNewFile *.config/tmux/*,*.config/tmux/sessions/* setfiletype tmux
  autocmd! BufRead,BufNewFile *.css.map set filetype=json
  autocmd! BufRead,BufNewFile *.json set filetype=json
  autocmd! BufRead,BufNewFile *.tex set filetype=tex
  autocmd! BufRead,BufNewFile .eslintrc set filetype=json
  autocmd! BufRead,BufNewFile .lynxrc set filetype=lynx
  autocmd! BufRead,BufNewFile .offlineimaprc setlocal commentstring=#\ %s
  autocmd! BufRead,BufNewFile /etc/X11/xorg.conf.d/* setfiletype xf86conf
  autocmd! BufRead,BufNewFile /etc/nginx/nginx.conf,/usr/local/nginx/conf/* setfiletype nginx
  autocmd! BufRead,BufNewFile /tmp/mutt* if &filetype == '' | setfiletype mail | endif 
  autocmd! BufRead,BufNewFile ~/.config/mailcap setlocal nowrap
  autocmd! BufRead,BufNewFile ~/.config/mutt/* if &filetype == '' | setfiletype muttrc | endif " would also like nowrap

  autocmd! BufRead,BufNewFile ~/.ssh/config setfiletype conf
  autocmd! BufRead,BufNewFile ~/.ssh/config set foldmethod=indent

  autocmd! BufRead,BufNewFile ~/.config/mpd/mpd.conf setfiletype conf
  autocmd! BufRead,BufNewFile ~/.config/mpd/mpd.conf set foldmethod=marker foldmarker={,}

  autocmd! BufRead,BufNewFile ~/.irssi/config setfiletype conf
  autocmd! BufRead,BufNewFile ~/.irssi/config set foldmethod=marker fmr={,} 

  autocmd! BufRead,BufNewFile ~/.config/vim/plugins/pathogen/autoload/pathogen.vim set foldmethod=marker
  autocmd! BufRead,BufNewFile ~/.offlineimaprc setfiletype conf
  autocmd! BufRead,BufNewFile ~/.mail/* if &filetype == '' | setfiletype mail | endif 
  autocmd! BufRead,BufNewFile ~/mail/* if &filetype == '' | setfiletype mail | endif 
  autocmd! BufRead,BufWrite *.inc,*.php,*.hs if ! &bin | silent! %s/\s\+$//ge | endif
  autocmd! BufRead,BufWrite *.inc,*.php,*.hs if ! &bin | silent! :%s/ \+\ze\t//ge | endif
  autocmd! BufReadPost *.css,*scss silent! g/base64.\+/normal zc " close base64 images
  autocmd! BufReadPre,FileReadPre *.gpg,*.asc set noswapfile

  autocmd! FileType vim setlocal commentstring=#\ %s
  autocmd! FileType apache setlocal commentstring=#\ %s
  autocmd! FileType css setlocal nowrap
  autocmd! FileType fstab setlocal commentstring=#\ %s
  autocmd! FileType haskell setlocal commentstring=--\ %s 
  autocmd! FileType json setlocal nowrap
  autocmd! FileType lynx setlocal commentstring=#\ %s
  autocmd! FileType nginx setlocal commentstring=#\ %s
  autocmd! FileType scss setlocal nowrap
  autocmd! FileType slrnrc setlocal commentstring=%\ %s
  autocmd! FileType svnannotate cmap <buffer> q bwipeout
  autocmd! FileType text setlocal commentstring=%s 
  autocmd! FileType unite call s:unite_settings()
  autocmd! FileType text setlocal textwidth=78
  autocmd! FileType tmux setlocal commentstring=#\ %s
  autocmd! FileType vb setlocal commentstring='\ %s
  autocmd! FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
  autocmd! FileType xpm set nowrap

  autocmd! Syntax c,cpp,php,perl setlocal foldmethod=syntax | normal zM
  autocmd! Syntax javascript,vim setlocal foldmethod=marker | normal zM
  autocmd! Syntax xml,html,xhtml setlocal foldmethod=indent | normal zM

  " TODO: Not happy with this
  " autocmd! Syntax c,cpp,javascript,php,java,xml,html,xhtml setlocal foldmethod=syntax
  " autocmd! Syntax c,cpp,javascript,php,xml,html,xhtml,perl normal zR

  autocmd! Syntax javascript setlocal makeprg=yeoman\ build

  "}}}2

  " {{{2

  " This doesn't work all that well
  " autocmd! BufRead,BufNewFile *.js setlocal makeprg=yeoman\ build
  autocmd! BufRead,BufNewFile *.json setlocal equalprg=python\ -mjson.tool\ 2>/dev/null 
  autocmd! FileType json setlocal equalprg=python\ -mjson.tool\ 2>/dev/null 

  " }}}2

augroup END 

" }}}1

" {{{1

augroup misc 

  " {{{2

  autocmd! BufEnter * if exists('b:winview') | call winrestview(b:winview) | endif
  autocmd! BufLeave * let b:winview = winsaveview()
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

" {{{1
augroup json_autocmd 

  " {{{2
  autocmd! FileType json set autoindent 
  autocmd! FileType json set expandtab 
  autocmd! FileType json set foldmethod=syntax 
  autocmd! FileType json set formatoptions=tcq2l 
  autocmd! FileType json set softtabstop=2 tabstop=2 
  autocmd! FileType json set textwidth=78 shiftwidth=2 
  " }}}2

augroup END 
" }}}1

" Dead {{{1

" augroup vimrc_autocmds
"   autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"   autocmd BufEnter * match OverLength /\%82v/
" augroup END

"autocmd BufReadPre * setlocal foldmethod=indent
"autocmd BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"autocmd BufWinEnter *.* if expand("%") != "" | loadview | endif
"autocmd BufWinLve *.* if expand("%") != "" | mkview! | endif
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

