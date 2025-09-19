local cedars = require("cedars")

describe("cedars.nvim", function()
  it("can be required without errors", function()
    assert.is_not_nil(cedars)
    assert.is_function(cedars.setup)
  end)

  it("registers cedar parser config", function()
    cedars.setup()

    local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
    assert.is_not_nil(parser_configs.cedar)
    assert.is_equal(
      "https://github.com/chrnorm/tree-sitter-cedar",
      parser_configs.cedar.install_info.url
    )
  end)

  it("sets up filetype detection", function()
    cedars.setup()

    -- Test that .cedar files are detected correctly
    vim.cmd("edit test.cedar")
    assert.is_equal("cedar", vim.bo.filetype)
    vim.cmd("bdelete!")
  end)
end)
