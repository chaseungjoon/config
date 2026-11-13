#!/usr/bin/env bash
menu="$(dirname "$0")/menu.sh"

if [[ $(nmcli radio wifi) == enabled ]]; then
  toggle="󰤭  Turn Wi-Fi off"
  nmcli dev wifi rescan 2>/dev/null
  list=$(nmcli -t -f IN-USE,SIGNAL,SECURITY,SSID dev wifi list | awk -F: '
    $4 != "" && !seen[$4]++ {
      s = $2+0
      icon = s>80 ? "󰤨" : s>60 ? "󰤥" : s>40 ? "󰤢" : s>20 ? "󰤟" : "󰤯"
      lock = ($3 == "" || $3 == "--") ? "  " : "󰌾 "
      mark = ($1 == "*") ? "  " : ""
      printf "%s  %s%s%s\n", icon, lock, $4, mark
    }')
else
  toggle="󰤨  Turn Wi-Fi on"
fi

choice=$(printf '%s\n%s\n󰒓  Advanced settings\n' "$list" "$toggle" | sed '/^$/d' | "$menu" "󰤨 Wi-Fi") || exit

case "$choice" in
  *"Turn Wi-Fi off") nmcli radio wifi off ;;
  *"Turn Wi-Fi on")  nmcli radio wifi on ;;
  *"Advanced settings") nm-connection-editor & ;;
  *)
    ssid=$(sed -E 's/^\S+  (󰌾 |  )//; s/  $//' <<<"$choice")
    if nmcli -t -f NAME con show | grep -Fxq "$ssid"; then
      nmcli con up id "$ssid"
    elif [[ $choice == *󰌾* ]]; then
      pass=$(rofi -dmenu -password -p " $ssid" -theme-str 'window { width: 340px; } listview { enabled: false; }' </dev/null) || exit
      nmcli dev wifi connect "$ssid" password "$pass"
    else
      nmcli dev wifi connect "$ssid"
    fi
    ;;
esac
