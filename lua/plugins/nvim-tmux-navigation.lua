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

      -- The plugin only handles normal mode. Explicitly leave terminal-input
      -- mode before invoking its commands so no manual Ctrl-\\ Ctrl-n is needed.
      local terminal_navigation = {
        ["<C-h>"] = [[<C-\><C-n><Cmd>NvimTmuxNavigateLeft<CR>]],
        ["<C-j>"] = [[<C-\><C-n><Cmd>NvimTmuxNavigateDown<CR>]],
        ["<C-k>"] = [[<C-\><C-n><Cmd>NvimTmuxNavigateUp<CR>]],
        ["<C-l>"] = [[<C-\><C-n><Cmd>NvimTmuxNavigateRight<CR>]],
        ["<C-Space>"] = [[<C-\><C-n><Cmd>NvimTmuxNavigateNext<CR>]],
      }

      for key, mapping in pairs(terminal_navigation) do
        vim.keymap.set("t", key, mapping, { silent = true, desc = "Navigate from terminal mode" })
      end

      -- A simple alternative to the awkward built-in Ctrl-\\ Ctrl-n chord.
      vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], {
        noremap = true,
        desc = "Leave terminal mode",
      })
    end,
  },
}
