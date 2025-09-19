# cedars.nvim

A Neovim plugin that adds Cedar policy language support with tree-sitter integration.

## Features

- 🌳 Tree-sitter parsing for Cedar policy language
- 🎨 Syntax highlighting
- 📁 Code folding
- 📄 Automatic filetype detection for `.cedar` files

## Requirements

- Neovim 0.9+
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## Installation

### With [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'edmondop/cedars.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('cedars').setup()
  end,
}
```

### With [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'edmondop/cedars.nvim',
  requires = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('cedars').setup()
  end,
}
```

### With [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'edmondop/cedars.nvim'
```

Then add to your `init.lua`:
```lua
require('cedars').setup()
```

## Setup

After installation, run:

```vim
:TSInstall cedar
```

This will download and compile the Cedar tree-sitter parser.

## Usage

The plugin automatically detects `.cedar` files and applies syntax highlighting.

### Example Cedar Policy

```cedar
@annotation("Employee file access")
permit(
  principal in Role::"Employees",
  action in [Action::"read", Action::"write"],
  resource in Folder::"documents"
) when {
  context.time >= "09:00" &&
  context.time <= "17:00" &&
  principal.department == resource.owner_department
};

forbid(
  principal,
  action == Action::"delete",
  resource
) when {
  resource.classification == "critical" &&
  !principal.has("admin_privileges")
};
```

## Configuration

The plugin works out of the box with default settings. For advanced configuration:

```lua
require('cedars').setup({
  -- Add any custom configuration here
})
```

## Cedar Language Reference

Cedar is an open-source policy language for fine-grained access control. Learn more:

- [Cedar Documentation](https://docs.cedarpolicy.com/)
- [Cedar GitHub Repository](https://github.com/cedar-policy)
- [Tree-sitter Cedar Grammar](https://github.com/chrnorm/tree-sitter-cedar)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT License