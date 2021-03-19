" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'christoomey/vim-tmux-navigator'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'jparise/vim-graphql'
Plug 'cespare/vim-toml'
Plug 'airblade/vim-gitgutter'
Plug 'leafoftree/vim-svelte-plugin'
Plug 'leafoftree/vim-vue-plugin'
Plug 'HerringtonDarkholme/yats'
Plug 'delphinus/vim-firestore'
Plug 'jxnblk/vim-mdx-js'
Plug 'knubie/vim-kitty-navigator'
Plug 'Stautob/vim-fish'
call plug#end()

" Set up onedark theme
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif


" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

syntax on
colorscheme onedark
filetype on
highlight Comment cterm=italic gui=italic
highlight htmlArg cterm=italic 

" Vue plugin settings
let g:vim_vue_plugin_load_full_syntax = 1
let g:vim_vue_plugin_use_sass = 1
let g:vim_vue_plugin_highlight_vue_attr = 1
let g:vim_vue_plugin_highlight_vue_keyword = 1

"Enable mouse
set mouse=a

" Relative line numbering
set relativenumber

" yank to system keyboard
set clipboard=unnamedplus

set smartcase
set tabstop=2 shiftwidth=2 expandtab
set number
set wrap
set textwidth=80
set linebreak
set nolist
set cursorline
set cursorcolumn
set scrolloff=10
set incsearch
" set colorcolumn=100
" set nohlsearch
" set autoindent
" set smartindent

highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey

" map jj to escape
inoremap jj <Esc>
inoremap kk <Esc>

" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" remap sneak to f
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" Alias replace all to S
nnoremap S :%s//gi<Left><Left><Left>

" Move selections up or down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '<+1<CR>gv-gv

" Fix indenting visual block
vmap < <gv
vmap > >gv

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" Airline theme
let g:airline_theme='onedark'
"airlinefonts
let g:airline_powerline_fonts = 1
" remove the encoding part
let g:airline_section_y=''
" remove separators for empty sections
let g:airline_skip_empty_sections = 1

" source coc settings
so $HOME/dotfiles/coc.vim


