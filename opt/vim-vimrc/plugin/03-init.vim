
" denite {{{

" filters {{{

" call denite#filters#matcher_default#use(['matcher_fuzzy'])

" }}}

" Patterns to ignore {{{

let patterns = []

" TODO: Get this list from lines in a file instead.

" let patterns += [ '\.config/' ]
" let patterns += [ '\^..*/$' ]
" let patterns += [ '^\.' ]
" let patterns += [ '^\.*$' ]

let patterns += [ '/3rdParty/' ]
let patterns += [ '/PublishProfiles/' ]
let patterns += [ '/bin/' ]
let patterns += [ '/bower_components/' ]
let patterns += [ '/libs/Bootstrap' ]
let patterns += [ '/libs/FontAwesome' ]
let patterns += [ '/libs/Telerik/KendoUI/' ]
let patterns += [ '/node_modules/' ]
let patterns += [ '/npm_packages/' ]
let patterns += [ '/obj/' ]
let patterns += [ '/packages/' ]
let patterns += [ 'AUTHORS' ]
let patterns += [ 'Agisoft/' ]
let patterns += [ 'COPYING' ]
let patterns += [ 'GERYC/' ]
let patterns += [ 'Google/' ]
let patterns += [ 'ImageMagick/' ]
let patterns += [ 'LICENSE$' ]
let patterns += [ 'NuGet/' ]
let patterns += [ 'PCSX2/' ]
let patterns += [ 'PianoBooster/' ]
let patterns += [ 'Popcorn-Time/' ]
let patterns += [ 'QtEmu/' ]
let patterns += [ 'Rygel/' ]
let patterns += [ 'TemporaryGeneratedFile' ]
let patterns += [ 'Thunar/' ]
let patterns += [ 'WarThunder/' ]
let patterns += [ '\.FLAC$' ]
let patterns += [ '\.HamsiApps/' ]
let patterns += [ '\.JPG$' ]
let patterns += [ '\.Skype/' ]
let patterns += [ '\.Trash/' ]
let patterns += [ '\.VirtualBox/' ]
let patterns += [ '\.abgx360/' ]
let patterns += [ '\.abook/' ]
let patterns += [ '\.accurip$' ]
let patterns += [ '\.alsaplayer/' ]
let patterns += [ '\.ape$' ]
let patterns += [ '\.audacity-data/' ]
let patterns += [ '\.avi$' ]
let patterns += [ '\.avidemux/' ]
let patterns += [ '\.bin$' ]
let patterns += [ '\.bitcoin/' ]
let patterns += [ '\.bmp$' ]
let patterns += [ '\.bower/' ]
let patterns += [ '\.buddi/' ]
let patterns += [ '\.buoh/' ]
let patterns += [ '\.cabal/' ]
let patterns += [ '\.cache-3$' ]
let patterns += [ '\.calcurse/' ]
let patterns += [ '\.canto-ng/' ]
let patterns += [ '\.cmus/' ]
let patterns += [ '\.config/MonoDevelop.*/' ]
let patterns += [ '\.config/Skype/' ]
let patterns += [ '\.config/chromium/' ]
let patterns += [ '\.config/headphones/' ]
let patterns += [ '\.config/higan/' ]
let patterns += [ '\.config/sonata/' ]
let patterns += [ '\.couchpotato/' ]
let patterns += [ '\.cpan/' ]
let patterns += [ '\.cr3/' ]
let patterns += [ '\.ctl$' ]
let patterns += [ '\.cue$' ]
let patterns += [ '\.dat$' ]
let patterns += [ '\.data/gvfs-metadata/' ]
let patterns += [ '\.db$' ]
let patterns += [ '\.dbus/' ]
let patterns += [ '\.dll$' ]
let patterns += [ '\.dll\.config$' ]
let patterns += [ '\.doc$' ]
let patterns += [ '\.docx$' ]
let patterns += [ '\.dolphin-emu/' ]
let patterns += [ '\.dosbox/' ]
let patterns += [ '\.dsv$' ]
let patterns += [ '\.dts$' ]
let patterns += [ '\.elc$' ]
let patterns += [ '\.electricsheep/' ]
let patterns += [ '\.elinks/globhist\.tmp.*$' ]
let patterns += [ '\.emacs-jabber/' ]
let patterns += [ '\.emulationstation/' ]
let patterns += [ '\.eot$' ]
let patterns += [ '\.epd$' ]
let patterns += [ '\.epsxe/' ]
let patterns += [ '\.epub$' ]
let patterns += [ '\.fc0$' ]
let patterns += [ '\.fcs$' ]
let patterns += [ '\.ffp$' ]
let patterns += [ '\.fltk/' ]
let patterns += [ '\.forever/' ]
let patterns += [ '\.freerdp/' ]
let patterns += [ '\.freetalk/' ]
let patterns += [ '\.fretsonfire/' ]
let patterns += [ '\.gconf/' ]
let patterns += [ '\.gens/' ]
let patterns += [ '\.gftp/' ]
let patterns += [ '\.ghc/' ]
let patterns += [ '\.gif$' ]
let patterns += [ '\.gimp.*/' ]
let patterns += [ '\.git/' ]
let patterns += [ '\.gitolite/' ]
let patterns += [ '\.gnome/' ]
let patterns += [ '\.gnome2/' ]
let patterns += [ '\.gnupg/' ]
let patterns += [ '\.googleearth/' ]
let patterns += [ '\.headphones/' ]
let patterns += [ '\.heroku/' ]
let patterns += [ '\.hplip/' ]
let patterns += [ '\.ico$' ]
let patterns += [ '\.icons/' ]
let patterns += [ '\.irssi/' ]
let patterns += [ '\.java/' ]
let patterns += [ '\.jpeg$' ]
let patterns += [ '\.jpg$' ]
let patterns += [ '\.jspm/' ]
let patterns += [ '\.karaf/' ]
let patterns += [ '\.kde4/' ]
let patterns += [ '\.ko$' ]
let patterns += [ '\.kodi/' ]
let patterns += [ '\.links/links.his' ]
let patterns += [ '\.local/share/' ]
let patterns += [ '\.local/share/Steam/ubuntu12_32/' ]
let patterns += [ '\.local/share/applications/' ]
let patterns += [ '\.local/share/cool-retro-term/' ]
let patterns += [ '\.local/share/gvfs-metadata/' ]
let patterns += [ '\.log$' ]
let patterns += [ '\.logs/' ]
let patterns += [ '\.lyrics/' ]
let patterns += [ '\.m3u$' ]
let patterns += [ '\.m3u8$' ]
let patterns += [ '\.m4a$' ]
let patterns += [ '\.mbx$' ]
let patterns += [ '\.md5$' ]
let patterns += [ '\.mdb$' ]
let patterns += [ '\.mid$' ]
let patterns += [ '\.min\.css$' ]
let patterns += [ '\.min\.css\.map$' ]
let patterns += [ '\.min\.js$' ]
let patterns += [ '\.min\.js\.map$' ]
let patterns += [ '\.mkv$' ]
let patterns += [ '\.mobi$' ]
let patterns += [ '\.mp2$' ]
let patterns += [ '\.mp3$' ]
let patterns += [ '\.mp4$' ]
let patterns += [ '\.nestopia/' ]
let patterns += [ '\.nfo$' ]
let patterns += [ '\.node_shell/' ]
let patterns += [ '\.npm/' ]
let patterns += [ '\.ogg$' ]
let patterns += [ '\.p2p$' ]
let patterns += [ '\.pSX/' ]
let patterns += [ '\.part$' ]
let patterns += [ '\.pbm$' ]
let patterns += [ '\.pdb$' ]
let patterns += [ '\.pdf$' ]
let patterns += [ '\.pgn$' ]
let patterns += [ '\.pid$' ]
let patterns += [ '\.pip/' ]
let patterns += [ '\.pls$' ]
let patterns += [ '\.png$' ]
let patterns += [ '\.pokerth/' ]
let patterns += [ '\.ppt$' ]
let patterns += [ '\.prfl$' ]
let patterns += [ '\.puNES/' ]
let patterns += [ '\.putty/' ]
let patterns += [ '\.qmotion/' ]
let patterns += [ '\.qt/' ]
let patterns += [ '\.rar$' ]
let patterns += [ '\.rcp$' ]
let patterns += [ '\.remmina/' ]
let patterns += [ '\.rnc$' ]
let patterns += [ '\.sav$' ]
let patterns += [ '\.sfk$' ]
let patterns += [ '\.sfv$' ]
let patterns += [ '\.sickbeard/' ]
let patterns += [ '\.slime/' ]
let patterns += [ '\.so$' ]
let patterns += [ '\.solfege/' ]
let patterns += [ '\.srt$' ]
let patterns += [ '\.ssh/' ]
let patterns += [ '\.steam/' ]
let patterns += [ '\.sub$' ]
let patterns += [ '\.tbn$' ]
let patterns += [ '\.tmd$' ]
let patterns += [ '\.tmp_.*$' ]
let patterns += [ '\.trashinfo$' ]
let patterns += [ '\.ttf$' ]
let patterns += [ '\.unison/' ]
let patterns += [ '\.vifm/' ]
let patterns += [ '\.w3m/' ]
let patterns += [ '\.wav$' ]
let patterns += [ '\.weechat/' ]
let patterns += [ '\.wma$' ]
let patterns += [ '\.wmv$' ]
let patterns += [ '\.woff$' ]
let patterns += [ '\.wps$' ]
let patterns += [ '\.xbm$' ]
let patterns += [ '\.xls$' ]
let patterns += [ '\.xpm$' ]
let patterns += [ '\.xps$' ]
let patterns += [ '\.zip$' ]
let patterns += [ '\.zwc$' ]
let patterns += [ '\Trash/' ]
let patterns += [ '\cache/' ]
let patterns += [ '.cache$' ]
let patterns += [ 'ananke/' ]
let patterns += [ 'antimicro/' ]
let patterns += [ 'archon/' ]
let patterns += [ 'ardour3/' ]
let patterns += [ 'audacious/' ]
let patterns += [ 'autopass/' ]
let patterns += [ 'autostart/' ]
let patterns += [ 'calibre/' ]
let patterns += [ 'chromium-dev/' ]
let patterns += [ 'clerk/' ]
let patterns += [ 'client175/' ]
let patterns += [ 'configstore/' ]
let patterns += [ 'deluge/' ]
let patterns += [ 'desktop\.ini' ]
let patterns += [ 'dwb/' ]
let patterns += [ 'eliot/' ]
let patterns += [ 'epdfview/' ]
let patterns += [ 'geany/' ]
let patterns += [ 'git-annex/' ]
let patterns += [ 'gnome-sudoku/' ]
let patterns += [ 'google-chrome-beta/' ]
let patterns += [ 'google-chrome-unstable/' ]
let patterns += [ 'google-chrome/' ]
let patterns += [ 'google-googletalkplugin/' ]
let patterns += [ 'googlecl/' ]
let patterns += [ 'gpick/' ]
let patterns += [ 'gqrx/' ]
let patterns += [ 'gtk-2.0/' ]
let patterns += [ 'gtk-3.0/' ]
let patterns += [ 'guvcview2/' ]
let patterns += [ 'htop/' ]
let patterns += [ 'ibus/' ]
let patterns += [ 'inkscape/' ]
let patterns += [ 'jspm_packages/' ]
let patterns += [ 'libreoffice/' ]
let patterns += [ 'libvirt/' ]
let patterns += [ 'lirc/' ]
let patterns += [ 'lottanzb/' ]
let patterns += [ 'mc/' ]
let patterns += [ 'menus/' ]
let patterns += [ 'mkvtoolnix/' ]
let patterns += [ 'mupen64plus/' ]
let patterns += [ 'nitrogen/' ]
let patterns += [ 'nohup\.out$' ]
let patterns += [ 'phoenix/' ]
let patterns += [ 'projectM/' ]
let patterns += [ 'rncbc.org/' ]
let patterns += [ 'sabnzbd/' ]
let patterns += [ 'smplayer/' ]
let patterns += [ 'sonic-visualiser/' ]
let patterns += [ 'sqlitebrowser/' ]
let patterns += [ 'transmission/resume/' ]
let patterns += [ 'transmission/torrents/' ]
let patterns += [ 'vmpk.sourceforge.net/' ]
let patterns += [ 'watch_later/' ]
let patterns += [ 'xfce4/' ]
let patterns += [ 'xmms2/' ]
let patterns += [ 'youtube-viewer/' ]

let pattern = '\(' . join(patterns, '\|') . '\)'

" call denite#custom#source('file_rec, file_rec/async', 'ignore_pattern', pattern)

unlet patterns pattern

" }}}

" setup default sources {{{

" call denite#custom#source(
"   \ 'file, file_rec, file_rec/async, grep, neomru/file, neomru/directory',
"   \ 'max_candidates',
"   \ 10000)

" call denite#custom#source(
"   \ 'neomru/file', 'matchers',
"   \ ['matcher_project_files', 'matcher_fuzzy'])

" call denite#custom#source('file, file_rec, file_rec/async', 'matchers',
"   \ ['matcher_project_ignore_files', 'converter_relative_word', 'matcher_fuzzy'])

" call denite#custom#source('file_mru', 'matchers',
"   \ ['matcher_project_files', 'matcher_fuzzy', 'matcher_ignore_globs'])

" call denite#custom#source('buffer', 'matchers', ['matcher_default', 'matcher_hide_current_file'])
"
" call denite#custom#source('buffer', 'matchers', ['matcher_fuzzy', 'matcher_hide_current_file'])

call denite#custom#var('file/rec', 'command',                                                                                                                                                                                                           
  \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
  \ [ '.git/', '.ropeproject/', '__pycache__/',
  \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '*.cache', 'tmp/cache/'
  \ ])

" if exists('*s:denite_settings')

if executable('pt')
  let g:denite_source_grep_command = 'pt'
  let g:denite_source_grep_default_opts = '--nogroup --nocolor'
  let g:denite_source_grep_recursive_opt = ''
  let g:denite_source_grep_encoding = 'utf-8'
endif

autocmd FileType denite call s:denite_settings()

" endif

function! s:denite_settings()

" {{{

  " TODO: Should not wrap bottom/top on denite buffers

  " config {{{

	let g:denite_prompt = ''
  let b:SuperTabDisabled = 1
  let g:denite_converter_file_directory_width = 90
  let g:denite_kind_jump_list_after_jump_scroll = 50
  let g:denite_matcher_fuzy_max_input_length = 200
  let g:denite_source_history_yank_enable = 1
  let g:denite_source_line_enable_highlight = 0

  " Dead {{{
  
	" let g:denite_abbr_highlight = 'TabLine'
	" let g:denite_cursor_line_highlight = 'TabLineSel'
  " let g:denite_source_rec_async_command = 'ag --skip-vcs-ignores --silent --nocolor --nogroup -g ""'

  " }}}

  " }}}

  " mappings {{{

  " new defaults at: /home/chris/.config/vim/bundle/denite.nvim/rplugin/python3/denite/ui/action.py

  " imap <buffer> <C-j> <Plug>(denite_do_default_action)
  " nnoremap <buffer> <C-j> <Plug>(denite_do_default_action)
  " imap <buffer> <C-g> <Plug>(denite_exit)
  " nnoremap <buffer> <C-n> <Plug>(denite_select_next_line)
  " nnoremap <buffer> <C-p> <Plug>(denite_previous_next_line)

  " }}}

  " sources {{{

  " call denite#custom#source(
  "   \ 'neomru/file', 'matchers',
  "   \ ['matcher_project_files', 'matcher_fuzzy'])

	" call denite#custom#profile('default', 'context', {
  "   \   'smartcase': 1,
  "   \   'ignorecase': 1,
  "   \ })

  " call denite#custom#profile('files', 'substitute_patterns', {
  "   \ 'pattern' : '^\.v/',
  "   \ 'subst' : [expand('~/.vim/'),
  "   \   denite#util#substitute_path_separator($HOME)
  "   \       . '/.bundle/*/'],
  "   \ 'priority' : 1000,
  "   \ })

  " Dead {{{

  " call denite#custom#source('file,file/new,buffer,file_rec,file_rec/async', 'ignore_pattern', '\(nohup\.out$|\.jspm\)')

  " }}}

  " }}}

  " Dead {{{

  " Enable navigation with control-j and control-k in insert mode {{{ 

  " imap <buffer> <C-j> <Plug>(denite_do_default_action)
  " imap <buffer> <C-j> <Plug>(denite_select_next_line)
  " imap <buffer> <C-k> <Plug>(denite_select_previous_line)
  " imap <buffer> <C-q> <Plug>(denite_exit)
  " nnoremap <leader>p :denite file_rec/async<cr>
  " nnoremap <silent><buffer> <C-j> <Plug>(denite_do_default_action)

  " }}}

  " }}}

" }}}

endfunction

" }}}

" 24-bit colors {{{

if has('termtruecolor')

" let &t_8f="\e[38;2;%ld;%ld;%ldm"
" let &t_8b="\e[48;2;%ld;%ld;%ldm"
" set guicolors

if &term =~ '^screen'

endif

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

endif

" }}}

" highlight {{{

" highlight Visual term=reverse ctermbg=7 guibg=LightGrey
" highlight SpellBad term=NONE cterm=reverse ctermbg=12 ctermfg=17 
" highlight SpellCap term=NONE cterm=reverse ctermbg=12 ctermfg=17 
" highlight SpellLocal term=NONE cterm=reverse ctermbg=12 ctermfg=17
" highlight SpellRare term=NONE cterm=reverse ctermbg=12 ctermfg=17
" highlight Visual term=NONE cterm=reverse ctermbg=12 ctermfg=17
" highlight Search term=NONE cterm=reverse ctermbg=12 ctermfg=17

" highlight IncSearch term=NONE cterm=reverse ctermbg=12 ctermfg=17
" highlight MatchParen term=NONE cterm=reverse ctermbg=12 ctermfg=17
" highlight StatusLine term=NONE cterm=reverse ctermbg=12 ctermfg=17
" highlight StatusLineNC term=NONE cterm=reverse ctermbg=12 ctermfg=17
" highlight TabLineFill term=NONE cterm=reverse ctermbg=12 ctermfg=17
" highlight VertSplit term=NONE cterm=reverse ctermbg=12 ctermfg=17

" }}}

" Dead {{{

" call denite#custom#source('file_rec,file_rec/async', 'max_candidates', 0)

" Not seeing anything?  Clear denite's cache with ':normal <C-l>'.

" call denite#custom#source('file,file/new,buffer,file_rec', 'matchers', [ 'matcher_context', 'matcher_regexp', 'matcher_fuzzy' ])
" call denite#custom#source('file,file/new,buffer,file_rec,file_rec/async', 'matchers', [ 'matcher_context', 'matcher_fuzzy'])
" }}}

" }}}

" }}}

" Dead {{{

" nmap <ScrollWheelUp> <C-Y>
" nmap <ScrollWheelDown> <space>

" undefined user functions {{{

" An attempt at handling user functions that are not defined.  Left at an
" impasse.

" try
"   execute ':Git'
" catch /^Vim\%((\a\+)\)\=:E492/
" catch /^Vim\%((\a\+)\)\=:E464/
"   " echo 'caught' v:exception
" finally
" endtry

" }}}

" }}}

