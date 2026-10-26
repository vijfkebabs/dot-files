-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local uv = vim.uv or vim.loop
local watcher = uv.new_fs_event()
local pending = false

watcher:start(vim.fn.stdpath("config") .. "/colors", {}, vim.schedule_wrap(function(err, fname)
  if err or fname ~= "wallust.lua" or pending then return end
  pending = true
  vim.defer_fn(function()
    pending = false
    vim.cmd.colorscheme("wallust")
  end, 100)
end))