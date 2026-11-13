#!/usr/bin/env bash
menu="$(dirname "$0")/menu.sh"

default=$(pactl get-default-sink)
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)
muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

# "name<TAB>description" for every output device
sinks=$(pactl list sinks | awk -F': ' '/^\tName:/{n=$2} /^\tDescription:/{d=$2; sub(/.*\(HD Audio\) /, "", d); print n "\t" d}')

opts="$( [[ $muted == yes ]] && echo "󰕾  Unmute" || echo "󰝟  Mute" )"
opts+=$'\n'"󰝝  Volume up"$'\n'"󰝞  Volume down"
while IFS=$'\t' read -r name desc; do
  [[ $name == "$default" ]] && opts+=$'\n'"󰓃  $desc  " || opts+=$'\n'"󰓃  $desc"
done <<<"$sinks"
opts+=$'\n'"󰒓  Open mixer"

choice=$(printf '%s\n' "$opts" | "$menu" "󰕾 $vol") || exit

case "$choice" in
  *Unmute|*Mute)   pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
  *"Volume up")    pactl set-sink-volume @DEFAULT_SINK@ +5%; exec "$0" ;;
  *"Volume down")  pactl set-sink-volume @DEFAULT_SINK@ -5%; exec "$0" ;;
  *"Open mixer")   pavucontrol & ;;
  *)
    desc=$(sed -E 's/^󰓃  //; s/  $//' <<<"$choice")
    name=$(awk -F'\t' -v d="$desc" '$2 == d {print $1}' <<<"$sinks")
    [[ -n $name ]] && pactl set-default-sink "$name"
    ;;
esac
