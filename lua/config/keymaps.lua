-- ~/.config/nvim/lua/config/keymaps.lua
-- Custom keymaps & toggles
local LazyVim = require("lazyvim.util")

-- Initialize state correctly
LazyVim.config.disabled = LazyVim.config.disabled or {}
if LazyVim.config.disabled.cmp == nil then
  LazyVim.config.disabled.cmp = false
end

-- Diagnostics toggle
if LazyVim.config.disabled.diagnostics == nil then
  LazyVim.config.disabled.diagnostics = false
end

vim.keymap.set("n", "<leader>ud", function()
  LazyVim.config.disabled.diagnostics = not LazyVim.config.disabled.diagnostics

  if LazyVim.config.disabled.diagnostics then
    vim.diagnostic.enable(false)
    LazyVim.info("Diagnostics disabled", { title = "Toggle" })
  else
    vim.diagnostic.enable()
    LazyVim.info("Diagnostics enabled", { title = "Toggle" })
  end

  vim.cmd("redraw")
end, { desc = "Toggle Diagnostics" })

vim.keymap.set("n", "<leader>uq", function()
  local LazyVim = require("lazyvim.util")

  LazyVim.config.disabled = LazyVim.config.disabled or {}
  LazyVim.config.disabled.cmp = not LazyVim.config.disabled.cmp

  local enabled = not LazyVim.config.disabled.cmp

  -- nvim-cmp
  local ok_cmp, cmp = pcall(require, "cmp")
  if ok_cmp then
    cmp.setup({ enabled = enabled })
  end

  -- Native Copilot inline completion and Sidekick next-edit suggestions
  if vim.lsp.inline_completion then
    vim.lsp.inline_completion.enable(enabled)
  end
  vim.g.sidekick_nes = enabled

  -- LSP inlay hints
  for _, client in ipairs(vim.lsp.get_clients()) do
    if client.server_capabilities.inlayHintProvider then
      if enabled then
        vim.lsp.inlay_hint.enable(true)
      else
        vim.lsp.inlay_hint.enable(false)
      end
    end
  end

  -- Optional: disable ghost text from cmp if using it
  if ok_cmp then
    cmp.setup({
      experimental = { ghost_text = enabled and {} or false },
    })
  end

  LazyVim.info(enabled and "Autocompletion enabled" or "Autocompletion disabled", { title = "Toggle" })

  vim.cmd("redraw")
end, { desc = "Toggle Completion and AI Suggestions" })

vim.keymap.set("n", "<leader>xw", function()
    for _, client in ipairs(vim.lsp.get_clients()) do
      require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
    end
end, { desc = "Workspace Diagnostics" })
