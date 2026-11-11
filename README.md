# Config

Replace the last path with your destination. `curl` installs back up replaced files under `~/.local/state/config/`.

- [Neovim](nvim/): `curl -fsSL https://raw.githubusercontent.com/chaseungjoon/config/main/install.sh | bash -s -- nvim "$HOME/.config/nvim"`
- [tmux](tmux/): `curl -fsSL https://raw.githubusercontent.com/chaseungjoon/config/main/install.sh | bash -s -- tmux "$HOME/.tmux.conf"`
- [Arch desktop theme](arch/): `curl -fsSL https://raw.githubusercontent.com/chaseungjoon/config/main/install.sh | bash -s -- arch "$HOME"`
- [i3: Amber](i3/amber/): `curl -fsSL https://raw.githubusercontent.com/chaseungjoon/config/main/install.sh | bash -s -- i3-amber "$HOME"`
- [i3: Horizon](i3/horizon/): `curl -fsSL https://raw.githubusercontent.com/chaseungjoon/config/main/install.sh | bash -s -- i3-horizon "$HOME"`

For Arch and i3, the destination is a home root. See [i3](i3/) for the two themes.
