return {
  "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        aliases = {
          ["a"] = ">",
          ["p"] = ")",
          ["b"] = "}",
          ["r"] = "]",
          ["q"] = { '"', "'", "`" },
          ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
        },
        surrounds = {
          ["("] = {
            add = { "(", ")" },
            find = function()
              local c = require("nvim-surround.config")
              return c.get_selection({ motion = "a(" })
            end,
            delete = "^(. ?)().-( ?.)()$",
          },
          ["["] = {
            add = { "[", "]" },
            find = function()
              local c = require("nvim-surround.config")
              return c.get_selection({ motion = "a[" })
            end,
            delete = "^(. ?)().-( ?.)()$",
          },
          ["{"] = {
            add = { "{", "}" },
            find = function()
              local c = require("nvim-surround.config")
              return c.get_selection({ motion = "a{" })
            end,
            delete = "^(. ?)().-( ?.)()$",
          },
        }})

      vim.keymap.set("o", "ir", "i]")
      vim.keymap.set("o", "ar", "a]")
      vim.keymap.set("o", "ip", "i)")
      vim.keymap.set("o", "ap", "a)")
      vim.keymap.set("o", "ib", "i}")
      vim.keymap.set("o", "ab", "a}")
end,
}
