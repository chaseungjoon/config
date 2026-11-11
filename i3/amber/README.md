# Amber

Low motion i3 for constrained hardware. Amber on charcoal (`#ffb000`,
`#1c1b19`), Terminess Nerd Font, square edges, and a 20 px i3blocks bar.

![Amber screenshot pending](../screenshots/amber-placeholder.svg)

## What it does

- **Bar:** CPU, memory, disk, temperature, volume, brightness, battery,
  date, and time. Blocks have click and scroll actions.
- **Desktop:** Rofi, autotiling, workspaces, floating rules, wallpaper picker,
  screenshots, OSD, night light, monitor switching, lock and power menus.
- **Keys:** searchable keysheet; see [`i3/config`](i3/config).

## Install

The last path is a home directory. This also installs the
[Arch desktop theme](../../arch/).

```sh
curl -fsSL https://raw.githubusercontent.com/chaseungjoon/config/main/install.sh | bash -s -- i3-amber "$HOME"
```

Requires i3, i3blocks, Kitty, Rofi, Dunst, Feh, Azote, and the commands
used by the scripts. Adjust display, battery, and touchpad names.

Replace the placeholder using [SCREENSHOT.md](../SCREENSHOT.md).
