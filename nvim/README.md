# Neovim

Minimal, transparent Neovim with Tokyonight and lazy.nvim.

- Code: Coc LSP, Copilot, Treesitter, VimTeX.
- Navigation: Telescope, Neo-tree, surround.
- UI: alpha, lualine, render-markdown, transparent, autopairs.
- Support: plenary.

## Install

Requires Neovim ≥0.10, tree-sitter-cli, ripgrep, fd, lua-language-server,
and a Nerd Font. Change the last path to choose the config directory.

```sh
curl -fsSL https://raw.githubusercontent.com/chaseungjoon/config/main/install.sh | bash -s -- nvim "$HOME/.config/nvim"
```

Open Neovim to install plugins. Then set up Coc and Copilot:

```vim
:CocInstall coc-python coc-clangd coc-json
:Copilot setup
```

Configured language servers: pyright, clangd, coc-lua, coc-rust-analyzer.
The [Coc manifest](coc-extensions/package.json) records the listed extensions.

![Neovim screenshot 1](https://github.com/user-attachments/assets/fa80f757-4037-4a2e-9243-d6bac9484bc4)
![Neovim screenshot 2](https://github.com/user-attachments/assets/7c2d9266-0a63-4bee-94a2-79dcdaadd6dc)

Original repository: [nvim.config](https://github.com/chaseungjoon/nvim.config).
