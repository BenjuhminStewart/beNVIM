-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.cmd.set('linebreak')
vim.cmd.set('noswapfile')

-- Lazy Package Manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
  { import = 'plugins.lazy' },
  { import = 'plugins.autoformat' },
}, {})
require('plugins.lsp')
require('options')
require('keymaps')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.completion')
