local M = {}

-- Register Cedar parser with nvim-treesitter
function M.setup()
  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

  parser_config.cedar = {
    install_info = {
      url = "https://github.com/chrnorm/tree-sitter-cedar",
      files = { "src/parser.c" },
      branch = "main",
    },
    maintainers = { "@edmondop" },
    filetype = "cedar",
  }

  -- Set up filetype detection
  vim.filetype.add({
    extension = {
      cedar = "cedar",
    },
  })
end

return M
