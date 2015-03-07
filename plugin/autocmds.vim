
" if v:version >= 700
" endif

autocmd BufReadPost *.jshintrc setf json
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal foldmethod=syntax
autocmd FileType xml setlocal foldmethod=syntax

augroup Binary           
  " TODO - Make this also work without matching filenames
  autocmd!
  " TODO - Check return value of xdd for errors
  autocmd! BufReadPre *.exe let &bin=1

  autocmd! BufReadPost *.exe if &bin | silent %!xxd -c 16
  autocmd! BufReadPost *.exe set ft=xxd | endif

  autocmd! BufWritePre *.exe if &bin | silent %!xxd -r -c 16
  autocmd! BufWritePre *.exe endif

  autocmd! BufWritePost *.exe if &bin | silent %!xxd -c 16
  autocmd! BufWritePost *.exe set nomod | endif
augroup END

augroup filetypes 

  " autocmd! BufEnter *.org call org#SetOrgFileType()
  " autocmd! BufRead,BufNewFile ~/.gnupg/* if &filetype == 'conf' | setfiletype gpg | endif 
  " autocmd! BufRead,BufWrite,BufWritePost,BufNewFile *.org 

  autocmd! BufEnter * if &filetype == "" | setlocal filetype=text | endif
  autocmd! BufNewFile,BufRead *.c,*.cpp set foldmethod=syntax
  autocmd! BufNewFile,BufRead *.svg set foldmethod=syntax
  autocmd! BufNewFile,BufRead *.vim set commentstring=" %s
  autocmd! BufNewFile,BufRead *.css,*.scss set foldmethod=marker fmr={,}
  autocmd! BufNewFile,BufRead *.ldg,*.ledger setf ledger
  autocmd! BufRead,BufNewFile *.aspx,*.asmx,*.ascx set filetype=aspnet 
  autocmd! BufRead,BufNewFile *.json set filetype=json
  autocmd! BufRead,BufNewFile *.css.map set filetype=json
  autocmd! BufRead,BufNewFile *.tex set filetype=tex
  autocmd! BufRead,BufNewFile .lynxrc set filetype=lynx
  autocmd! BufRead,BufNewFile .eslintrc set filetype=json
  autocmd! BufRead,BufNewFile .offlineimaprc setlocal commentstring=#\ %s
  autocmd! BufRead,BufNewFile /etc/nginx/nginx.conf,/usr/local/nginx/conf/* setfiletype nginx
  autocmd! BufRead,BufNewFile /etc/X11/xorg.conf.d/* setfiletype xf86conf
  autocmd! BufRead,BufNewFile /tmp/mutt* if &filetype == '' | setfiletype mail | endif 
  autocmd! BufRead,BufNewFile ~/.config/mailcap setlocal nowrap
  autocmd! BufRead,BufNewFile ~/.config/mutt/* if &filetype == '' | setfiletype muttrc | endif " would also like nowrap
  autocmd! BufRead,BufNewFile *.config/tmux/*,*.config/tmux/sessions/* setfiletype tmux
  autocmd! BufRead,BufNewFile ~/.irssi/config setfiletype conf
  autocmd! BufRead,BufNewFile ~/.mail/* if &filetype == '' | setfiletype mail | endif 
  autocmd! BufRead,BufNewFile ~/mail/* if &filetype == '' | setfiletype mail | endif 
  autocmd! BufRead,BufWrite *.inc,*.php,*.hs if ! &bin | silent! %s/\s\+$//ge | endif
  autocmd! BufRead,BufWrite *.inc,*.php,*.hs if ! &bin | silent! :%s/ \+\ze\t//ge | endif
  autocmd! BufReadPost *.css,*scss silent! g/base64.\+/normal zc " close base64 images
  autocmd! BufReadPre,FileReadPre *.gpg,*.asc set noswapfile
  autocmd! FileType apache setlocal commentstring=#\ %s
  autocmd! FileType css setlocal nowrap
  autocmd! FileType json setlocal nowrap
  autocmd! FileType lynx setlocal commentstring=#\ %s
  autocmd! FileType nginx setlocal commentstring=#\ %s
  autocmd! FileType fstab setlocal commentstring=#\ %s
  autocmd! FileType scss setlocal nowrap
  autocmd! FileType slrnrc setlocal commentstring=%\ %s
  autocmd! FileType svnannotate cmap <buffer> q bwipeout
  autocmd! FileType text setlocal commentstring=%s 
  autocmd! FileType haskell setlocal commentstring=--\ %s 
  autocmd! FileType text setlocal textwidth=78
  autocmd! FileType tmux setlocal commentstring=#\ %s
  autocmd! FileType vb setlocal commentstring='\ %s
  autocmd! FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
  autocmd! FileType xpm set nowrap
  autocmd! Syntax c,cpp,javascript,php,vim,java,xml,html,xhtml setlocal foldmethod=syntax
  autocmd! Syntax c,cpp,javascript,php,vim,xml,html,xhtml,perl normal zR
  autocmd! Syntax javascript setlocal makeprg=yeoman\ build

  " This doesn't work all that well
  autocmd! BufRead,BufNewFile *.js setlocal makeprg=yeoman\ build
  autocmd! BufRead,BufNewFile *.json setlocal equalprg=python\ -mjson.tool\ 2>/dev/null 
  autocmd! FileType json setlocal equalprg=python\ -mjson.tool\ 2>/dev/null 

augroup END 

augroup misc 

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

augroup END

augroup json_autocmd 

  autocmd! FileType json set autoindent 
  autocmd! FileType json set expandtab 
  autocmd! FileType json set foldmethod=syntax 
  autocmd! FileType json set formatoptions=tcq2l 
  autocmd! FileType json set softtabstop=2 tabstop=2 
  autocmd! FileType json set textwidth=78 shiftwidth=2 

augroup END 

" augroup vimrc_autocmds
"   autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"   autocmd BufEnter * match OverLength /\%82v.*/
" augroup END

"autocmd BufReadPre * setlocal foldmethod=indent
"autocmd BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"autocmd BufWinEnter *.* if expand("%") != "" | loadview | endif
"autocmd BufWinLve *.* if expand("%") != "" | mkview! | endif
"autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline

autocmd BufWritePre *.js :%s/\s\+$//e

