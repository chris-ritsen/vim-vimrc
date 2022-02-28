
" let {{{1

" misc {{{2

let $GROFF_NO_SGR = 1
let @/ = ""
let MRU_Max_Entries = 400
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
let g:html5_aria_attributes_complete = 1
let g:html5_event_handler_attributes_complete = 1
let g:html5_microdata_attributes_complete = 1
let g:html5_rdfa_attributes_complete = 1
let g:html_indent_autotags = ""
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "zero"
let g:html_indent_style1 = "zero"
let g:loaded_matchparen=1
let g:mapleader = "\\"
let g:neocomplcache_enable_at_startup = 0
let g:netrw_http_cmd = "curl -sL -o"
let g:netrw_nogx = 1
let g:paredit_loaded = 1
let g:tex_flavor='latex'
let g:vcm_default_maps = 0
let mapleader = "\\"

" }}}2

" Switch.vim
let g:switch_mapping = ""


" omnisharp {{{

let g:OmniSharp_server_type = 'v1'
let g:OmniSharp_start_server = 1
let g:OmniSharp_timeout = 1

" }}}

" NERDTree {{{2

let g:NERDTreeHijackNetrw= 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 0
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeWinSize='18'

let g:NERDTreeIgnore = [
  \ '.cache$',
  \ '.dll$',
  \ '.eot$',
  \ '.gif$',
  \ '.ico$',
  \ '.min.js$',
  \ '.min.map$',
  \ '.mp3$',
  \ '.nupkg$',
  \ '.nuspec$',
  \ '.otf$',
  \ '.pdb$',
  \ '.png$',
  \ '.suo$',
  \ '.ttf$',
  \ '.vssscc$',
  \ '.wav$',
  \ '.woff$',
  \ '3rdParty',
  \ '\.csproj.user$',
  \ '\.csproj.vspscc$',
  \ '\.fixed\.svg$',
  \ '\.git/',
  \ '\.o$',
  \ '\.xkm$',
  \ '\.zwc$',
  \ 'bin.*',
  \ 'jspm_packages',
  \ 'node_modules',
  \ '__pycache__',
  \ 'nohup.out',
  \ 'obj.*'
  \ ]

" }}}2

" OmniCpp {{{2

let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_LocalSearchDecl = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_NamespaceSearch = 2
let OmniCpp_SelectFirstItem = 2
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1

" }}}2

" CommandT {{{2

let g:CommandTAcceptSelectionMap = [
  \ '<CR>',
  \ '<C-j>' 
  \ ]

let g:CommandTAcceptSelectionSplitMap = [
  \ '<C-CR>',
  \ '<C-s>' 
  \ ]

let g:CommandTAlwaysShowDotFiles = 1

let g:CommandTCancelMap = [
  \ '<C-x>',
  \ '<ESC>',
  \ '<C-c>'
  \ ]

let g:CommandTMaxCachedDirectories = 0
let g:CommandTMaxDepth = 15
let g:CommandTMaxFiles = 8000
let g:CommandTMaxHeight = 15
let g:CommandTScanDotDirectories = 1

let g:CommandTSelectNextMap = [
  \ '<C-e>',
  \ '<C-n>',
  \ '<Down>' 
  \ ]

let g:CommandTSelectPrevMap = [
  \ '<C-y>',
  \ '<C-p>',
  \ '<Up>' 
  \ ]

" }}}2

" Powerline {{{2

let b:did_ftplugin = 1
let g:Powerline_symbols = "compatible"
let g:Powerline_theme = "default"

" }}}2

" VCSCommand {{{2

let g:VCSCommandDeleteOnHide = 1

" }}}2

" Airline {{{2

let g:airline#extensions#csv#column_display = 'Number'
let g:airline_branch_empty_message = ''
let g:airline_branch_prefix = '⎇ '
let g:airline_detect_iminsert = 1
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1
let g:airline_detect_whitespace = 1
let g:airline_enable_branch = 1
let g:airline_enable_csv = 1
let g:airline_enable_syntastic = 1
let g:airline_enable_tagbar = 1
let g:airline_exclude_preview = 0
let g:airline_inactive_collapse = 1
let g:airline_left_sep = '>'
let g:airline_mode_map = {}
let g:airline_paste_symbol = '∥'
let g:airline_powerline_fonts = 0
let g:airline_right_sep = '<'
let g:airline_theme = 'dark'
let g:airline_variable_referenced_in_statusline = 'foo'
let g:airline_whitespace_symbol = 'Ξ'
let g:loaded_airline = 1

" }}}2

" CtrlP {{{2

" c-p is used to move up a line and keep the current column

let g:ctrlp_map = '<leader>p' 

" }}}2

" Gundo {{{2

let g:gundo_date_format = '%Y-%m-%dT%H:%M:%SZ'

" }}}2

" YouCompleteMe {{{2

let g:loaded_youcompleteme = 0

" }}}2

" slimv {{{2

let g:slimv_disable_lisp = 1
let g:slimv_lisp_loaded = 1
let g:slimv_loaded = 1
let g:slimv_scheme_loaded = 1

" }}}2

" sparkup {{{2

let g:sparkup = "sparkup"
let g:sparkupArgs = "--no-last-newline"
let g:sparkupExecuteMapping = ""
let g:sparkupNextMapping = ""

" }}}2

" syntastic {{{2

" general settings {{{

let g:syntastic_python_checkers=['flake8', 'pylint']
let g:syntastic_python_flake8_args='--ignore=W391,E121'
let g:syntastic_c_compiler_options = '-std=c11 -include stdio.h'
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_css_csslint_args = '--ignore box-sizing,unique-headings'
let g:syntastic_enable_signs = 1
let g:syntastic_exit_checks = 0
let g:syntastic_full_redraws = 1

" }}}

" mode map {{{

let g:syntastic_mode_map = {
  \ 'mode': 'active', 
  \ 'active_filetypes': [
  \ 'cs', 
  \ 'html',
  \ 'javascript',
  \ 'less',
  \ 'lisp',
  \ 'php',
  \ 'python',
  \ 'ruby',
  \ 'typescript',
  \ 'xml'
  \ ],
  \ 'passive_filetypes': [] 
  \ }

" }}}

" checkers {{{

let g:syntastic_ruby_checkers          = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec      = '/home/chris/.rbenv/shims/rubocop'

" cs checkers {{{

let g:syntastic_cs_checkers = [
  \ 'issues',
  \ 'mcs',
  \ 'semantic',
  \ 'syntax'   
  \ ]

" }}}

" typescript checkers {{{

let g:syntastic_typescript_tslint_exec = 'tslint'

let g:syntastic_typescript_checkers = [
  \ 'tslint'
  \ ]

  " \ 'eslint',
  " \ 'tsc',

" }}}

" html checkers {{{

let g:syntastic_html_tidy_exec = 'tidy'

let g:syntastic_html_checkers = [
  \ 'tidy'
  \ ]

" }}}

" javascript checkers {{{

let g:syntastic_javascript_eslint_exec = 'eslint'
let g:syntastic_javascript_eslint_args = '--env es6'
let g:syntastic_javascript_jshint_exec = 'jshint'
let g:syntastic_javascript_tidy_exec = 'tidy'

let g:syntastic_javascript_checkers = [
  \ 'eslint',
  \ 'jshint'
  \ ]

" }}}

" less checkers {{{

let g:syntastic_less_checkers = [
  \ 'lessc'
  \ ]

" }}}

" xml checkers {{{

let g:syntastic_xml_checkers = [
  \ 'xmllint'
  \ ]

" }}}

" }}}

" Dead {{{

" let g:syntastic_html_tidy_args = '-config /home/chris/.config/tidy/config'

" }}}

" }}}2

" tagbar {{{2

let g:tagbar_compact = 1
let g:tagbar_width = 30

" }}}2

" unite {{{2

if executable('ag')

  let g:unite_source_grep_command = 'ag'

  let g:unite_source_grep_default_opts =
  \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
  \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''

  let g:unite_source_grep_recursive_opt = ''

elseif executable('pt')

  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''

elseif executable('ack-grep')

  " Use ack in unite grep source.

  let g:unite_source_grep_command = 'ack-grep'

  let g:unite_source_grep_default_opts =
  \ '--no-heading --no-color -k -H'

  let g:unite_source_grep_recursive_opt = ''

endif

" let g:unite_source_history_yank_enable = 1
" let g:unite_source_rec_max_cache_files = 0
" let g:unite_source_rec_max_cache_files = 20000
" let g:unite_source_rec_min_cache_files = 100
" let g:unite_source_rec_unit = 2000

" }}}2

" vitality {{{2

let g:vitality_always_assume_iterm = 0
let g:vitality_fix_cursor = 1
let g:vitality_fix_focus = 1

" }}}2

" folding {{{2

let g:xml_syntax_folding = 1
let javaScript_fold = 1
let loaded_yankring = 170
let perl_fold = 1
let php_folding = 1
let r_syntax_folding = 1
let ruby_fold = 1
let sh_fold_enabled = 1
let vimsyn_folding = 'af'
let xml_syntax_folding = 1

" }}}2

" }}}1

let g:surround_no_insert_mappings = 0
let g:surround_no_mappings = 0
" let g:jsx_ext_required = 0
let g:vue_disable_pre_processors=1

" Dead code {{{1

" omnisharp {{{

" let g:OmniSharp_server_type = 'roslyn'
" let g:Omnisharp_server_config_name = '/home/chris/.config/vim/bundle/omnisharp-vim/server/config.json'

" command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" }}}

" }}}1

let g:ale_linters = {}
let g:ale_linters['text'] = ['proselint']
