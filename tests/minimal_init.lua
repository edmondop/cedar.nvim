-- Minimal init for testing
local data_path = vim.fn.stdpath("data")
local plenary_dir = data_path .. "/site/pack/vendor/start/plenary.nvim"
local treesitter_dir = data_path .. "/site/pack/vendor/start/nvim-treesitter"

vim.opt.rtp:append(".")
vim.opt.rtp:append(plenary_dir)
vim.opt.rtp:append(treesitter_dir)

vim.cmd("runtime plugin/plenary.vim")
vim.cmd("runtime plugin/nvim-treesitter.lua")

require("plenary.busted")
