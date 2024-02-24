" Vim-Plug Plugin List {{{
" https://github.com/junegunn/vim-plug
call plug#begin()

" Begin list of plugins
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
source /usr/share/doc/fzf/examples/fzf.vim
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'chazy/cscope_maps'
"Plug 'vim-scripts/Conque-GDB' ", { 'on': 'ConqueGdbExe' }
Plug 'rust-lang/rust.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'ggandor/leap.nvim'
Plug 'numToStr/Comment.nvim'

" UI Changes
Plug 'nvim-tree/nvim-web-devicons' " Get font Caskaydia Mono (nerdfonts.com/font-downloads)
Plug 'echasnovski/mini.statusline', { 'branch': 'stable' }
Plug 'akinsho/bufferline.nvim', { 'tag': 'v4.*' }

" Git Plugins
Plug 'tpope/vim-fugitive'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lewis6991/gitsigns.nvim'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'

" Syntax Highlighting Extras
Plug 'ARM9/arm-syntax-vim'
Plug 'sheerun/vim-polyglot'

call plug#end()
" }}}
set termguicolors
" GitSigns Settings {{{
lua << EOF
require('gitsigns').setup {
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- Actions
    map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
    map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
    map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
    map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    -- map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
    map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    -- map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

    -- Text object
    map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
EOF
" }}}
" Web Devicons Settings {{{
lua << EOF
require'nvim-web-devicons'.setup {
  default = true;
}
EOF
" }}}
" Mini Statusline Settings {{{
lua << EOF
require('mini.statusline').setup()
EOF
" }}}
" NvimTree Settings {{{
lua << EOF
require'nvim-tree'.setup {
  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_cursor = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  view = {
    width = 30,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = false,
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
}
EOF

nnoremap <C-n> :NvimTreeToggle<CR>
" }}}
" BufferLine Settings {{{
lua << EOF
require("bufferline").setup {
  options = {
    mode = "tabs",
    numbers = "none",
    diagnostics = "coc",
    show_buffer_close_icons = false,
    separator_style = "slant",
  }
}
EOF
" }}}
" {{{ Leap Settings
lua require('leap').add_default_mappings()
" }}}
" {{{ Comment Settings
lua require('Comment').setup()
" }}}
" Deprecated Settings {{{
" Cscope Settings (Deprecated) {{{
"set nocscopeverbose
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
" FZF Settings (Deprecated) {{{
" map <C-p> :Files<CR>

" Set the key bindings for different splits
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-s': 'split',
"   \ 'ctrl-v': 'vsplit' }

" fzf search pane positioning
" - down / up / left / right
" let g:fzf_layout = { 'down': '~30%' }
" }}}
" Airline Settings (Deprecated) {{{
" let g:airline_powerline_fonts = 0

" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.maxlinenr = '㏑'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.spell = 'Ꞩ'
" let g:airline_symbols.notexists = 'Ɇ'
" let g:airline_symbols.whitespace = 'Ξ'
" 
" powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ''
" 
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_buffers = 0
" let g:airline#extensions#tabline#show_splits = 0
" let g:airline#extensions#tabline#show_tabs = 1
" let g:airline#extensions#tabline#show_tab_nr = 0
" let g:airline#extensions#tabline#show_tab_type = 0
" let g:airline#extensions#tabline#close_symbol = '×'
" let g:airline#extensions#tabline#show_close_button = 0
" 
" let g:airline_theme='bubblegum'

" Don't show the current mode since airline shows it
" set noshowmode
" }}}
" Vim GitGutter Settings (Deprecated) {{{
" let g:gitgutter_max_signs = 5000
" }}}
" }}}

" Remap ESC to tn
inoremap tn <ESC>

" Remap ESC to clear search highlighting
nnoremap <silent> <esc> :noh<cr><esc>

" Switch tabs with ctrl arrows
nnoremap <C-Left> :BufferLineCyclePrev<CR>
nnoremap <C-Right> :BufferLineCycleNext<CR>
" How move tabs?
"nnoremap <C-H> :BufferLineMovePrev<CR>
"nnoremap <C-L> :BufferLineMoveNext<CR>

" Change comma to leader
let mapleader =","

" ConqueGdb Settings {{{
nnoremap <silent> <Leader>u :ConqueGdbCommand up 1<CR>
nnoremap <silent> <Leader>d :ConqueGdbCommand down 1<CR>
let g:ConqueTerm_PyVersion = 3
" }}}
" Telescope Settings {{{
nnoremap <leader>t <cmd>Telescope<cr>
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
" }}}
" CoC Settings {{{
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use ctrl-j/k for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <C-j>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<C-j>" :
      \ coc#refresh()
inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"

" Make <CR> and <TAB> accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<TAB>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> ge :call CocAction('jumpDefinition')<CR>
nmap <silent> gd :call CocAction('jumpDefinition', 'split')<CR>
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
" Formatting Buffer
nmap <leader>f  <Plug>(coc-format)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" }}}

" Auto insert a closing brace after opening brace
inoremap { {}<ESC>i

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>y  "+y

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

set spell spelllang=en_us
set spell

" Make sure this is vim, not vi
set nocompatible
set backspace=indent,eol,start

" Highlight text past 100 characters
augroup vimrc_autocmds
  autocmd!
  autocmd BufEnter,WinEnter * highlight OverLength ctermbg=darkred guibg=#8B0000
  autocmd BufEnter,WinEnter * match OverLength /\%>100v.\+/
  autocmd FileType fzf match OverLength //
augroup END

set ruler
set number

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

"set clipboard+=unnamedplus

" vim:foldmethod=marker:foldlevel=0
