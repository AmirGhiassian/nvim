return {
  "github/copilot.vim",
  init = function()
    -- Initialize copilot disabled state to match cmp disabled state
    vim.g.copilot_disabled = vim.g.cmp_disabled or false
    
    -- Set copilot to not auto-trigger if disabled
    if vim.g.copilot_disabled then
      vim.g.copilot_enabled = false
    end
  end,
  config = function()
    -- Additional copilot configuration
    -- Disable copilot by default in certain filetypes
    vim.g.copilot_filetypes = {
      ["*"] = not vim.g.copilot_disabled,
    }
  end,
}
