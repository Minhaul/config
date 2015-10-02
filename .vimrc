" Remap ESC to jk
inoremap jk <ESC>

" Change space to leader
let mapleader = "\<Space>"

" Make sure this is vim, not vi
set nocompatible
set backspace=indent,eol,start

set ruler
set number

set tabstop=2
set shiftwidth=2
set expandtab
 
" Enable filetype detection and syntax hilighting
syntax on
filetype on
filetype indent on
filetype plugin on
 
" Indent as intelligently as vim knows how
set smartindent

set showcmd
