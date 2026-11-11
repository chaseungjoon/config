# Neovim

Minimal transparent setup with lazy.nvim, Coc LSP, Copilot, Telescope, Treesitter, Neo-tree, VimTeX, and Tokyonight. Other plugins: alpha, autopairs, lualine, plenary, render-markdown, surround, transparent.

Requires Neovim ≥0.10, tree-sitter-cli, ripgrep, fd, lua-language-server, and a Nerd Font. LSPs: pyright, clangd, coc-lua, coc-rust-analyzer. The imported Coc manifest also lists coc-python, coc-clangd, and coc-json.

Install to your chosen directory: `curl -fsSL https://raw.githubusercontent.com/chaseungjoon/config/main/install.sh | bash -s -- nvim "$HOME/.config/nvim"`. Open Neovim to install plugins; use `:CocInstall coc-python coc-clangd coc-json` and `:Copilot setup` for those integrations.

![Neovim screenshot 1](https://github.com/user-attachments/assets/fa80f757-4037-4a2e-9243-d6bac9484bc4)
![Neovim screenshot 2](https://github.com/user-attachments/assets/7c2d9266-0a63-4bee-94a2-79dcdaadd6dc)

Original repository: [nvim.config](https://github.com/chaseungjoon/nvim.config).
