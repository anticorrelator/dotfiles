return {
  "numtostr/FTerm.nvim",
  event = "VeryLazy",
  config = function()
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
  end,
}