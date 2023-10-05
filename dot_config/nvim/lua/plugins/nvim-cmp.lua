return {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-omni",
      "hrsh7th/cmp-emoji",
      "quangnguyen30192/cmp-nvim-ultisnips",
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
  
      cmp.setup({
        completion = {
          keyword_length = 1,
          completeopt = "menu,noselect",
        },
        view = {
          entries = "custom",
        },
        snippet = { -- configure how nvim-cmp interacts with snippet engine
          expand = function(args)
            -- For `ultisnips` user.
            vim.fn["UltiSnips#Anon"](args.body)
          end,
        },
        -- tab-autocomplete mapping, <Esc> feels bad
        -- mapping = cmp.mapping.preset.insert({
        --   ["<Tab>"] = function(fallback)
        --     if cmp.visible() then
        --       cmp.select_next_item()
        --     else
        --       fallback()
        --     end
        --   end,
        --   ["<S-Tab>"] = function(fallback)
        --     if cmp.visible() then
        --       cmp.select_prev_item()
        --     else
        --       fallback()
        --     end
        --   end,
        --   ["<CR>"] = cmp.mapping.confirm { select = true },
        --   ["<C-e>"] = cmp.mapping.abort(),
        --   ["<Esc>"] = cmp.mapping.close(),
        --   ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        --   ["<C-f>"] = cmp.mapping.scroll_docs(4),
        --   ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        -- }),
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
          { name = "nvim_lsp" },
          { name = "ultisnips" }, -- snippets
          { name = "path" }, -- file system paths
          { name = "buffer" }, -- text within current buffer
          { name = "emoji", insert = true }, -- emoji completion
        }),
        -- configure lspkind for vs-code like pictograms in completion menu
        formatting = {
          format = lspkind.cmp_format({
            maxwidth = 50,
            mode="symbol_text",
            ellipsis_char = "...",
            menu = {
              nvim_lsp = "[LSP]",
              ultisnips = "[us]",
              nvim_lua = "[lua]",
              path = "[path]",
              buffer = "[buffer]",
              emoji = "[emoji]",
              omni = "[omni]",
            },
          }),
        },
      })

      cmp.setup.filetype("tex", {
        sources = {
          { name = "omni" },
          { name = "ultisnips" }, -- For ultisnips user.
          { name = "buffer", keyword_length = 2 }, -- for buffer word completion
          { name = "path" }, -- for path completion
        },
      })

      --  see https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-dark-theme-colors-to-the-menu
      vim.cmd([[
        highlight! link CmpItemMenu Comment
        " gray
        highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
        " blue
        highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
        highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
        " light blue
        highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
        highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
        highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
        " pink
        highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
        highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
        " front
        highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
        highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
        highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
      ]])
    end,
  }
