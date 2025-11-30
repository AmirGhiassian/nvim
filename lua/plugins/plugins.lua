return {
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  "https://github.com/eatgrass/maven.nvim",
  "https://github.com/mfussenegger/nvim-jdtls",
  { "pmizio/typescript-tools.nvim" },
  "EdenEast/nightfox.nvim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "mg979/vim-visual-multi" },
  "https://github.com/kdheepak/lazygit.nvim.git",
  "ThePrimeagen/vim-be-good",
  "kmontocam/nvim-conda",
  "s1n7ax/nvim-window-picker",
  "MunifTanjim/prettier.nvim",

  {
    "SmiteshP/nvim-navbuddy",
    dependencies = { "SmiteshP/nvim-navic", "MunifTanjim/nui.nvim" },
    opts = { lsp = { auto_attach = true } },
  },

  {
    "rest-nvim/rest.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        vim.list_extend(opts.ensure_installed, { "http" })
      end,
    },
  },
  {
    "vhyrro/luarocks.nvim",
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }, -- Specify LuaRocks packages to install
    },
  },

  {
    "ravitemer/mcphub.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    build = "npm install -g mcp-hub@latest",
    config = true,
  },

  {
    "swaits/lazyjj.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    rag_service = {
      enabled = false,
      host_mount = vim.fn.expand("~"),
      runner = "docker",
      llm = {
        provider = "openai",
        endpoint = "https://api.openai.com/v1",
        api_key = "OPENAI_API_KEY",
        model = "gpt-4o-mini",
      },
      embed = {
        provider = "openai",
        endpoint = "https://api.openai.com/v1",
        api_key = "OPENAI_API_KEY",
        model = "text-embedding-3-large",
      },
      docker_extra_args = "",
    },
    opts = {
      provider = "openai",
      providers = {
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-sonnet-4-20250514",
          timeout = 30000,
          extra_request_body = { temperature = 0.75, max_tokens = 20480 },
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-mini/mini.pick",
      "nvim-telescope/telescope.nvim",
      "ibhagwan/fzf-lua",
      "folke/snacks.nvim",
      {
        "hrsh7th/nvim-cmp",
        init = function()
          LazyVim.on_very_lazy(function()
            vim.diagnostic.enable()
            require("cmp").setup({ enabled = true })
          end)
        end,
        opts = function(_, opts)
          opts.enabled = function()
            return not (LazyVim.config.disabled and LazyVim.config.disabled.cmp)
          end
          return opts
        end,
        keys = {
          {
            "<leader>ua",
            function()
              LazyVim.config.disabled = LazyVim.config.disabled or {}
              LazyVim.config.disabled.cmp = not LazyVim.config.disabled.cmp
              require("cmp").setup({ enabled = not LazyVim.config.disabled.cmp })

              LazyVim.info(
                LazyVim.config.disabled.cmp and "Autocompletion disabled" or "Autocompletion enabled",
                { title = "Toggle" }
              )
            end,
            desc = "Toggle Autocompletion",
          },
          {
            "<leader>ud",
            function()
              LazyVim.config.disabled = LazyVim.config.disabled or {}
              LazyVim.config.disabled.diagnostics = not LazyVim.config.disabled.diagnostics

              if LazyVim.config.disabled.diagnostics then
                vim.diagnostic.disable()
                LazyVim.info("Diagnostics disabled", { title = "Toggle" })
              else
                vim.diagnostic.enable()
                LazyVim.info("Diagnostics enabled", { title = "Toggle" })
              end
            end,
            desc = "Toggle Diagnostics",
          },
        },
      },
      {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
        opts = { image_support = true },
      },
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<CR>", desc = "Window Left" },
      { "<C-j>", "<cmd><C-U>TmuxNavigateDown<CR>", desc = "Window Down" },
      { "<C-k>", "<cmd><C-U>TmuxNavigateUp<CR>", desc = "Window Up" },
      { "<C-l>", "<cmd><C-U>TmuxNavigateRight<CR>", desc = "Window Right" },
      { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<CR>", desc = "Window Previous" },
    },
  },

  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = false,
        drag_and_drop = { insert_mode = true },
        use_absolute_path = true,
      },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = { file_types = { "markdown", "Avante" } },
    ft = { "markdown", "Avante" },
  },

  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
  },

  {
    "olimorris/codecompanion.nvim",
    opts = {},
    version = "17.33.0",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  },

  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" },
        },
        neorg = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "norg" },
        },
      },
      max_height_window_percentage = 50,
      window_overlap_clear_enabled = false,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      editor_only_render_when_focused = false,
      tmux_show_only_in_active_window = false,
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
    },
  },
  {
    "EthanJWright/vs-tasks.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
    },
    opts = {
      picker = "telescope", -- Use snacks.nvim picker instead of telescope
    },
    config = function()
      require("telescope").load_extension("vstask")
    end,
    autodetect = { -- auto load scripts
      npm = "on",
    },
    keys = {
      {
        "<leader>ct",
        "<cmd>lua require('telescope').extensions.vstask.tasks()<cr>",
        desc = "Run VS Task",
      },
      terminal = "toggleterm",
      term_opts = {
        vertical = {
          direction = "vertical",
          size = "80",
        },
        horizontal = {
          direction = "horizontal",
          size = "10",
        },
        current = {
          direction = "float",
        },
        tab = {
          direction = "tab",
        },
      },
    },
  },
  "j-hui/fidget.nvim",
  "andweeb/presence.nvim",
}
