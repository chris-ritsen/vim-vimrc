call plug#begin()
" (Linux/macOS): '~/.vim/plugged'

" Plug 'https://github.com/junegunn/vim-cfr'

Plug 'https://github.com/AndrewRadev/switch.vim'
Plug 'https://github.com/Shougo/context_filetype.vim'
Plug 'https://github.com/Shougo/vimproc.vim'
Plug 'https://github.com/cespare/vim-toml'
Plug 'https://github.com/christoomey/vim-sort-motion'
Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/digitaltoad/vim-pug'
Plug 'https://github.com/jamessan/vim-gnupg'
Plug 'https://github.com/kchmck/vim-coffee-script'
Plug 'https://github.com/leafOfTree/vim-svelte-plugin'
Plug 'https://github.com/leafOfTree/vim-vue-plugin'
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/michalbachowski/vim-wombat256mod'
Plug 'https://github.com/moll/vim-node'
Plug 'https://github.com/mustache/vim-mustache-handlebars'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/prabirshrestha/vim-lsp'
Plug 'https://github.com/preservim/nerdcommenter'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/slim-template/vim-slim'
Plug 'https://github.com/tmux-plugins/vim-tmux'
Plug 'https://github.com/tpope/vim-abolish'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-rbenv'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'https://github.com/tyru/caw.vim'
Plug 'https://github.com/vim-scripts/AdvancedSorters'
Plug 'https://github.com/vim-scripts/mru.vim'

if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()
