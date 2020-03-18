set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80
set noshowmode
highlight ColorColumn ctermbg=DarkGrey
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting
" Start of plugins
call plug#begin(stdpath('data') . '/') " plugin install directory

" Deoplete autocomplete
" Plug 'Shougo/deoplete.nvim', { 'do': ':updateRemotePlugins'}
" let g:deoplete#enable_at_startup = 1

Plug 'jiangmiao/auto-pairs'

Plug 'morhetz/gruvbox'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-commentary'

" Lightline config
Plug 'itchyny/lightline.vim'
" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'fugitive': '%{FugitiveStatusline()}'
      \ },
      \ }

Plug 'enomsg/vim-haskellConcealPlus'
let hscoptions = "rw𝐒B𝐌𝐓𝐄QZNDlx"

Plug 'neovimhaskell/haskell-vim'
let g:haskell_indent_disable = 1
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_enable_backpack = 1
let g:haskell_classic_highlighting = 1 

Plug 'elmcast/elm-vim'

Plug 'rust-lang/rust.vim'

Plug 'Twinside/vim-hoogle'

Plug 'artur-shaik/vim-javacomplete2'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'dense-analysis/ale'
" let g:ale_linters = {
" \ 'javascript': ['eslint'],
" \ 'haskell': ['hlint']
" \}

" let g:ale_fixers = {
" \ 'haskell': ['stylish-haskell']
" \}

" let g:ale_fix_on_save = 1

"End of plugins
call plug#end()

" keybindings
" Shift tab in normal mode
nnoremap <S-Tab> << 
" Shift tab for insert mode
inoremap <S-Tab> <C-d>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
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

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
"End of keybindings
colorscheme gruvbox
