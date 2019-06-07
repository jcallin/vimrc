command! Vimrc :vs $MYVIMRC

"General
set nocompatible "Disable original VI compatibility
set nu
set hidden "Manage buffers mo betta
set wildmenu "Tab completion support
set shortmess=atI "Shorter warnings
set scrolloff=3 "Window has better context when scrolling beyond
set history=256 "Number of history items remembered
set timeoutlen=250 "Commands time out at 250ms
set clipboard=unnamed "Use the system clipboard
set ignorecase "These 2 enable case sense searching when caps are found
set smartcase
set showcmd "Show info at bottom about current command
set wildmenu "Autocomplete
set showmatch "Matches parenthesis
set showmode "Shows current mode at bottom of screen
set textwidth=0 "Don't wrap text
set wrap
set incsearch
set hlsearch "Highlight search results
set backspace=indent,eol,start " more powerful backspacing
set directory^=$HOME/.vim/swapfiles// " Put all swapfiles in one location
set undodir=~/.vim/undodir " Enable persistent undo on all edited files
set undofile
set visualbell
set noerrorbells
"Time between key presses for keymaps with >1 keys
set timeoutlen=250
" Add a line below the current line (can't add support for adding above)
nmap <CR> o<Esc>k
"Keyboard shortcuts
"Split with Ctrl + <j,k,l,h>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"s behaves like d without clobbering the default register
nnoremap s "_d

"Remove a line with -
map - dd
"Easy code block navigation
map [ [{
map ] ]}

" Allow jk combo to exit insert mode
inoremap jk <esc>
inoremap kj <esc>

"Faster viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"Enable folding with spacebar
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"Plugin management uses Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"Code folding
Plugin 'tmhedberg/SimpylFold'

"Theme
"Plugin 'hdima/python-syntax'
Plugin 'sjl/badwolf'

"PEP8 indentation for Python
"Plugin 'vim-scripts/indentpython.vim'

"Syntax checking
"Plugin 'scrooloose/syntastic'

"Python errthang
"Plugin 'klen/python-mode'

"Auto completion
"Bundle 'Valloric/YouCompleteMe'

"Status on bottom of screen
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

"Plugin Settings
"let g:pymode_options_max_line_length =
"Turn off rope in python-mode
let g:pymode_rope = 0
"Ignore undefined name errors raised by pyflakes
let g:pymode_lint_ignore = "E0602"

"Visual
syntax enable "Enable plugins to highlight
colorscheme badwolf "Set the colorscheme

"Abbreviations
abbr _sh #!/bin/bash
abbr _py #!/usr/bin/python
abbr _pl #!/usr/bin/perl

"Language specific settings
filetype plugin indent on
" Show existing tabs as 4 spaces width
set tabstop=4
" When indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

"Python
let python_highlight_all=1 "Prettify Python code
set encoding=utf-8 "Set encoding

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal g'\"" | endif " restore position in file upon reopen
au BufNewFile,BufReadPost *.log* :set filetype=messages " Log highlighting for .log files
