return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")
    
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    
    local keymap = vim.keymap -- for conciseness
    
    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr
      
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
      
      -- set keybinds
      opts.desc = "Go to definition"
      keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
      
      opts.desc = "Show references"
      keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
      
      -- opts.desc = "Go to declaration"
      -- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
      
      -- opts.desc = "Show LSP definitions"
      -- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
      
      -- opts.desc = "Show LSP implementations"
      -- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
      
      -- opts.desc = "Show LSP type definitions"
      -- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
      
      -- opts.desc = "See available code actions"
      -- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
      
      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
      
      -- opts.desc = "Show buffer diagnostics"
      -- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
      
      -- opts.desc = "Show line diagnostics"
      -- keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
      
      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
      
      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
      
      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
      
      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end
    
    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()
    
    local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
    
    vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      -- Disable underline, it's very annoying
      underline = false,
      virtual_text = true,
      -- Enable virtual text, override spacing to 4
      -- virtual_text = {spacing = 4},
      -- Use a function to dynamically turn signs off
      -- and on, using buffer local variables
      signs = true,
      update_in_insert = false,
    })
    
    local function setup_servers()
      for _, server in pairs(language_servers) do
        if server == "python-lsp-server" then
          lspconfig["pylsp"].setup({
            on_attach = on_attach,
            settings = {
              pylsp = {
                plugins = {
                  -- formatter options
                  black = { enabled = true },
                  autopep8 = { enabled = false },
                  yapf = { enabled = false },
                  -- linter options
                  pylint = { enabled = true, executable = "pylint" },
                  ruff = { enabled = false },
                  pyflakes = { enabled = false },
                  pycodestyle = { enabled = false },
                  -- type checker
                  pylsp_mypy = {
                    enabled = false,
                    overrides = { "--python-executable", py_path, true },
                    report_progress = true,
                    live_mode = false
                  },
                  -- auto-completion options
                  jedi_completion = { fuzzy = true },
                  -- import sorting
                  isort = { enabled = true },
                },
              },
            },
            flags = {
              debounce_text_changes = 200,
            },
            capabilities = capabilities,
          })
        else
          lspconfig[server].setup({capabilities = capabilities, on_attach = on_attach})
        end
      end
    end
    
    setup_servers()
  end,
}