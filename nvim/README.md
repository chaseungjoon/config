# Neovim

Minimal, transparent Neovim on lazy.nvim with the Tokyonight theme.

![Neovim](https://github.com/user-attachments/assets/fa80f757-4037-4a2e-9243-d6bac9484bc4)

## Plugins

| | |
| --- | --- |
| **Code** | Coc (LSP), Copilot, Treesitter, VimTeX, autopairs, surround |
| **Navigation** | Telescope, Neo-tree |
| **UI** | alpha, lualine, render-markdown, transparent |

## Install

```sh
curl -fsSL https://raw.githubusercontent.com/chaseungjoon/config/main/install.sh | bash -s -- nvim "$HOME/.config/nvim"
```

**Requires:** Neovim 0.10+, tree-sitter-cli, ripgrep, fd, lua-language-server,
and a Nerd Font.

Open Neovim to install the plugins, then set up Coc and Copilot:

```vim
:CocInstall coc-python coc-clangd coc-json
:Copilot setup
```

Language servers are configured for pyright, clangd, coc-lua, and
coc-rust-analyzer. The full extension list is in
[`coc-extensions/package.json`](coc-extensions/package.json).

![Neovim editing](https://github.com/user-attachments/assets/7c2d9266-0a63-4bee-94a2-79dcdaadd6dc)
