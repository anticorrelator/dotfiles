"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimrc with neovim-specific options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set leader key
let mapleader=","
let g:mapleader=","

set nocompatible
set number

call plug#begin('~/.vim/plugged')

" colorschemes
Plug 'sainnhe/edge'
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'
Plug 'bluz71/vim-moonfly-colors'
Plug 'rafamadriz/neon'

" sensible defaults
Plug 'tpope/vim-sensible'

" general purpose plugins
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " multiple cursor support
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Neovim plugins
Plug 'akinsho/nvim-bufferline.lua'
Plug 'glepnir/dashboard-nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'numtostr/FTerm.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'phaazon/hop.nvim', { 'branch': 'pre-extmarks' }
Plug 'rktjmp/highlight-current-n.nvim'
Plug 'windwp/nvim-autopairs'

" language specific plugins
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jay-babu/mason-null-ls.nvim'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" nvim truecolor settings
set termguicolors

" colorscheme settings
let g:edge_style = 'aura'
let g:everforest_background = 'soft'
let g:gruvbox_material_background = 'hard'
let g:sonokai_style = 'shusia'
let g:tokyonight_style = 'night'
let g:neon_style = 'dark'

colorscheme everforest
let g:lightline = {'colorscheme' : 'everforest'}
set background=dark
set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editor settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" jj exits edit mode
:inoremap jj <Esc>

:tnoremap <Esc> <C-\><C-n> " esc leaves terminal mode

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
nmap n <Plug>(highlight-current-n-n)
nmap N <Plug>(highlight-current-n-N)

" If you want the highlighting to take effect in other maps they must
" also be nmaps (or rather, not "nore").
"
" * will search <cword> ahead, but it can be more ergonomic to have *
" simply fill the / register with the current <cword>, which makes future
" commands like cgn "feel better". This effectively does that by performing
" "search ahead <cword> (*), go back to last match (N)".
nmap * *N

" Some QOL autocommands
augroup ClearSearchHL
autocmd!
  " You may only want to see hlsearch /while/ searching, you can automatically
  " toggle hlsearch with the following autocommands
  autocmd CmdlineEnter /,\? set hlsearch
  autocmd CmdlineLeave /,\? set nohlsearch
  " this will apply similar n|N highlighting to the first search result
  " careful with escaping ? in lua, you may need \\?
  autocmd CmdlineLeave /,\? lua require('highlight_current_n')['/,?']()
  augroup END

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
set colorcolumn=89
set display+=lastline " When 'wrap' is on, display last line even if it doesn't fit

" indentation settings
set smarttab
set expandtab
set shiftwidth=4 " Number of auto-indent spaces
set tabstop=4
set softtabstop=4 " Number of spaces per Tab

filetype plugin indent on " use filetype detection
syntax on

" more responsive vim
set ttyfast
set notimeout
set lazyredraw

" save when focus lost
" au FocusLost * :wa

" navigate windws quicker
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neovim specific settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('nvim')
  tnoremap <Leader>e <C-\><C-n> " nvim terminal remapping
  endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Telescope settings
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>cs <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>ca <cmd>Telescope lsp_code_actions<cr>
vnoremap <leader>ca <cmd>Telescope lsp_range_code_actions<cr>
nnoremap <leader>xx <cmd>Telescope lsp_workspace_diagnostics<cr>
nnoremap <leader>ff <cmd>Telescope live_grep<cr>

lua <<EOF
local telescope = require('telescope')

telescope.setup{
  defaults = {
    initial_mode = "insert",
    selection_strategy = "reset",
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    color_devicons = true,
  },
  pickers = {
    buffers = {
      initial_mode = "normal",
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        }
      }
    },
    find_files = {
      theme = "dropdown",
    },
    git_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
    lsp_code_actions = {
      theme = "cursor",
    },
    lsp_range_code_actions = {
      theme = "cursor",
    },
    lsp_document_symbols = {
      theme = "dropdown",
    },
    lsp_document_diagnostics = {
      initial_mode = "normal",
    },
    lsp_workspace_diagnostics = {
      initial_mode = "normal",
    },
  }
}
EOF

" nvim-bufferline settings
lua <<EOF
require"bufferline".setup{
  options = {
    show_buffer_icons = false
  }
}
EOF

" nvim-tree settings

lua <<EOF
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF

let g:nvim_tree_width = 40
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_gitignore = 1
let g:nvim_tree_auto_open = 0
let g:nvim_tree_auto_close = 1
let g:nvim_tree_auto_ignore_ft = ['startify']
let g:nvim_tree_quit_on_open = 0
let g:nvim_tree_follow = 0
let g:nvim_tree_indent_markers = 0
let g:nvim_tree_git_hl = 1
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_disable_window_picker = 1
nnoremap <silent> <leader>e :NvimTreeToggle<CR>

" blankline settings
lua <<EOF
  require("indent_blankline").setup {
    show_end_of_line = false,
    show_trailing_blankline_indent = false,
    space_char_blankline = " ",
    buftype_exclude = {"terminal"},
    filetype_exclude = {"dashboard"},
  }
EOF

" terminal settings
lua <<EOF
require'FTerm'.setup({
  dimensions  = {
    height = 0.8,
    width = 0.8,
    x = 0.5,
    y = 0.5
  },
  border = 'double' -- or 'double'
})

  -- Keybinding
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  map('n', '<leader>rr', '<CMD>lua require("FTerm").toggle()<CR>', opts)
  map('t', '<leader>rr', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
EOF

" hopline settings
nmap <silent> <leader>ll :HopLine<cr>

" dashboard settings
let g:dashboard_default_executive = 'telescope'
nmap <leader>ss :<C-u>SessionSave<CR>
nmap <leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <leader>df :DashboardFindFile<CR>
nnoremap <silent> <leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <leader>fa :DashboardFindWord<CR>
nnoremap <silent> <leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <leader>cn :DashboardNewFile<CR>
let g:dashboard_custom_shortcut={
  \ 'last_session'       : 'LEADER s l',
  \ 'find_history'       : 'LEADER f h',
  \ 'find_file'          : 'LEADER d f',
  \ 'new_file'           : 'LEADER c n',
  \ 'change_colorscheme' : 'LEADER t c',
  \ 'find_word'          : 'LEADER f a',
  \ 'book_marks'         : 'LEADER f b',
\ }

let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

" autopairs
lua <<EOF
  require('nvim-autopairs').setup()
EOF

" GitGutter settings
nmap <silent> <leader>gg :GitGutterToggle<cr>

" vim-visual-multi settings
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => treesitter configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      indent = { enable = true},
      autotag = { enable = true},
      ensure_installed = {
        "json",
        "python",
        "javascript",
        "typescript",
        "yaml",
        "css",
        "markdown",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitingore",
      },
      auto_install = true,
      custom_captures = {
        -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
        ["foo.bar"] = "Identifier",
      },
    },
  }
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => treesitter-textobjects configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
  require'nvim-treesitter.configs'.setup {
    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      textobjects = {
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]f"] = "@function.outer",
          ["]c"] = "@class.outer",
          ["]]"] = "@block.outer",
        },
        goto_next_end = {
          ["]F"] = "@function.outer",
          ["]C"] = "@class.outer",
        },
        goto_previous_start = {
          ["[f"] = "@function.outer",
          ["[c"] = "@class.outer",
        },
        goto_previous_end = {
          ["[F"] = "@function.outer",
          ["[C"] = "@class.outer",
          ["[["] = "@block.outer",
        },
      },
    },
  }
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 🐓 Coq settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:coq_settings = 
\ {
\   'auto_start': v:true,
\   'display.pum.fast_close': v:false,
\   "keymap.recommended": v:false,
\   "keymap.jump_to_mark": "<c-e>",
\   "display.preview.x_max_len": 100,
\   "display.preview.border": ["", "", "", " ", "", "", "", " "],
\   "display.preview.positions": { "north": 2, "south": 3, "west": 4, "east": 1 },
\   "clients.tree_sitter.enabled": v:false,
\   "clients.snippets.enabled": v:false,
\   "clients.tags.enabled": v:false,
\   "completion.always": v:true,
\   "completion.skip_after": [" "],
\ }

ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => mason lsp installtion settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF

language_servers = {
  "cssls",
  "html",
  "ltex",
  "lua_ls",
  "pyright",
  -- "sourcery",
  "sqlls",
  "vimls",
  "yamlls",
}

require("mason").setup()

require("mason-lspconfig").setup({
  -- list of servers for mason to install
  ensure_installed = language_servers,  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

require("mason-null-ls").setup({
  -- list of formatters & linters for mason to install
  ensure_installed = {
    "black", -- python formatter
    "flake8", -- general purpose python linter
    "isort", -- python import formatter
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
})

EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => null-ls linter and formatter settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF

local null_ls = require("null-ls")

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lsp settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
  -- keymaps
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Mappings.
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
      vim.api.nvim_exec([[
                        augroup lsp_document_highlight
                        autocmd! * <buffer>
                        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                        augroup END
                        ]], false)
    end
  end

  -- Configure lua language server for neovim development
  local lua_settings = {
    Lua = {
      runtime = {
        -- LuaJIT in the case of Neovim
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    }
  }

  -- config that activates keymaps and enables snippet support
  local function make_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return {
      -- enable snippet support
      capabilities = capabilities,
      -- map buffer local keybindings when the language server attaches
      on_attach = on_attach,
    }
  end

  local function setup_servers()

    for _, server in pairs(language_servers) do
      local config = make_config()

      -- language specific config
      if server == "lua" then
        config.settings = lua_settings
      end
      if server == "sourcekit" then
        config.filetypes = {"swift", "objective-c", "objective-cpp"}; -- we don't want c and cpp!
      end
      if server == "clangd" then
        config.filetypes = {"c", "cpp"}; -- we don't want objective-c and objective-cpp!
      end

      local lsp = require"lspconfig"
      local coq = require"coq"

      lsp[server].setup(coq.lsp_ensure_capabilities(config))
    end
  end

  setup_servers()
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => pymode settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:pymode = 1

let g:pymode_warnings = 0
let g:pymode_folding = 0
let g:pymode_doc = 0
let g:pymode_run = 0
let g:pymode_breakpoint = 0
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_message = 0
let g:pymode_rope_completion = 0
let g:pymode_rope = 0

let g:pymode_trim_whitespaces = 1
let g:pymode_indent = 1
let g:pymode_indent_hanging_width = 4
let g:pymode_motion = 1
