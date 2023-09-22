return {
  "nvim-lualine/lualine.nvim",
  event="VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = "gruvbox-material",
        icons_enabled = false,
        section_separators = {},
        component_separators = {},
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}