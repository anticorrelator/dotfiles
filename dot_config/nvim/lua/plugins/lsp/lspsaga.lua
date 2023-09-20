return {
    "nvimdev/lspsaga.nvim",
    dependencies = {},
    config = function()
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
--   error_sign = "E",
--   warn_sign = "W",
--   hint_sign = "H",
--   infor_sign = "I",
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
    end,
  }