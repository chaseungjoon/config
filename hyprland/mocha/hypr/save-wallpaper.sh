#!/usr/bin/env bash
# Called by Waypaper after a wallpaper change; persist it for the next login.
set -euo pipefail
[[ -n ${1:-} ]] || exit 0
printf 'wallpaper {\n    monitor =\n    path = %s\n    fit_mode = cover\n}\n\nsplash = false\n' "$1" \
    > "$HOME/.config/hypr/hyprpaper.conf"
