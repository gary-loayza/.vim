" Load plugins
execute pathogen#infect()

filetype plugin indent on
syntax on

"
" ===== Colors ======
"

set termguicolors
colorscheme carbonized-dark

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
nnoremap <A-j> <C-W>j
nnoremap <A-k> <C-W>k
nnoremap <A-h> <C-W>h
nnoremap <A-l> <C-W>l

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
"vnoremap <TAB> :norm ^i<tab><esc> V

" Opens horizontal terminal
nnoremap <A-t> :sp<CR>:te<CR>

" Map <ESC> to exit terminal mode
:tnoremap <Esc> <C-\><C-n>

" Map ALT+{h,j,k,l} to navigate windows from terminal mode
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l

" Map ALT+{H,J,K,L} to resize windows from normal mode
nnoremap <A-H> 10<C-W><
nnoremap <A-L> 10<C-W>>
nnoremap <A-K> 10<C-W>+
nnoremap <A-J> 10<C-W>-

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
" ===== NerdTree =====
"

" Toggle NerdTree with n
nnoremap <C-n> :NERDTreeToggle<CR>

"
" ===== Deprecation =====
"

" Indent lines set to be ┆
let g:indentLine_char = '┆'
