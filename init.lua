-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("mcphub").setup({
  extensions = {
    codecompanion = {
      -- Show the mcp tool result in the chat buffer
      show_result_in_chat = true,
      make_vars = true, -- make chat #variables from MCP server resources
      make_slash_commands = true, -- make /slash_commands from MCP server prompts
    },
    avante = {
      make_slash_commands = true, -- make /slash commands from MCP server prompts
    },
  },
})

require("codecompanion").setup({
  strategies = {
    chat = {
      tools = {
        ["mcp"] = {
          -- calling it in a function would prevent mcphub from being loaded before it's needed
          callback = function()
            return require("mcphub.extensions.codecompanion")
          end,
          description = "Call tools and resources from the MCP Servers",
        },
      },
    },
  },
})

require("avante").setup({
  -- other config
  -- The system_prompt type supports both a string and a function that returns a string. Using a function here allows dynamically updating the prompt with mcphub
  system_prompt = function()
    local hub = require("mcphub").get_hub_instance()
    return hub:get_active_servers_prompt()
  end,
  -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
  custom_tools = function()
    return {
      require("mcphub.extensions.avante").mcp_tool(),
    }
  end,
})
