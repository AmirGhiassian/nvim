return {
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  { "pmizio/typescript-tools.nvim" },
  "EdenEast/nightfox.nvim",
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightfox",
    },
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  "mg979/vim-visual-multi",
  "https://github.com/kdheepak/lazygit.nvim.git",
  "ThePrimeagen/vim-be-good",
  "kmontocam/nvim-conda",
  "s1n7ax/nvim-window-picker",
  "MunifTanjim/prettier.nvim",
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
    config = function()
      require("mcphub").setup()
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
