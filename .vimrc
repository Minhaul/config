" Vim-Plug Plugin List {{{
" https://github.com/junegunn/vim-plug
call plug#begin()

" Begin list of plugins
Plug 'https://github.com/tpope/vim-fugitive'
"Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug '/usr/local/opt/fzf'
Plug 'https://github.com/junegunn/fzf.vim'
"Plug 'https://github.com/Valloric/YouCompleteMe'
Plug 'https://github.com/chazy/cscope_maps'
Plug 'https://github.com/vim-scripts/Conque-GDB' ", { 'on': 'ConqueGdbExe' }
Plug 'https://github.com/rust-lang/rust.vim'
Plug 'https://github.com/Chiel92/vim-autoformat'

call plug#end()
" }}}
" FZF Settings {{{
map <C-p> :FZF<CR>

" Set the key bindings for different splits
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" fzf search pane positioning
" - down / up / left / right
let g:fzf_layout = { 'down': '~30%' }
" }}}
" CtrlP Settings (Deprecated) {{{
"let g:ctrlp_match_window = 'bottom,order:ttb'
"let g:ctrlp_switch_buffer = 0

"if executable('rg')
"  set grepprg=rg\ --color=never
"  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
"  let g:ctrlp_use_caching = 0
"endif
" }}}

" Remap ESC to jk
inoremap jk <ESC>

" Remap ESC to clear search highlighting
nnoremap <silent> <esc> :noh<cr><esc>

" Switch tabs with H and L
nnoremap H gT
nnoremap L gt

" Change comma to leader
let mapleader =","

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" set spell spelllang=en_us
" set spell

" Make sure this is vim, not vi
set nocompatible
set backspace=indent,eol,start

set ruler
set number
set relativenumber

set tabstop=2
set shiftwidth=2
set expandtab

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
" space open/closes folds
nnoremap <space> za

set modelines=1         " enable mode lines as last line of file

" Enable filetype detection and syntax highlighting
syntax on
colorscheme fast_railscasts
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

set clipboard+=unnamedplus

nnoremap <silent> <Leader>u :ConqueGdbCommand up 1<CR>
nnoremap <silent> <Leader>d :ConqueGdbCommand down 1<CR>

" vim:foldmethod=marker:foldlevel=0
