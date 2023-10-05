return {
  -- colorschemes
  { "bluz71/vim-moonfly-colors", lazy = true },
  { "junegunn/seoul256.vim", lazy = true },
  { "rafamadriz/neon", lazy = true },
  { "sainnhe/edge", lazy = true },
  { "sainnhe/everforest", lazy = true },
  { "sainnhe/gruvbox-material", lazy = true },
  { "sainnhe/sonokai", lazy = true },
  -- python plugins
  { "Vimjas/vim-python-pep8-indent", ft = { "python" }},
  -- { "jeetsukumaran/vim-pythonsense", ft = { "python" } },
  -- everything else
  { "airblade/vim-gitgutter" },
  { "tpope/vim-sensible" },
  { "tpope/vim-commentary", event = "VeryLazy" },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "nmac427/guess-indent.nvim", event = "VeryLazy" },
  { "nvim-zh/better-escape.vim", event = { "InsertEnter" } },
  { "github/copilot.vim", event = "VeryLazy" }
}
