-- Auto-setup cedar.nvim when plugin loads
if vim.g.loaded_cedar then
  return
end
vim.g.loaded_cedar = true

-- Only auto-setup if nvim-treesitter is available
if pcall(require, "nvim-treesitter") then
  require("cedar").setup()
end
