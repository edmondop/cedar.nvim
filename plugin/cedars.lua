-- Auto-setup cedars.nvim when plugin loads
if vim.g.loaded_cedars then
  return
end
vim.g.loaded_cedars = true

-- Only auto-setup if nvim-treesitter is available
if pcall(require, "nvim-treesitter") then
  require("cedars").setup()
end
