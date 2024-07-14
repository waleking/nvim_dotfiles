vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- enable seamless integration between Neovim and the system clipboard.
vim.opt.clipboard:append("unnamedplus")

-- Disable automatic folding
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- Set foldlevel to a high value to keep folds open by default
vim.wo.foldlevel = 99
require("core.options")
require("core.keymaps")
require("core.plugins")
require("core.plugin_config")
