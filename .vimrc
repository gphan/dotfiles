set nocompatible

" Start Pathogen
execute pathogen#infect()

" Map Leader
"let mapleader=","

" Quickly edit and reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Map <C-l> to hide search as well
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" NERDTree settings
nmap <leader>n :NERDTreeToggle<CR>

filetype plugin indent on
syntax on
set encoding=utf-8
set mouse=a
set clipboard+=unnamed

" Visual
color molokai
set guifont=Consolas:h14
set ttyfast
set lazyredraw
set scrolloff=2
set hidden " Hide buffers instead of closing
set synmaxcol=2048
set history=1000
set undolevels=1000
set ruler
set title
set visualbell
set noerrorbells

" Indentation
set autoindent
set smartindent
set copyindent
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

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
autocmd filetype html,xml set listchars-=tab:>-

if has("autocmd")
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
endif

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

