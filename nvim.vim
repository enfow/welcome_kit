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
set statusline=%F
set laststatus=2
set smarttab
set cindent

set background=dark

if has("autocmd")
  filetype on
  " settings for js file only
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2
  autocmd FileType typescript setlocal ts=2 sts=2 sw=2
  autocmd FileType json setlocal ts=2 sts=2 sw=2
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2
  autocmd FileType markdown setlocal ts=2 sts=2 sw=2
endif

highlight ColorColumn ctermbg=0 guibg=lightgrey

" [Plugins]
" 1. gruvbox: vim color template
" 2. indentpython.vim: indentation for python
" 3. far.vim: Find And Replace
" 4. vim-gitgutter: check git status
" 5. YouCompleteMe: code completion engine for vim
" 6. vim-javascript: syntex highlight and indentation for js

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/indentpython.vim'
Plug 'brooth/far.vim'
Plug 'airblade/vim-gitgutter'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'tpope/vim-commentary'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'andrewstuart/vim-kubernetes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }  " check ~/.tern-project
" https://github.com/alvan/vim-closetag
Plug 'alvan/vim-closetag'
Plug 'Valloric/MatchTagAlways'
call plug#end()

" [Settings for js autocomplete]
" https://alldrops.info/posts/vim-drops/2018-04-08_javascript-autocompletion-on-vim/
filetype plugin on
set omnifunc=syntaxcomplete#Complete

let g:deoplete#enable_at_startup = 1

" [Settings for Plugins]
" 1. set colorscheme with gruvbox plugin
colorscheme gruvbox
" 2. enable Farundo cmd in brooth.far.vim plugin
let g:far#enable_undo=1
" 3. youCompleteme doesn't open up a split window with function definition
" https://stackoverflow.com/questions/38534285/vim-youcompleteme-plugin-opens-up-a-split-window-with-function-definition
" let g:ycm_autoclose_preview_window_after_insertion = 1
" 4. Jedi
let g:jedi#completions_enabled = 0
let g:deoplete#enable_at_startup = 1
" 5. Commentary
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>
" 6. vim-closetag options
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.ts'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'
" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1
" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'
" 7. MatchTagAlways options
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'javascript' : 1,
    \ 'javascript.jsx' : 1,
    \ 'typescript' : 1
    \ }

:command WQ wq
:command Wq wq
:command W w
:command Q q
:command Tabnew tabnew
:command Tanbew tabnew

" For vim-flake8
" To change flake8 options, go to ~/.config/flake8
"execute pathogen#infect()
"filetype plugin indent on
"autocmd BufWritePost *.py call flake8#Flake8()
"let g:flake8_show_in_file=0
"let g:flake8_show_quickfix=1
"let g:flake8_show_in_gutter=1
"let g:flake8_quickfix_height=7
"let g:flake8_max_markers=500


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

