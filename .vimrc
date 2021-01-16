syntax on

set encoding=utf-8
set noerrorbells
set tabstop=4
set softtabstop=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set colorcolumn=80
set backspace=indent,eol,start

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-scripts/indentpython.vim'

call plug#end()

colorscheme gruvbox
set background=dark
set t_Co=256
