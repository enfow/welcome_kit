" *********************
" **     VIM KEYS    **
" *********************
"
" ======= Buffer =======
" :ls               : show buffer list
" :e [FILE]         : create new buffer
" :new              : create empty new buffer
" :bnext (:bn)      : go to next buffer
" :bprev (:bp)      : go to prev buffer
" :b[NUM]           : go to [NUM]th buffer 
" :bd               : delete current buffer
"
" ======= Window =======
" [MOVE]
" ctrl + w + arrow  : change window
" ctrl + w + w      : go to next window
" ctrl + w + p      : go to prev window
"
" [CREATE NEW WINDOW]
" ctrl + w + s      : new window on current buffer (horizontal)
" :split            : new window on current buffer (horizontal)
" ctrl + w + v      : new window on current buffer (vertical)
" :vsplit (:vsp)    : new window on current buffer (vertical)
"
" [CLOSE WINDOW]
" :close            : delete current window but keep it on buffer.
" :q                : delete current window but keep it on buffer.
" ctrl + w + x      : swap windows
"
" [ETC]
" ctrl + w + c      : delete current window but keep it on buffer.



syntax on

set splitright  " confif for window
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
set smarttab
set cindent
set background=dark
set statusline=%f

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

:command WQ wq
:command Wq wq
:command W w
:command Q q
:command E e
:command Tabnew tabnew
:command Tanbew tabnew

" [Plugins]
" 1. gruvbox: vim color template
" 2. indentpython.vim: indentation for python
" 3. far.vim: Find And Replace
" 4. vim-gitgutter: check git status
" 5. YouCompleteMe: code completion engine for vim
" 6. vim-javascript: syntex highlight and indentation for js
" 7. close-tag: add close tag like </tag> automatically for js

call plug#begin('~/.vim/plugged')
" gruvbox: vim color template
Plug 'morhetz/gruvbox'
" indentpython.vim: indentation for python
Plug 'vim-scripts/indentpython.vim'
" far.vim: Find And Replace
Plug 'brooth/far.vim'
" vim-gitgutter: check git status
Plug 'airblade/vim-gitgutter'
" jedi-vim: python auto-completion
" https://github.com/davidhalter/jedi-vim
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'tpope/vim-commentary'
" YouCompleteMe: code completion engine for vim
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" vim-javascript: syntex highlight and indentation for js
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'andrewstuart/vim-kubernetes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }  " check ~/.tern-project
" close-tag: add close tag like </tag> automatically for js
" https://github.com/alvan/vim-closetag
Plug 'alvan/vim-closetag'
Plug 'Valloric/MatchTagAlways'
" https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'  " nerdtree extension
Plug 'ryanoasis/vim-devicons' " nerdtree extension
" https://github.com/Yggdroot/indentLine
Plug 'Yggdroot/indentLine'
" https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'
" https://vimawesome.com/plugin/flake8-vim 
Plug 'andviro/flake8-vim'
" Vim-Airline
" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" telescope
Plug 'nvim-lua/plenary.nvim'  " dependency
Plug 'nvim-telescope/telescope.nvim'
" lazygit
Plug 'kdheepak/lazygit.nvim'
call plug#end()


" [Settings for Plugins]
" 1. set colorscheme with gruvbox plugin
colorscheme gruvbox

" 2. enable Farundo cmd in brooth.far.vim plugin
let g:far#enable_undo=1

" 3. youCompleteme doesn't open up a split window with function definition
" https://stackoverflow.com/questions/38534285/vim-youcompleteme-plugin-opens-up-a-split-window-with-function-definition
" let g:ycm_autoclose_preview_window_after_insertion = 1

" 4. Jedi
" https://github.com/davidhalter/jedi-vim
" <leader> = '\'
let g:jedi#completions_enabled = 1
let g:jedi#goto_command = "<leader>d"  "[GOTO DEFINITION COMMNAD]  go back with ctrl + o
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
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

" 8. NERDTree 
" use it with `\tr`
nnoremap <leader>tr :NERDTree<CR>
let NERDTreeMapActivateNode='<Right>'
let NERDTreeMapOpenInTab='<ENTER>'
" close vim when NERDTree window is the last window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" 9. indentLine
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'

" 10. flake8-vim
let g:PyFlakeOnWrite = 1

" 11. js autocomplete
" https://alldrops.info/posts/vim-drops/2018-04-08_javascript-autocompletion-on-vim/
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" 12. airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

":checkhealth telescope 13. deoplete
let g:deoplete#enable_at_startup = 1

" 14. telescope
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>ff :lua require('telescope.builtin').find_files{ find_command = {'rg', '--files', '--hidden', '-g', '!node_modules/**'} }<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" 15. For ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" 16. Lazy Git
nnoremap <silent> <leader>G :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installedc

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

