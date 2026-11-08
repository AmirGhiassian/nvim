return {
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = false,
    config = function()
      local navigation = require("nvim-tmux-navigation")

      navigation.setup({
        disable_when_zoomed = false,
      })

      local normal_navigation = {
        ["<C-h>"] = navigation.NvimTmuxNavigateLeft,
        ["<C-j>"] = navigation.NvimTmuxNavigateDown,
        ["<C-k>"] = navigation.NvimTmuxNavigateUp,
        ["<C-l>"] = navigation.NvimTmuxNavigateRight,
        ["<C-\\>"] = navigation.NvimTmuxNavigateLastActive,
        ["<C-Space>"] = navigation.NvimTmuxNavigateNext,
      }

      local function set_normal_navigation()
        for key, navigate in pairs(normal_navigation) do
          vim.keymap.set("n", key, navigate, { silent = true, desc = "Navigate Neovim/tmux panes" })
        end
      end

      set_normal_navigation()

      -- LazyVim installs its own Ctrl-h/j/k/l mappings on VeryLazy, after
      -- eager plugins load. Reapply the tmux-aware mappings afterwards.
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        once = true,
        callback = set_normal_navigation,
      })

      -- Do not map Ctrl-h/j/k/l in terminal-input mode. This lets terminal
      -- programs (including a tmux session nested inside ToggleTerm) receive
      -- those keys directly. Normal mode remains tmux-aware via the mappings
      -- above; press Esc twice first when you want to navigate from Neovim.

      -- A simple alternative to the awkward built-in Ctrl-\\ Ctrl-n chord.
      vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], {
        noremap = true,
        desc = "Leave terminal mode",
      })
    end,
  },
}
