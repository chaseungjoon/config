#!/usr/bin/env bash
# Small Bluetooth dropdown (rofi), anchored under the bar like the other menus.
# Pairing PIN/confirm prompts are handled by blueman-applet's agent.
menu="$(dirname "$0")/menu.sh"

notify() {  # notify <title> <body>
  gdbus call --session --dest org.freedesktop.Notifications \
    --object-path /org/freedesktop/Notifications --method org.freedesktop.Notifications.Notify \
    "Bluetooth" 0 "bluetooth" "$1" "$2" '[]' '{}' 3000 >/dev/null 2>&1
}

dev_path() { echo "/org/bluez/hci0/dev_${1//:/_}"; }
call()     { busctl --timeout=30 call org.bluez "$(dev_path "$1")" org.bluez.Device1 "$2" 2>&1; }

if ! bluetoothctl show | grep -q 'Powered: yes'; then
  choice=$(printf '󰂯  Turn Bluetooth on\n' | "$menu" "󰂲 Bluetooth" -theme-str 'listview { lines: 1; }') || exit
  rfkill unblock bluetooth; bluetoothctl power on >/dev/null; sleep 1; exec "$0"
fi

if [[ $1 == scan ]]; then
  notify "Scanning…" "Looking for nearby devices"
  bluetoothctl --timeout 8 scan on >/dev/null 2>&1
fi

# Build list: connected first, then paired, then nearby (named only)
connected="" paired="" nearby=""
while read -r _ mac name; do
  [[ -z $mac || $name =~ ^([0-9A-F]{2}-){5}[0-9A-F]{2}$ ]] && continue
  info=$(bluetoothctl info "$mac")
  if   grep -q 'Connected: yes' <<<"$info"; then connected+="󰂱  $name  (connected)"$'\t'"$mac"$'\n'
  elif grep -q 'Paired: yes'    <<<"$info"; then paired+="󰂯  $name"$'\t'"$mac"$'\n'
  else                                             nearby+="󰂰  $name  (new)"$'\t'"$mac"$'\n'
  fi
done < <(bluetoothctl devices | grep "^Device ")
devices="$connected$paired$nearby"

choice=$(printf '%s󰑓  Scan for devices\n󰂲  Turn Bluetooth off\n󰒓  Bluetooth settings\n' "$devices" \
  | cut -f1 | "$menu" "󰂯 Bluetooth") || exit

case "$choice" in
  *"Scan for devices")   exec "$0" scan ;;
  *"Turn Bluetooth off") bluetoothctl power off >/dev/null ;;
  *"Bluetooth settings") blueman-manager & ;;
  *)
    mac=$(printf '%s' "$devices" | awk -F'\t' -v c="$choice" '$1 == c {print $2}')
    [[ -z $mac ]] && exit
    name=$(sed -E 's/^\S+  //; s/  \((connected|new)\)$//' <<<"$choice")
    (
      if [[ $choice == *"(connected)" ]]; then
        out=$(call "$mac" Disconnect) && notify "Disconnected" "$name" || notify "Couldn't disconnect" "$name: $out"
      else
        if [[ $choice == *"(new)" ]]; then
          notify "Pairing…" "$name"
          out=$(call "$mac" Pair) || { notify "Pairing failed" "$name: $out"; exit; }
          bluetoothctl trust "$mac" >/dev/null
        fi
        notify "Connecting…" "$name"
        out=$(call "$mac" Connect) && notify "Connected" "$name" || notify "Couldn't connect" "$name: $out"
      fi
    ) &
    ;;
esac
