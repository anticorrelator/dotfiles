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
Plug 'bluz71/vim-moonfly-colors'
Plug 'junegunn/seoul256.vim'
Plug 'rafamadriz/neon'
Plug 'sainnhe/edge'
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'

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
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'glepnir/dashboard-nvim'
Plug 'nvim-tree/nvim-tree.lua'
" Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'numtostr/FTerm.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'phaazon/hop.nvim'
Plug 'rktjmp/highlight-current-n.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'nmac427/guess-indent.nvim'

" language specific plugins
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" completion plugins
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'onsails/lspkind.nvim'
Plug 'glepnir/lspsaga.nvim'

" linting/formatting plugins
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jay-babu/mason-null-ls.nvim'

" unused plugins
" Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

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
let g:lightline = {'colorscheme' : 'everforest', 'enable' : { 'tabline' : 0 } }
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
nnoremap <leader>cs <cmd>Telescope lsp_document_symbols theme=dropdown<cr>
nnoremap gr :lua require('telescope.builtin').lsp_references(require('telescope.themes').get_dropdown({layout_config = { width = 160 }}))<CR>
" nnoremap gr <cmd>Telescope lsp_references theme=dropdown<cr>
nnoremap go <cmd>Telescope diagnostics theme=dropdown<cr>
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
lua require('hop').setup()
nmap <silent> <leader>ll :HopLine<cr>

" dashboard settings
lua <<EOF
  require("dashboard").setup({
    theme = 'hyper',
    config = {
      week_header = {
       enable = true,
      },
      shortcut = {
        { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Apps',
          group = 'DiagnosticHint',
          action = 'Telescope app',
          key = 'a',
        },
        {
          desc = ' dotfiles',
          group = 'Number',
          action = 'Telescope dotfiles',
          key = 'd',
        },
      },
    },
  })
EOF

" autopairs
lua <<EOF

-- import nvim-autopairs safely
local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
  return
end

-- configure autopairs
autopairs.setup({
  check_ts = true, -- enable treesitter
  ts_config = {
    lua = { "string" }, -- don't add pairs in lua string treesitter nodes
    javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
    java = false, -- don't check treesitter on java
  },
})

-- import nvim-autopairs completion functionality safely
local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_setup then
  return
end

-- import nvim-cmp plugin safely (completions plugin)
local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then
  return
end

-- make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

EOF

" GitGutter settings
nmap <silent> <leader>gg :GitGutterToggle<cr>

" vim-visual-multi settings
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n

" guess indent settings
lua <<EOF
require('guess-indent').setup {
  auto_cmd = true,  -- Set to false to disable automatic execution
  filetype_exclude = {  -- A list of filetypes for which the auto command gets disabled
    "netrw",
    "tutor",
  },
  buftype_exclude = {  -- A list of buffer types for which the auto command gets disabled
    "help",
    "nofile",
    "terminal",
    "prompt",
  },
}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim-tree configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

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

-- attempts to close nvim tree if it's the last buffer or tab
local function tab_win_closed(winnr)
  local api = require"nvim-tree.api"
  local tabnr = vim.api.nvim_win_get_tabpage(winnr)
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local buf_info = vim.fn.getbufinfo(bufnr)[1]
  local tab_wins = vim.tbl_filter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
  local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
  if buf_info.name:match(".*NvimTree_%d*$") then            -- close buffer was nvim tree
    -- Close all nvim tree on :q
    if not vim.tbl_isempty(tab_bufs) then                      -- and was not the last window (not closed automatically by code below)
      api.tree.close()
    end
  else                                                      -- else closed buffer was normal buffer
    if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
      local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
      if last_buf_info.name:match(".*NvimTree_%d*$") then       -- and that buffer is nvim tree
        vim.schedule(function ()
          if #vim.api.nvim_list_wins() == 1 then                -- if its the last buffer in vim
            vim.cmd "quit"                                        -- then close all of vim
          else                                                  -- else there are more tabs open
            vim.api.nvim_win_close(tab_wins[1], true)             -- then close only the tab
          end
        end)
      end
    end
  end
end

vim.api.nvim_create_autocmd("WinClosed", {
  callback = function ()
    local winnr = tonumber(vim.fn.expand("<amatch>"))
    vim.schedule_wrap(tab_win_closed(winnr))
  end,
  nested = true
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neotree configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lua <<EOF

" require("neo-tree").setup({
"   close_if_last_window = true,
" })
" EOF
" nnoremap <silent> <leader>e :Neotree toggle=true<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => treesitter configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
  require('nvim-treesitter.configs').setup {
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
    },
    auto_install = true,
    -- enable syntax highlighting
    highlight = { enable = true },
    -- enable indentation
    indent = { enable = true },
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = { enable = true },
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
" => mason lsp installtion settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF

language_servers = {
  "cssls",
  "html",
  "lua_ls",
  -- "pylsp",
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

EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => autocomplete settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF

-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  return
end

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  -- sources for autocompletion
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- lsp
    { name = "luasnip" }, -- snippets
    { name = "buffer" }, -- text within current buffer
    { name = "path" }, -- file system paths
  }),
  -- configure lspkind for vs-code like icons
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = "...",
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        path = "[path]",
        luasnip = "[snip]",
      },
    }),
  },
})

EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 🐓 Coq settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:coq_settings = 
" \ {
" \   'auto_start': v:true,
" \   'display.pum.fast_close': v:false,
" \   "keymap.recommended": v:false,
" \   "keymap.jump_to_mark": "<c-e>",
" \   "display.preview.x_max_len": 100,
" \   "display.preview.border": ["", "", "", " ", "", "", "", " "],
" \   "display.preview.positions": { "north": 2, "south": 3, "west": 4, "east": 1 },
" \   "clients.tree_sitter.enabled": v:false,
" \   "clients.snippets.enabled": v:false,
" \   "clients.tags.enabled": v:false,
" \   "completion.always": v:true,
" \   "completion.skip_after": [" "],
" \ }

" ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
" ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
" ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
" ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
" ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => null-ls linter and formatter settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF

local formatters = {
  "black", -- python formatter
  "isort", -- python import formatter
}

require("mason-null-ls").setup({
  -- list of formatters & linters for mason to install
  ensure_installed = formatters,
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
  automatic_setup = true,
})
local null_ls = require("null-ls")

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- null_ls.setup({
--   -- configure format on save
--   on_attach = function(current_client, bufnr)
--     if current_client.supports_method("textDocument/formatting") then
--       vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           vim.lsp.buf.format({
--             filter = function(client)
--               --  only use null-ls for formatting instead of lsp server
--               return client.name == "null-ls"
--             end,
--             bufnr = bufnr,
--           })
--         end,
--       })
--     end
--   end,
-- })

null_ls.setup({})
require ('mason-null-ls').setup_handlers()

EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lsp settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
  local lsp = require("lspconfig")
  local keymap = vim.keymap
  -- keymaps
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Mappings.
    local opts = { noremap=true, silent=true }
    -- keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts)
    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    -- keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    -- keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap.set("n", "<leader>FF", "<cmd>lua vim.lsp.buf.format()<CR>", opts) -- format buffer
    -- keymap.set("n", "go", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show diagnostics for line
    -- keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
    -- keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
    keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
    keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side
    -- Call hierarchy
    -- keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", opts)
    -- keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", opts)

    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
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
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local capabilities = cmp_nvim_lsp.default_capabilities()

  local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  -- diagnostics
  vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable underline, it's very annoying
        underline = false,
        virtual_text = false,
        -- Enable virtual text, override spacing to 4
        -- virtual_text = {spacing = 4},
        -- Use a function to dynamically turn signs off
        -- and on, using buffer local variables
        signs = true,
        update_in_insert = false,
    })

  local function setup_servers()
    for _, server in pairs(language_servers) do
      lsp[server].setup({capabilities = capabilities, on_attach = on_attach})
      -- lsp[server].setup(coq.lsp_ensure_capabilities({capabilities = capabilities, on_attach = on_attach}))
    end
  end

  setup_servers()
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lspsaga settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF

local lspsaga = require 'lspsaga'
lspsaga.setup({
  symbol_in_winbar = {
      enable = false,
    },
  finder = {
    quit = "<Esc>",
  },
  definition = {
    quit = "<Esc>",
    exec = "<CR>",
  },
  rename = {
    quit = "<Esc>",
    exec = "<CR>",
  },
  diagnostic = {
    on_insert = true,
    on_insert_follow = false,
    insert_winblend = 0,
    show_virt_line = false,
    show_code_action = false,
    show_source = true,
    jump_num_shortcut = true,
     --1 is max
    max_width = 0.7,
    custom_fix = nil,
    custom_msg = nil,
    text_hl_follow = true,
    border_follow = true,
    keys = {
      exec_action = "o",
      quit = "q",
      go_action = "g"
    },
  },
  border_style = "shadow",
  rename_output_qflist = {
    enable = false,
    auto_open_qflist = false,
  },
  outline = {
    win_position = "right",
    win_with = "",
    win_width = 50,
    show_detail = true,
    auto_preview = true,
    auto_refresh = true,
    auto_close = true,
    custom_sort = nil,
    keys = {
      jump = "o",
      expand_collapse = "u",
      quit = "q",
    },
  },
})
-- lspsaga.setup { -- defaults ...
--   debug = false,
--   use_saga_diagnostic_sign = true,
--   -- diagnostic sign
--   error_sign = "",
--   warn_sign = "",
--   hint_sign = "",
--   infor_sign = "",
--   diagnostic_header_icon = "   ",
--   -- code action title icon
--   code_action_icon = " ",
--   code_action_prompt = {
--     enable = true,
--     sign = true,
--     sign_priority = 40,
--     virtual_text = true,
--   },
--   finder_definition_icon = "  ",
--   finder_reference_icon = "  ",
--   max_preview_lines = 10,
--   finder_action_keys = {
--     open = "o",
--     vsplit = "s",
--     split = "i",
--     quit = "<Esc>",
--     scroll_down = "<C-f>",
--     scroll_up = "<C-b>",
--   },
--   code_action_keys = {
--     quit = "<Esc>",
--     exec = "<CR>",
--   },
--   rename_action_keys = {
--     quit = "<Esc>",
--     exec = "<CR>",
--   },
--   definition_preview_icon = "  ",
--   border_style = "single",
--   rename_prompt_prefix = "➤",
--   rename_output_qflist = {
--     enable = false,
--     auto_open_qflist = false,
--   },
--   server_filetype_map = {},
--   diagnostic_prefix_format = "%d. ",
--   diagnostic_message_format = "%m %c",
--   highlight_prefix = false,
--  symbol_in_winbar = {
--    enable=false,
--  },
-- }

EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => pymode settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:pymode = 1

" let g:pymode_warnings = 0
" let g:pymode_folding = 0
" let g:pymode_doc = 0
" let g:pymode_run = 0
" let g:pymode_breakpoint = 0
" let g:pymode_lint = 0
" let g:pymode_lint_on_write = 0
" let g:pymode_lint_message = 0
" let g:pymode_rope_completion = 0
" let g:pymode_rope = 0

" let g:pymode_trim_whitespaces = 1
" let g:pymode_indent = 1
" let g:pymode_indent_hanging_width = 4
" let g:pymode_motion = 1
