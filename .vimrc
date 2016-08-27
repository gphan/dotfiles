set nocompatible
filetype off

" Setup Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" List of plugins

" General all purpose plugins
Plugin 'tpope/vim-fugitive'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
" Plugin 'elzr/vim-json'
Plugin 'kien/ctrlp.vim'
" Plugin 'scrooloose/nerdcommenter'
" Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'airblade/vim-gitgutter'
" Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
" Plugin 'Lokaltog/vim-easymotion'
Plugin 'Shougo/neocomplete.vim'

" Clojure
"Plugin 'vim-scripts/paredit.vim'
"Plugin 'guns/vim-clojure-static'
"Plugin 'guns/vim-clojure-highlight'
"Plugin 'tpope/vim-fireplace'
"Plugin 'tpope/vim-classpath'
"Plugin 'tpope/vim-leiningen'

" Ruby
"Plugin 'vim-ruby/vim-ruby'
"Plugin 'tpope/vim-rails'
"Plugin 'tpope/vim-bundler'
"Plugin 'tpope/vim-rake'
"Plugin 'tpope/vim-endwise'
"Plugin 'skalnik/vim-vroom'

" Go
Plugin 'fatih/vim-go'

" Rust
" Plugin 'rust-lang/rust.vim'

" Erlang
"Plugin 'jimenezrick/vimerl'
"Plugin 'edkolev/erlang-motions.vim'

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

" Go stuff
autocmd FileType go set nolist
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>T <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)

au BufNewFile,BufRead *.erl,*.es,*.hrl,*.yaws,*.xrl setf erlang

" Python stuff
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=79
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix

if has("gui_running")
    set transparency=3
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

map <leader>] :bn<cr>
map <leader>[ :bp<cr>
map <leader>d :bd<cr>

nmap <leader>t :TagbarToggle<CR>

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" ==== Start NeoComplete stuff
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
set completeopt-=preview

" ==== End NeoComplete Stuff
