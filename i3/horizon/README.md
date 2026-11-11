# Horizon

Blue on near-black (`#2b5cff`, `#060a14`) with a 46 px glass Eww bar, rounded pills, Picom blur and animations, Inter and JetBrainsMono Nerd Font. Rofi, Dunst, the lock screen, and Xresources share the palette.

![Live top bar, including an agent status icon](../screenshots/horizon-bar.png)

The bar shows a launcher, per-monitor workspaces, focused app, clock, media, system tray, input language, network, Bluetooth, volume, notifications, and session power. The clock opens a calendar with a selectable world clock. The media pill opens album art, playback, seek, shuffle, repeat, and volume controls. The volume pill expands a slider on hover; the bar hides for fullscreen windows.

Each running Claude Code, Codex, or Copilot CLI terminal gets an icon: yellow working, red awaiting input, green done, grey ready. Hover for the task, project, model, elapsed state, context usage, and token counts; click to focus the terminal. The tracker reads local session data at runtime. Codex state is improved by the optional `eww/scripts/agent-hook` hook; no session data is included here.

`Super+R` opens apps, `Super+F1` searches keys, `Super+Shift+H` shows the keysheet, `Super+D` switches input language, `Super+Shift+W` picks a wallpaper, and `Super+Shift+D` toggles notifications. Vim keys focus, move, and resize windows. Other bindings cover screenshots, media, brightness, night light, monitor layout, clipboard, scratch terminal, and session power. See [`i3/config`](i3/config) for the full key list.

Install to your chosen home root: `curl -fsSL https://raw.githubusercontent.com/chaseungjoon/config/main/install.sh | bash -s -- i3-horizon "$HOME"`. This copies only this i3 tree and backs up replaced files. It expects i3, Ghostty, Eww, Picom v13, Rofi, Dunst, Feh, XSS-lock, xdotool, playerctl, WirePlumber, Fcitx5, and the commands used by the scripts. The `bin/` shims prefer system tools but some point to local builds under `~/.local/opt/i3-extras`; install those builds or change the shims. Set a wallpaper with `Super+Shift+W`; the original wallpaper is outside this repo.
