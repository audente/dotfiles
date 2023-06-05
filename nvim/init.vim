
set nu
set rnu
set ruler
set nocompatible
syntax enable
syntax on

set tabstop=2 shiftwidth=2 expandtab
set softtabstop=0 smarttab
set autoindent
set breakindent
" set backup
set history=100

set showcmd
set incsearch

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

let mapleader=" "

map <leader>s :w<CR>
map <leader>h :nohlsearch<CR>

autocmd FileType swift map <leader>r :w<CR>:!swiftc % && ./%:r<cr>

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


lua <<EOF

require("core.plugins")
require("core.plugin_config")

EOF
