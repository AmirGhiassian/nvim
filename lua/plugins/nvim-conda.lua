return {
  "kmontocam/nvim-conda",
  enabled = function()
    return vim.fn.executable("conda") == 1
  end,
}
