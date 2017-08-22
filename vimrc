" Load plugins
execute pathogen#infect()

syntax on
filetype plugin indent on
colorscheme molokai

"
" ===== Settings =====
"

set nocompatible
set path+=**

set noerrorbells		" No beeps
set number			" Show line numbers
set backspace=indent,eol,start	" Makes backspace key more powerful
set showcmd			" Show me what I'm typing

set noswapfile			" Don't use swapfile
set nobackup			" Don't create backup files
set nowritebackup
set splitright			" Split verticle windows right to the current windows
set splitbelow			" Split horizontal windows below to the current windows
set encoding=utf-8
set autowrite			" Auto save before :next, :make, etc.
set autoread			" Auto reread changed files without prompting me
set laststatus=2
set hidden

set ruler			" Show the cursor position all the time
set fileformats=unix

set showmatch			" Show the matching brackets
set noshowmode			" The mode is shown with airline
set incsearch			" Set incremental search
set ignorecase			" Search case insensitive ...
set smartcase			" ... but not when search pattern contains upper case
set ttyfast
set lazyredraw			" Wait to redraw

" Make Vim to handle long lines
set wrap
set textwidth=79
set formatoptions=qrn1

" Draw 80 character line limit
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif

" How Vim handles tabs for different files
set autoindent

au BufNewFile,BufRead *.vim setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
au BufNewFile,BufRead *.md setlocal spell noet ts=4 sw=4
au BufNewFile,BufRead *.yml,*.yaml setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.js,*.json setlocal expandtab ts=2 sw=2 suffixesadd+=.js
au BufNewFile,BufRead *.py setlocal expandtab ts=4 sw=4
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
au FileType fstab,systemd setlocal noet
au FileType gitconfig,sh,toml setlocal noet


"
" ===== Mappings ======
"

" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Do not show q: window
nnoremap q: :q

" Allow saving of files as sudo when I forget to start vim using sudo
cmap w!! w !sudo tee > /dev/null %

" Better split switching
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Reverse <Tab> in normal mode with shift
nnoremap <S-Tab> <C-o>

" gf opens a vertical window,
" gF changes the current window
nnoremap gf :vertical wincmd f<CR>

"
" ===== Macros =====
"

" Qoute, paren., and bracket pair macros
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>( viw<esc>a(<CR>)<esc>O
nnoremap <leader>{ viw<esc>a{<CR>}<esc>O
nnoremap <leader>[ viw<esc>a[<CR>]<esc>O

" Block Indention macro
vnoremap <TAB> :norm ^i<tab><esc> V

"
" ===== Airline ======
"

" Automatically populate g:airline_symbols
" dictionary with the powerline symbols
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'

"
" ===== Netrwhist =====
"

" Prevent home folder from being littered with .netwrhist
let g:netrw_home=$XDG_CACHE_HOME.'/vim'

"
" ===== Deprecation =====
"

" Indent lines set to be ┆
let g:indentLine_char = '┆'
