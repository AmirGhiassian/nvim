local cmp = require("cmp")

return {
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "moonfly",
    },
  },
  { "Pocco81/auto-save.nvim", enabled = true },
  "mg979/vim-visual-multi",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  "mg979/vim-visual-multi",
  "ThePrimeagen/vim-be-good",
}
