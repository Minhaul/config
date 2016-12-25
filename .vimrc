" Remap ESC to jk
inoremap jk <ESC>

" Change space to leader
let mapleader ="\<Space>"

" Make sure this is vim, not vi
set nocompatible
set backspace=indent,eol,start

set ruler
set number
set relativenumber

set tabstop=2
set shiftwidth=2
set expandtab

" Uncomment if you want to use the railscasts color scheme
"colorscheme railscasts

" Enable filetype detection and syntax highlighting
syntax on
filetype on
filetype indent on
filetype plugin on

" Indent as intelligently as vim knows how
set smartindent

set showcmd

function! NumberToggle()
  if(&relativenumber == 1)
    set relativenumber!
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
