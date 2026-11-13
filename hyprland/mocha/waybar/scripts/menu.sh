#!/usr/bin/env bash
# Shared rofi dropdown, anchored under the bar's top-right corner.
# usage: menu.sh "<prompt>" [extra rofi args...]  (options on stdin)
prompt="$1"; shift
rofi -dmenu -i -p "$prompt" -no-custom "$@" -theme-str '
  window   { location: north east; anchor: north east; x-offset: -10px; y-offset: 54px; width: 360px; }
  listview { lines: 8; fixed-height: false; }
  entry    { placeholder: ""; }'
