""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimrc with neovim-specific options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set number
filetype off

call plug#begin('~/.vim/plugged')

" colorschemes
Plug 'notpratheek/vim-luna'
Plug 'nanotech/jellybeans.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'dfxyz/CandyPaper.vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter',
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-multiple-cursors'
Plug 'sjl/vitality.vim'
Plug 'sickill/vim-pasta'
Plug 'rizzatti/dash.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'mhinz/vim-startify'
Plug 'romainl/Apprentice'

" language specific plugins
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" nvim truecolor settings
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" let base16colorspace=256  " Access colors present in 256 colorspace"
" set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set termguicolors

colorscheme apprentice
set background=dark
set cursorline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editor settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype indent plugin on
:inoremap jj <Esc>

set scrolloff=7 " set 7 lines to the cursors - when moving vertical
set wildmenu " enhanced command line completion
set hidden " current buffer can be put into background
set showcmd " show incomplete commands
set wildmode=list:longest,full " complete files like a shell

set title " set terminal title

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers

set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

" set leader key
let mapleader=","
let g:mapleader=","

" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" linewrap settings
set wrap linebreak nolist
set showbreak=+++
set textwidth=0
set wrapmargin=0
set colorcolumn=100

" syntax highlighting on
syntax on

" mouse settings
set mouse=a

" indentation settings
set autoindent " Auto-indent new lines
set shiftwidth=4 " Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab " Enable smart-tabs
set softtabstop=4 " Number of spaces per Tab

" more responsive vim
set ttyfast
set notimeout
set lazyredraw

" save when focus lost
au FocusLost * :wa

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neovim specific settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('nvim')
  tnoremap <Leader>e <C-\><C-n> " nvim terminal remapping
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDtree settings
noremap <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ctrlp settings
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

" Fugitive settings
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

" python-mode settings
let g:pymode_lint_cwindow = 0
let g:pymode_lint_unmodified = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_goto_definition_bind = "<C-]>"

" Ack.vim settings
nnoremap <leader>a :Ack<Space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Tagbar settings
nmap <leader>t :TagbarToggle<cr>

" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
