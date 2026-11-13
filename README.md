# config

| Config | Description |
| --- | --- |
| [**nvim**](nvim/) | Transparent Neovim with Tokyonight, Coc, Copilot, and Telescope |
| [**tmux**](tmux/) | Plugin-free tmux with a minimal top status bar |
| [**arch**](arch/) | AMBER-76 theme for Kitty, Rofi, Dunst, GTK, and more |
| [**i3-amber**](i3/amber/) | Low-motion i3 with an i3blocks bar, built for older hardware |
| [**i3-horizon**](i3/horizon/) | Blue-glass i3 with an Eww bar that tracks AI agent sessions |
| [**hyprland-mocha**](hyprland/mocha/) | Catppuccin Hyprland with a floating Waybar and Rofi menus |


## Install

```sh
curl -fsSL https://raw.githubusercontent.com/chaseungjoon/config/main/install.sh | bash -s -- <config> <destination>
```

| Config | Destination |
| --- | --- |
| `nvim` | `$HOME/.config/nvim` |
| `tmux` | `$HOME/.tmux.conf` |
| `arch`, `i3-amber`, `i3-horizon`, `hyprland-mocha` | `$HOME` |

Destinations must be absolute. Files that would be overwritten are first moved to `~/.local/state/config/`.

Run `./install.sh` from a clone to install your local copy.
Run `./collect.sh` to copy this machine's live Arch theme files back into
`arch/home`.

## License

[MIT](LICENSE)
