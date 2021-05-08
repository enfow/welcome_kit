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
set showmatch
set autoread
set autowrite
set ruler
set colorcolumn=80
set backspace=indent,eol,start
set hlsearch

set background=dark

highlight ColorColumn ctermbg=0 guibg=lightgrey

" [Plugins]
" 1. gruvbox: vim color template
" 2. indentpython.vim: indentation for python
" 3. far.vim: Find And Replace
" 4. vim-gitgutter: check git status
" 5. YouCompleteMe: code completion engine form vim
" 6. vim-javascript: syntex highlight and indentation for js

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/indentpython.vim'
Plug 'brooth/far.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'pangloss/vim-javascript'
call plug#end()

" [Settings for Plugins]
" 1. set colorscheme with gruvbox plugin
colorscheme gruvbox
" 2. enable Farundo cmd in brooth.far.vim plugin
let g:far#enable_undo=1
" 3. youCompleteme doesn't open up a split window with function definition
" https://stackoverflow.com/questions/38534285/vim-youcompleteme-plugin-opens-up-a-split-window-with-function-definition
let g:ycm_autoclose_preview_window_after_insertion = 1

:command WQ wq
:command Wq wq
:command W w
:command Q q

" [Resolve Problem]
" 1. The ycmd server SHUT DOWN (restart with :YcmRestartServer) ISSUE
"   -> If you use pyenv, then go to 2
"   -> https://github.com/ycm-core/YouCompleteMe/wiki/Troubleshooting-steps-for-ycmd-server-SHUT-DOWN
"  
" 2. Install ycmd with pyenv
"   -> https://github.com/ycm-core/YouCompleteMe/issues/759, comment of danieljaouen
"   -> 1. deactivate pyenv first: `pyenv local system`
"   -> 2. reinstall MacVim: `brew install MacVim`
"   -> 3. install ycmd with python 3: `python3 ~/.vim/plugged/YouCompleteMe/install.py`
"
