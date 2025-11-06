let mapleader=" "

set nu
set rnu
set ruler
set nocompatible
syntax enable
syntax on

set tabstop=2 
set shiftwidth=2
set expandtab
set softtabstop=0 smarttab
set autoindent
set breakindent
" set backup
set history=100

set showcmd
set incsearch
set cmdheight=0

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
filetype plugin on
filetype plugin indent on

" Theme
let g:airline_powerline_fonts = 1
set background=dark
colorscheme murphy
let g:gruvbox_contrast_dark = 'hard' 

map <Leader>s :w<CR>
map <Leader>h :nohlsearch<CR>
map <leader>y "+y

autocmd FileType swift map <Leader>r :w<CR>:!swiftc % && ./%:r<cr>

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

lua <<EOF

require("core.plugins")
require("core.plugin_config")

EOF

" Setup for vimwiki
"
" This file should be sourced from your .vimrc
"
"
" Set or override all/any options for personal wiki.
let wiki = {
\           'path': '~/vimwiki/',
\           'path_html': '~/vimwiki/HTML/',
\           'auto_export': 0,
\           'index': 'index',
\           'syntax': 'default',
\           'ext': '.wiki',
\           'auto_toc': 1,
\           'maxhi': 1,
\           'nested_syntaxes': {'python': 'python', 'js': 'javascript', 'c++': 'cpp'},
\           'list_margin': -1
\           }

" Make wiki the default vimwiki setup
let g:vimwiki_list = [wiki]
" When opening a directory containing a file with this name and default wiki
" extention, assume it is a vimwiki
let g:vimwiki_dir_link = ''
" Only treat .md files under a path in vimwiki_list as wiki files
let g:vimwiki_global_ext = 0

" Transparent background
highlight Normal guibg=none
highlight NormalNC guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NormalNC ctermbg=none
highlight NonText ctermbg=none

