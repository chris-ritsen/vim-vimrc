
set nocompatible

source $VIM_CONFIG_DIR/plugins/pathogen/autoload/pathogen.vim

execute pathogen#infect('bundle/{}', "~/.config/vim/bundle/{}")
execute pathogen#helptags()

syntax on
filetype plugin indent on

