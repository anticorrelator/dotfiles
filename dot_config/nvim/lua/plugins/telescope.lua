return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")
      local themes = require("telescope.themes")
      local actions = require("telescope.actions")

      telescope.setup{
        defaults = {
          initial_mode = "insert",
          selection_strategy = "reset",
          file_sorter =  require'telescope.sorters'.get_fzy_sorter,
          generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
          color_devicons = true,
          path_display = { "truncate " },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next, -- move to next result
            },
          },
        },
        pickers = {
          buffers = {
            initial_mode = "normal",
            sort_lastused = true,
            theme = "dropdown",
            previewer = false,
            mappings = {
              i = {
                ["<c-d>"] = actions.delete_buffer,
                ["<c-d>"] = "delete_buffer",
              },
              n = {
                ["<c-d>"] = actions.delete_buffer,
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
  
      telescope.load_extension("fzf")
  
      -- set keymaps
      local keymap = vim.keymap -- for conciseness
  
      keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
      keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "Show buffers" })
      keymap.set("n", "<leader>cs", "<cmd>Telescope lsp_document_symbols theme=dropdown<cr>", { desc = "Show document symbols" })
      keymap.set("n", "gr", "<cmd>Telescope lsp_references theme=dropdown<cr>", { desc = "Show diagnostics" })
      keymap.set("n", "go", "<cmd>Telescope diagnostics theme=dropdown<cr>", { desc = "Show diagnostics" })
      keymap.set("n", "<leader>ff", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    end,
  }