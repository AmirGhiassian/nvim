-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- vim.g.moonflyTransparent = true

local uname = (vim.uv or vim.loop).os_uname()
local is_windows = vim.fn.has("win32") == 1
local is_wsl = vim.fn.has("wsl") == 1 or uname.release:lower():find("microsoft", 1, true) ~= nil
local is_macos = vim.fn.has("macunix") == 1

if is_windows or is_wsl then
  -- Use the Windows clipboard from native Windows or WSL, including inside tmux.
  vim.g.clipboard = {
    name = "win32yank",
    copy = {
      ["+"] = { "win32yank.exe", "-i", "--crlf" },
      ["*"] = { "win32yank.exe", "-i", "--crlf" },
    },
    paste = {
      ["+"] = { "win32yank.exe", "-o", "--lf" },
      ["*"] = { "win32yank.exe", "-o", "--lf" },
    },
    cache_enabled = 0,
  }
elseif is_macos then
  vim.g.clipboard = {
    name = "macOS-clipboard",
    copy = {
      ["+"] = { "pbcopy" },
      ["*"] = { "pbcopy" },
    },
    paste = {
      ["+"] = { "pbpaste" },
      ["*"] = { "pbpaste" },
    },
    cache_enabled = 0,
  }
end

vim.opt.clipboard = "unnamedplus"
