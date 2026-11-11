# Config

Neovim, tmux, and two i3 themes. Each command installs its selected config from a downloaded snapshot. Replace the final path to choose the destination; existing files are backed up under `~/.local/state/config/`.

## Install

### [Neovim](nvim/)

```sh
curl -fsSL https://raw.githubusercontent.com/chaseungjoon/config/main/install.sh | bash -s -- nvim "$HOME/.config/nvim"
```

### [tmux](tmux/)

```sh
curl -fsSL https://raw.githubusercontent.com/chaseungjoon/config/main/install.sh | bash -s -- tmux "$HOME/.tmux.conf"
```

### [Arch desktop theme](arch/)

```sh
curl -fsSL https://raw.githubusercontent.com/chaseungjoon/config/main/install.sh | bash -s -- arch "$HOME"
```

### [i3: Amber](i3/amber/)

```sh
curl -fsSL https://raw.githubusercontent.com/chaseungjoon/config/main/install.sh | bash -s -- i3-amber "$HOME"
```

### [i3: Horizon](i3/horizon/)

```sh
curl -fsSL https://raw.githubusercontent.com/chaseungjoon/config/main/install.sh | bash -s -- i3-horizon "$HOME"
```

For Arch and i3, the destination is a home root. See [i3](i3/) to compare the themes.
