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
Plug 'https://github.com/airblade/vim-gitgutter'

" Airline and themes
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'

" Colorschemes
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/altercation/vim-colors-solarized'

" Syntax Highlighting Extras
Plug 'https://github.com/ARM9/arm-syntax-vim'
Plug 'https://github.com/sheerun/vim-polyglot'

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
" Vim GitGutter Settings {{{
let g:gitgutter_max_signs = 5000
" }}}
" Airline Settings {{{
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0

let g:airline_theme='bubblegum'

" Don't show the current mode since airline shows it
set noshowmode
" }}}
" Cscope Settings {{{
set nocscopeverbose
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

" ConqueGdb Settings {{{
nnoremap <silent> <Leader>u :ConqueGdbCommand up 1<CR>
nnoremap <silent> <Leader>d :ConqueGdbCommand down 1<CR>
" }}}

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

set spell spelllang=en_us
set spell

" Make sure this is vim, not vi
set nocompatible
set backspace=indent,eol,start

" Highlight text past 100 characters
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkred guibg=#8B0000
  autocmd BufEnter * match OverLength /\%>100v.\+/
augroup END

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

" Set the update time to 100ms down from the default of some nonsense like 4s
set updatetime=100

" Colorscheme selection
set termguicolors
syntax on
"colorscheme fast_railscasts
colorscheme gruvbox
set background=dark

" Enable filetype detection
filetype on
filetype indent on
filetype plugin on

au BufNewFile,BufRead *.s,*.sx,*.S set filetype=arm " arm = armv6/7

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

"set clipboard+=unnamedplus

" vim:foldmethod=marker:foldlevel=0
