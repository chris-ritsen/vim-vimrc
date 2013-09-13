
set nocompatible

source ~/.config/vim/plugins/pathogen/autoload/pathogen.vim

execute pathogen#infect('bundle/{}', '~/.config/vim/bundle/{}')
execute pathogen#helptags()

syntax on
filetype plugin indent on

