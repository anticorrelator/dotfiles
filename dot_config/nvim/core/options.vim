set nocompatible
set number

set encoding=utf-8 " Force utf-8 encoding
set title " set terminal title

syntax on " syntax highlighting on

set hidden " current buffer can be put into background
set mat=2 " how many tenths of a second to blink
set mouse=a " mouse settings
set scrolloff=7 " set 7 lines to the cursors - when moving vertical
set showcmd " show incomplete commands
set showmatch " show matching braces
set wildmenu " enhanced command line completion
set wildmode=list:longest,full " complete files like a shell

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set magic " Set magic on, for regex
" Map keys

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

" code folding settings
set foldmethod=indent " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" linewrap settings
set wrap linebreak nolist
set showbreak=+++
set textwidth=0
set wrapmargin=0
set colorcolumn=120
set display+=lastline " When 'wrap' is on, display last line even if it doesn't fit

" indentation settings
set smarttab
set expandtab
set shiftwidth=4 " Number of auto-indent spaces
set tabstop=4
set softtabstop=4 " Number of spaces per Tab

filetype plugin indent on " use filetype detection
syntax on

" save when focus lost
" au FocusLost * :wa

" navigate windws quicker
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l