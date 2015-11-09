
" unite {{{

" filters {{{

call unite#filters#matcher_default#use(['matcher_fuzzy'])

" }}}

" Patterns to ignore {{{

let patterns = []

" TODO: Get this list from lines in a file instead.

" let patterns += [ '\.config/' ]
" let patterns += [ '\^..*/$' ]
" let patterns += [ '^\.' ]
" let patterns += [ '^\.*$' ]

let patterns += [ '/bower_components/' ]
let patterns += [ '/npm_packages/' ]
let patterns += [ 'LICENSE$' ]
let patterns += [ '\.FLAC$' ]
let patterns += [ '\.JPG$' ]
let patterns += [ '\.Trash/' ]
let patterns += [ '\.abook/' ]
let patterns += [ '\.accurip$' ]
let patterns += [ '\.ape$' ]
let patterns += [ '\.avi$' ]
let patterns += [ '\.bin$' ]
let patterns += [ '\.bmp$' ]
let patterns += [ '\.buoh/' ]
let patterns += [ '\.config/MonoDevelop.*/' ]
let patterns += [ '\.config/Skype/' ]
let patterns += [ 'TemporaryGeneratedFile' ]
let patterns += [ '/3rdParty/' ]
let patterns += [ '\.min\.js$' ]
let patterns += [ '\.min\.js\.map$' ]
let patterns += [ '\.min\.css$' ]
let patterns += [ '/packages/' ]
let patterns += [ '/node_modules/' ]
let patterns += [ '/PublishProfiles/' ]
let patterns += [ '/libs/FontAwesome' ]
let patterns += [ '/libs/Bootstrap' ]
let patterns += [ '/libs/Telerik/KendoUI/' ]
let patterns += [ '\.min\.css\.map$' ]
let patterns += [ '/obj/' ]
let patterns += [ '/bin/' ]
let patterns += [ '\.config/chromium/' ]
let patterns += [ '\.config/headphones/' ]
let patterns += [ '\.config/higan/' ]
let patterns += [ '\.config/sonata/' ]
let patterns += [ '\.cr3/' ]
let patterns += [ '\.cue$' ]
let patterns += [ '\.dat$' ]
let patterns += [ '\.db$' ]
let patterns += [ '\.dbus/' ]
let patterns += [ '\.dll$' ]
let patterns += [ '\.dll\.config$' ]
let patterns += [ '\.doc$' ]
let patterns += [ '\.docx$' ]
let patterns += [ '\.dts$' ]
let patterns += [ '\.emacs-jabber/' ]
let patterns += [ '\.emulationstation/' ]
let patterns += [ '\.eot$' ]
let patterns += [ '\.epsxe/' ]
let patterns += [ '\.epub$' ]
let patterns += [ '\.ffp$' ]
let patterns += [ '\.forever/' ]
let patterns += [ '\.freerdp/' ]
let patterns += [ '\.fretsonfire/' ]
let patterns += [ '\.gens/' ]
let patterns += [ '\.gif$' ]
let patterns += [ '\.gimp.*/' ]
let patterns += [ '\.git/' ]
let patterns += [ '\.gitolite/' ]
let patterns += [ '\.gnome/' ]
let patterns += [ '\.gnome2/' ]
let patterns += [ '\.googleearth/' ]
let patterns += [ '\.heroku/' ]
let patterns += [ '\.hplip/' ]
let patterns += [ '\.ico$' ]
let patterns += [ '\.icons/' ]
let patterns += [ '\.irssi/' ]
let patterns += [ '\.jpeg$' ]
let patterns += [ '\.jpg$' ]
let patterns += [ '\.jspm/' ]
let patterns += [ '\.ko$' ]
let patterns += [ '\.log$' ]
let patterns += [ '\.logs/' ]
let patterns += [ '\.lyrics/' ]
let patterns += [ '\.m3u$' ]
let patterns += [ '\.m3u8$' ]
let patterns += [ '\.m4a$' ]
let patterns += [ '\.md5$' ]
let patterns += [ '\.mdb$' ]
let patterns += [ '\.mid$' ]
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
let patterns += [ '\.pdb$' ]
let patterns += [ '\.pdf$' ]
let patterns += [ '\.pip/' ]
let patterns += [ '\.pls$' ]
let patterns += [ '\.png$' ]
let patterns += [ '\.pokerth/' ]
let patterns += [ '\.ppt$' ]
let patterns += [ '\.puNES/' ]
let patterns += [ '\.putty/' ]
let patterns += [ '\.qmotion/' ]
let patterns += [ '\.qt/' ]
let patterns += [ '\.rar$' ]
let patterns += [ '\.remmina/' ]
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
let patterns += [ '\.xls$' ]
let patterns += [ '\.xps$' ]
let patterns += [ '\.zip$' ]
let patterns += [ '\cache/' ]
let patterns += [ 'desktop\.ini' ]
let patterns += [ 'jspm_packages/' ]
let patterns += [ 'nohup\.out$' ]

let pattern = '\(' . join(patterns, '\|') . '\)'

call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', pattern)

unlet patterns pattern

" }}}

" setup default sources {{{

call unite#custom#source(
  \ 'file,file_rec,file_rec/async,grep,neomru/file,neomru/directory',
  \ 'max_candidates',
  \ 10000)

call unite#custom#source(
  \ 'neomru/file', 'matchers',
  \ ['matcher_project_files', 'matcher_fuzzy'])

call unite#custom#source('file,file_rec,file_rec/async', 'matchers',
  \ ['matcher_project_ignore_files', 'converter_relative_word', 'matcher_fuzzy'])

call unite#custom#source('file_mru', 'matchers',
  \ ['matcher_project_files', 'matcher_fuzzy'])

call unite#custom#source('buffer', 'matchers', ['matcher_default', 'matcher_hide_current_file'])
call unite#custom#source('buffer', 'matchers', ['matcher_fuzzj', 'matcher_hide_current_file'])

" if exists('*s:unite_settings')

autocmd FileType unite call s:unite_settings()

" endif

function! s:unite_settings()

" {{{

  " TODO: Should not wrap bottom/top on unite buffers

  " config {{{

	let g:unite_prompt = ''
  let b:SuperTabDisabled = 1
  let g:unite_converter_file_directory_width = 90
  let g:unite_kind_jump_list_after_jump_scroll = 50
  let g:unite_matcher_fuzy_max_input_length = 200
  let g:unite_source_history_yank_enable = 1
  let g:unite_source_line_enable_highlight = 0

  " Dead {{{
  
	" let g:unite_abbr_highlight = 'TabLine'
	" let g:unite_cursor_line_highlight = 'TabLineSel'
  " let g:unite_source_rec_async_command = 'ag --skip-vcs-ignores --silent --nocolor --nogroup -g ""'

  " }}}

  " }}}

  " mappings {{{

  imap <buffer> <C-j> <Plug>(unite_do_default_action)
  nnoremap <buffer> <C-j> <Plug>(unite_do_default_action)
  imap <buffer> <C-g> <Plug>(unite_exit)

  " }}}

  " sources {{{

  call unite#custom#source(
    \ 'neomru/file', 'matchers',
    \ ['matcher_project_files', 'matcher_fuzzy'])

	call unite#custom#profile('default', 'context', {
    \   'smartcase': 1,
    \   'ignorecase': 1,
    \ })

  call unite#custom#profile('files', 'substitute_patterns', {
    \ 'pattern' : '^\.v/',
    \ 'subst' : [expand('~/.vim/'),
    \   unite#util#substitute_path_separator($HOME)
    \       . '/.bundle/*/'],
    \ 'priority' : 1000,
    \ })

  " Dead {{{

  " call unite#custom#source('file,file/new,buffer,file_rec,file_rec/async', 'ignore_pattern', '\(nohup\.out$|\.jspm\)')

  " }}}

  " }}}

  " Dead {{{

  " Enable navigation with control-j and control-k in insert mode {{{ 

  " imap <buffer> <C-j> <Plug>(unite_do_default_action)
  " imap <buffer> <C-j> <Plug>(unite_select_next_line)
  " imap <buffer> <C-k> <Plug>(unite_select_previous_line)
  " imap <buffer> <C-q> <Plug>(unite_exit)
  " nnoremap <leader>p :Unite -no-split file_rec/async<cr>
  " nnoremap <silent><buffer> <C-j> <Plug>(unite_do_default_action)

  " }}}

  " }}}

" }}}

endfunction

" }}}

" Dead {{{

" call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 0)

" Not seeing anything?  Clear unite's cache with ':normal <C-l>'.

" call unite#custom#source('file,file/new,buffer,file_rec', 'matchers', [ 'matcher_context', 'matcher_regexp', 'matcher_fuzzy' ])
" call unite#custom#source('file,file/new,buffer,file_rec,file_rec/async', 'matchers', [ 'matcher_context', 'matcher_fuzzy'])
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
"   noremap <silent> <leader>y :wa! \| Git commit -am'updated everything blindly.' && git push<CR>
" catch /^Vim\%((\a\+)\)\=:E492/
" catch /^Vim\%((\a\+)\)\=:E464/
"   " echo 'caught' v:exception
" finally
" endtry

" }}}

" }}}

