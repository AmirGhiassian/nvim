-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local LazyVim = require("lazyvim.util")

LazyVim.config.disabled = LazyVim.config.disabled or {}
if LazyVim.config.disabled.cmp == nil then
  LazyVim.config.disabled.cmp = false
end
if LazyVim.config.disabled.diagnostics == nil then
  LazyVim.config.disabled.diagnostics = false
end
