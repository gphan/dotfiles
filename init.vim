set nocompatible
filetype off

" Setup Vundle.vim
call plug#begin()

" List of plugins

" General all purpose plugins
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Color schemes
Plug 'altercation/vim-colors-solarized'

call plug#end()
filetype plugin indent on

" Map Leader
"let mapleader=","

" Quickly edit and reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Map <C-l> to hide search as well
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap <silent> <C-p> :<C-u>FZF<CR><C-l>

syntax on
set encoding=utf-8
set clipboard+=unnamed

" Visual
set background=dark
colorscheme solarized
let g:airline_theme='dark'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set ttyfast
set lazyredraw
set scrolloff=2
set hidden " Hide buffers instead of closing
set synmaxcol=2048
set history=1000
set undolevels=1000
set ruler
set title
set novisualbell
set noerrorbells

" Indentation
set autoindent
set smartindent
set copyindent
set smarttab
set expandtab
set shiftwidth=2
set tabstop=2

" Editor specific
set laststatus=2
set number
set numberwidth=4
set showmatch
set matchtime=2
set showmode
set showcmd
set cursorline
set wrap linebreak

" Wild Menu
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" Make backspace work
set bs=indent,eol,start

" No backup and no swap
set nobackup
set noswapfile

" Show whitespace
set list
set listchars=tab:>-,trail:·

" Bind shift tab to unindent
" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

autocmd filetype html,xml set listchars-=tab:>-
autocmd filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType c set nolist
autocmd BufRead,BufNewFile *.erl,*.es.*.hrl,*.yaws,*.xrl set expandtab

" Map jj to escape
imap jj <Esc>

" Stop jumping over lines
"nnoremap j gj
"nnoremap k gk

" Window control mapping
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l

" Add sudo trick
cmap w!! w !sudo tee % >/dev/null

" Map %% to current path
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

map <leader>] :bn<cr>
map <leader>[ :bp<cr>
map <leader>d :bd<cr>

nmap <leader>t :TagbarToggle<CR>
