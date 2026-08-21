return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        copilot = {
          mason = false,
        },
      },
    },
  },
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        watch = true,
        tools = {
          codex = {
            cmd = { vim.fn.expand("~/.local/bin/codex") },
          },
          gemini = {
            cmd = { vim.fn.expand("~/.local/bin/gemini") },
          },
          grok = {
            cmd = { vim.fn.expand("~/.grok/bin/grok") },
          },
        },
      },
    },
    keys = {
      {
        "<leader>ao",
        function()
          require("sidekick.cli").select({ filter = { installed = true } })
        end,
        desc = "Open an AI CLI",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Send an AI prompt",
      },
      {
        "<leader>af",
        function()
          require("sidekick.cli").send({ msg = "{file}" })
        end,
        desc = "Send current file to AI CLI",
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send({ msg = "{selection}" })
        end,
        mode = "x",
        desc = "Send selection to AI CLI",
      },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      {
        "ravitemer/codecompanion-history.nvim",
        commit = "eb99d256352144cf3b6a1c45608ec25544a0813d",
      },
    },
    opts = function(_, opts)
      opts.extensions = opts.extensions or {}
      opts.extensions.history = {
        enabled = true,
        opts = {
          auto_save = true,
          -- Title generation only supports HTTP adapters. Keep ACP chats
          -- token-free and let the history picker use its fallback title.
          auto_generate_title = false,
          picker = "snacks",
        },
      }
      return opts
    end,
  },
}
