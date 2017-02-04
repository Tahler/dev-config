""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle and Plugin Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" For this to work, install vundle manually
" https://github.com/gmarik/vundle

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Let vundle manage itself
Plugin 'VundleVim/Vundle.vim'
" Python code folding
Plugin 'tmhedberg/SimpylFold'
" Fuzzy finder
Plugin 'kien/ctrlp.vim'
" Better '%' matching
Plugin 'tmhedberg/matchit'
" Support for easily toggling comments
Plugin 'tpope/vim-commentary'
" Surround text with chars (brackets, etc.)
Plugin 'tpope/vim-surround'
" Ability to repeat (. command) tpope plugin commands
Plugin 'tpope/vim-repeat'
" Many colorschemes
Plugin 'flazz/vim-colorschemes'
" JSON highlighting
Plugin 'elzr/vim-json'
" Markdown highlighting
Plugin 'tpope/vim-markdown'
" Rust highlighting
Plugin 'rust-lang/rust.vim'
" Rust intellisense
Plugin 'racer-rust/vim-racer'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Filetype auto-detection
filetype plugin indent on

set encoding=utf8
set tabstop=4
set shiftwidth=4
set softtabstop=4
" use spaces instead of tabs.
set expandtab
" lets tab key insert 'tab stops' and bksp deletes tabs
set smarttab
" tab / shifting moves to closest tabstop.
set shiftround
" Match indents on new lines.
set autoindent
" Intellegently dedent / indent new lines based on rules.
set smartindent
" Show line numbers
set number
" Show filename
set laststatus=2
" Always show current position
set ruler
" Buffer 5 lines to the cursor vertically
set so=5
" Wrap lines to the window buffer
set wrap
" Show column line at 80
set colorcolumn=80

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" VCS makes backups and .swp files obsolete - disable them
set nobackup
set nowritebackup
set noswapfile

""" No nagging when hiding buffers
" allow buffers with unsaved changes
set hidden
" when a file has changed on disk load it without asking
set autoread

" Persistent undo: undo even after closing a buffer or vim
try
    set undodir=~/.vim/tmp/undo
    set undofile
catch
endtry

" case insensitive search
set ignorecase
" If there are uppercase letters, become case-sensitive.
set smartcase
" live incremental searching
set incsearch
" live match highlighting
set showmatch
" highlight matches
set hlsearch
" use the `g` flag by default.
set gdefault
" Regular expressions in search
set magic

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Keep folds open on load
set foldlevelstart=20

" Turn on the wild menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings and Macros
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" leader is a key that allows you to have your own 'namespace' of keybindings
" Referenced below as <leader>
let mapleader = ","
let g:mapleader = ","

" Get to command mode via ';'
nnoremap ; :
vnoremap ; :

" Remap 0 to first non-blank char
nnoremap 0 ^

" Delete trailing whitespace
nnoremap <Leader>w :%s/\s\+$//e<CR>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Faster movement between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Clear match highlighting
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>

" Move down on wrapped lines
noremap j gj
noremap k gk

" 'Visual select' current word
nmap <leader>v viw
" 'Visual select' current line
nmap <leader>V 0v$h

" Fold with spacebar
nnoremap <space> za
vnoremap <space> zf

""" Plugin remappings

" Map '/' to toggle comments with vim-commentary
nnoremap <C-_> :Commentary<cr>
vnoremap <C-_> :Commentary<cr>

" Faster visual surround
vmap ( S)
vmap ) S(
vmap [ S]
vmap ] S[
vmap { S}
vmap } S{
vmap " S"
vmap ' S'
vmap ` S`

" Let Simpylfold show the Python docstrings
let g:SimpylFold_docstring_preview=1

" Remap ctrl-p to ctrl-e
let g:ctrlp_map = '<c-e>'

" Let ctrl-p have up to 30 results.
let g:ctrlp_max_height = 30

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax highlighting
syntax on

" Highlight trailing whitespace
match ErrorMsg '\s\+$'

" Found in ~/.vim/colors
colorscheme custom-material
" No background color
hi Normal ctermbg=none

