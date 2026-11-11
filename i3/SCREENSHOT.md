# Adding Amber screenshots

1. Open a terminal and Rofi with the i3blocks bar visible. Hide private window
   titles, usernames, network names, and notifications.
2. Press `Print` (or run `~/.config/i3/scripts/screenshot`) to save
   `amber-desktop.png`, then a bar-only crop as `amber-bar.png`.
3. Put both in `i3/screenshots/` and check them for private details. Only crop
   or redact; don't otherwise edit.
4. Add `screenshots/amber-desktop.png` to `i3/README.md` and
   `../screenshots/amber-bar.png` to `i3/amber/README.md`.
