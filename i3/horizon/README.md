# Horizon

Blue glass i3 for AI native workflows. A 46 px Eww bar, rounded pills,
Picom blur and animations, Inter and JetBrainsMono Nerd Font.
Rofi, Dunst, the lock screen, and Xresources share the palette
(`#2b5cff` on `#060a14`).

![Live top bar, including an agent status icon](../screenshots/horizon-bar.png)

## Bar

- **Left:** launcher, per-monitor workspaces, focused app, agent icons.
- **Center:** clock and media. Click for a calendar and world clock, or
  album art, playback, seek, shuffle, repeat, and volume.
- **Right:** system tray, input language, network, Bluetooth, volume,
  notifications, and power. Volume expands on hover.
- The bar hides for fullscreen windows.

## Agent tracking

Claude Code, Codex, and Copilot CLI sessions appear as icons: yellow working,
red awaiting input, green done, grey ready. Hover for task, project, model,
elapsed time, context use, and tokens; click to focus the terminal.
The tracker reads local sessions at runtime. The optional
[`agent-hook`](i3/eww/scripts/agent-hook) improves Codex state detection.

## Keys

`Super+R` apps · `Super+F1` key search · `Super+Shift+H` keysheet ·
`Super+D` input language · `Super+Shift+W` wallpaper ·
`Super+Shift+D` notifications. Vim keys focus, move, and resize windows.
See [`i3/config`](i3/config) for screenshots, media, brightness,
night light, monitors, clipboard, scratch terminal, and power.

## Install

The last path is a home directory.

```sh
curl -fsSL https://raw.githubusercontent.com/chaseungjoon/config/main/install.sh | bash -s -- i3-horizon "$HOME"
```

Requires i3, Ghostty, Eww, Picom v13, Rofi, Dunst, Feh, XSS-lock,
xdotool, playerctl, WirePlumber, Fcitx5, and the scripts' commands.
Some `bin/` shims expect local builds under `~/.local/opt/i3-extras`.
Set a wallpaper with `Super+Shift+W`; the original is not included.
