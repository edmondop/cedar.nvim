read_globals = {
  "vim",
}

-- Allow setting vim.g fields
files["plugin/cedar.lua"] = {
  globals = { "vim" },
}
