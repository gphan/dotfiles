set nocompatible
filetype off

" Setup Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" List of plugins
Plugin 'tpope/vim-fugitive'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
" Plugin 'elzr/vim-json'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
" Plugin 'Lokaltog/vim-easymotion'

" Clojure
Plugin 'vim-scripts/paredit.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-leiningen'

" Rust
" Plugin 'rust-lang/rust.vim'

" Color schemes
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on

" Map Leader
"let mapleader=","

" Quickly edit and reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Map <C-l> to hide search as well
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" NERDTree settings
nmap <leader>n :NERDTreeToggle<CR>

syntax on
set encoding=utf-8
set clipboard+=unnamed

" Visual
set background=dark
colorscheme solarized
let g:airline_theme='dark'
let g:airline_powerline_fonts=1
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

if has("autocmd")
    autocmd filetype html,xml set listchars-=tab:>-
    autocmd filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType c set nolist
endif

if has("gui_running")
    " set transparency=5
    set guifont=Inconsolata-dz\ for\ Powerline:h14
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
