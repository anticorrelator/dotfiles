return {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "jayp0521/mason-null-ls.nvim",
    },
    config = function()
      -- import mason
      local mason = require("mason")
  
      -- import mason-lspconfig
      local mason_lspconfig = require("mason-lspconfig")
  
      -- import mason-null-ls
      local mason_null_ls = require("mason-null-ls")
  
      -- enable mason and configure icons
      mason.setup({
        ui = {
          icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
          }
        }
      })

      language_servers = {
        "cssls",
        "html",
        "lua_ls",
        -- "python-lsp-server",
        "pyright",
        -- "sourcery",
        "sqlls",
        "vimls",
        "yamlls",
      }
      
      mason_lspconfig.setup({
        -- list of servers for mason to install
        language_servers = language_servers,
        -- auto-install configured servers (with lspconfig)
        automatic_installation = true, -- not the same as ensure_installed
      })
      
      mason_null_ls.setup({
        -- list of formatters & linters for mason to install
        ensure_installed = {
          "black", -- python formatter
          "isort", -- python import formatter
          "autopep8",
          "pylint",
          "pyproject-flake8",
        },
        -- auto-install configured servers (with lspconfig)
        automatic_installation = true,
      })
    end,
  }