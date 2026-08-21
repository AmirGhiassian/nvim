return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm", "ToggleTermToggleAll", "TermExec", "TermSelect" },
    opts = {
      size = function(term)
        return term.direction == "horizontal" and 15 or math.floor(vim.o.columns * 0.4)
      end,
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "rounded",
        winblend = 3,
      },
    },
    keys = {
      { "<C-/>", "<cmd>1ToggleTerm direction=float<cr>", desc = "Floating Terminal", mode = { "n", "t" } },
      { "<leader>Tf", "<cmd>1ToggleTerm direction=float<cr>", desc = "Floating Terminal" },
      { "<leader>Th", "<cmd>2ToggleTerm direction=horizontal size=15<cr>", desc = "Horizontal Terminal" },
      { "<leader>Tv", "<cmd>3ToggleTerm direction=vertical size=60<cr>", desc = "Vertical Terminal" },
      { "<leader>Tt", "<cmd>4ToggleTerm direction=tab<cr>", desc = "Terminal Tab" },
      { "<leader>Ts", "<cmd>TermSelect<cr>", desc = "Select Terminal" },
      { "<leader>Ta", "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle All Terminals" },
    },
  },
}
