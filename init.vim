" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'justinmk/vim-sneak'
Plug 'ThePrimeagen/vim-be-good'
call plug#end()

" Basic settings
colorscheme onedark
filetype plugin on
syntax on

"Enable mouse
set mouse=a

" Relative line numbering
set relativenumber

" yank to system keyboard
set clipboard=unnamedplus

set ignorecase
set smartcase
set tabstop=2 shiftwidth=2 expandtab
set number
set wrap
set linebreak
set nolist
set cursorline
" set autoindent
" set smartindent

highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey

" map jj to escape
inoremap jj <Esc>

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

"Nerd Tree settings
map <C-n> :NERDTreeToggle<CR>
" autocmd vimenter * NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1

"Prettier format on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Airline theme
let g:airline_theme='onedark'
"airlinefonts
let g:airline_powerline_fonts = 1
" remove the encoding part
let g:airline_section_y=''
" remove separators for empty sections
let g:airline_skip_empty_sections = 1



" stuff for coc below
" ------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
      inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

      function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
      endfunction

      " Use <c-space> to trigger completion.
      inoremap <silent><expr> <c-space> coc#refresh()

      " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
      " Coc only does snippet and additional edit on confirm.
      inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
      " Or use `complete_info` if your vim support it, like:
      " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

      " Use `[g` and `]g` to navigate diagnostics
      nmap <silent> [g <Plug>(coc-diagnostic-prev)
      nmap <silent> ]g <Plug>(coc-diagnostic-next)

      " Remap keys for gotos
      nmap <silent> gd <Plug>(coc-definition)
      nmap <silent> gy <Plug>(coc-type-definition)
      nmap <silent> gi <Plug>(coc-implementation)
      nmap <silent> gr <Plug>(coc-references)

      " Use K to show documentation in preview window
      nnoremap <silent> K :call <SID>show_documentation()<CR>

      function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
          else
            call CocAction('doHover')
          endif
        endfunction

        " Highlight symbol under cursor on CursorHold
        autocmd CursorHold * silent call CocActionAsync('highlight')

        " Remap for rename current word
        nmap <leader>rn <Plug>(coc-rename)

        " Remap for format selected region
        xmap <leader>f  <Plug>(coc-format-selected)
        nmap <leader>f  <Plug>(coc-format-selected)

        augroup mygroup
          autocmd!
          " Setup formatexpr specified filetype(s).
          autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
            " Update signature help on jump placeholder
            autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
            augroup end

            " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
            xmap <leader>a  <Plug>(coc-codeaction-selected)
            nmap <leader>a  <Plug>(coc-codeaction-selected)

            " Remap for do codeAction of current line
            nmap <leader>ac  <Plug>(coc-codeaction)
            " Fix autofix problem of current line
            nmap <leader>qf  <Plug>(coc-fix-current)

            " Create mappings for function text object, requires document symbols feature of languageserver.
            xmap if <Plug>(coc-funcobj-i)
            xmap af <Plug>(coc-funcobj-a)
            omap if <Plug>(coc-funcobj-i)
            omap af <Plug>(coc-funcobj-a)

            " Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
            " nmap <silent> <TAB> <Plug>(coc-range-select)
            " xmap <silent> <TAB> <Plug>(coc-range-select)

            " Use `:Format` to format current buffer
            command! -nargs=0 Format :call CocAction('format')

            " Use `:Fold` to fold current buffer
            command! -nargs=? Fold :call     CocAction('fold', <f-args>)

            " use `:OR` for organize import of current buffer
            command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

            " Add status line support, for integration with other plugin, checkout `:h coc-status`
            set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

            " Using CocList
            " Show all diagnostics
            nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
            " Manage extensions
            nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
            " Show commands
            nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
            " Find symbol of current document
            nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
            " Search workspace symbols
            nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
            " Do default action for next item.
            nnoremap <silent> <space>j  :<C-u>CocNext<CR>
            " Do default action for previous item.
            nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
            " Resume latest coc list
            nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
            " ctrl + p to launch CocList files
            nnoremap <silent> <C-p> :<c-u>CocList files<cr>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" coc auto indent and close bracket
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
