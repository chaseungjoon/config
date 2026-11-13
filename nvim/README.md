# Neovim

Minimal, transparent Neovim on lazy.nvim with the Tokyonight theme. One config
for macOS and Linux.

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

**Requires:** Neovim 0.12+, tree-sitter-cli, ripgrep, fd, lua-language-server,
a C compiler, and a Nerd Font.

| | macOS | Linux |
| --- | --- | --- |
| **LaTeX** | MacTeX | TinyTeX in `~/.TinyTeX` |
| **PDF viewer** | Skim | Zathura, else `xdg-open` |

The config detects the OS at startup and picks the paths and viewer itself.

Open Neovim to install the plugins, then set up Coc and Copilot:

```vim
:CocInstall coc-python coc-clangd coc-json
:Copilot setup
```

Language servers are configured for pyright, clangd, coc-lua, and
coc-rust-analyzer. The full extension list is in
[`coc-extensions/package.json`](coc-extensions/package.json).
