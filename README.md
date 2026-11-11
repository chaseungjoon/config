# Config

Neovim, tmux, Arch desktop styling, and two i3 themes.

Pick a destination in the last argument. Existing files are backed up under
`~/.local/state/config/`. For Arch and i3, the destination is a home directory.

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

Compare the i3 themes in [i3/](i3/).
