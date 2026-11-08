local terminals = {}

local function toggle_terminal(name, options)
  if not terminals[name] then
    terminals[name] = require("toggleterm.terminal").Terminal:new(options)
  end

  local size = type(options.size) == "function" and options.size() or options.size
  terminals[name]:toggle(size)
end

local function terminal_toggle(name, options)
  return function()
    toggle_terminal(name, options)
  end
end

local floating_terminal = terminal_toggle("floating", {
  direction = "float",
  display_name = "Floating Terminal",
})

local horizontal_terminal = terminal_toggle("horizontal", {
  direction = "horizontal",
  size = 15,
  display_name = "Horizontal Terminal",
})

local vertical_terminal = terminal_toggle("vertical", {
  direction = "vertical",
  size = function()
    return math.floor(vim.o.columns * 0.4)
  end,
  display_name = "Vertical Terminal",
})

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
      { "<C-/>", floating_terminal, desc = "Floating Terminal", mode = { "n", "t" } },
      { "<M-h>", horizontal_terminal, desc = "Horizontal Terminal", mode = { "n", "t" } },
      { "<M-v>", vertical_terminal, desc = "Vertical Terminal", mode = { "n", "t" } },
      { "<leader>Tf", floating_terminal, desc = "Floating Terminal" },
      { "<leader>Th", horizontal_terminal, desc = "Horizontal Terminal" },
      { "<leader>Tv", vertical_terminal, desc = "Vertical Terminal" },
      { "<leader>Tt", "<cmd>4ToggleTerm direction=tab<cr>", desc = "Terminal Tab" },
      { "<leader>Ts", "<cmd>TermSelect<cr>", desc = "Select Terminal" },
      { "<leader>Ta", "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle All Terminals" },
    },
  },
}
