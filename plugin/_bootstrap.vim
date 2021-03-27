
" bootstrap plugin bundler {{{

" pathogen {{{

execute pathogen#infect('bundle/{}', "$HOME/.config/vim/bundle/{}")
execute pathogen#helptags()

" }}}

" required settings {{{

" syntax on
filetype plugin indent on

" }}}

" }}}

