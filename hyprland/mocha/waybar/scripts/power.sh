#!/usr/bin/env bash
menu="$(dirname "$0")/menu.sh"

choice=$(printf '󰐥  Shut down\n󰜉  Restart\n󰍃  Log out\n' \
  | "$menu" "󰐥 Power" -theme-str 'listview { lines: 3; }') || exit

case "$choice" in
  *"Shut down") systemctl poweroff ;;
  *"Restart")   systemctl reboot ;;
  *"Log out")   command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()' ;;
esac
