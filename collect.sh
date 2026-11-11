#!/usr/bin/env bash
# collect.sh: refresh arch/home from this machine's $HOME.
#
# Only files already tracked under arch/home are updated; nothing new is
# added, so the repo's scope stays as it is. Review and push with:
#   ./collect.sh && git diff
set -euo pipefail

repo=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
src_home=${1:-$HOME}

# Repo files whose live copy has a different name.
declare -A live_name=(
  [.local/share/backgrounds/amber-wallpaper.png]=.local/share/backgrounds/retro-x220.png
  [.local/share/backgrounds/amber-lock.png]=.local/share/backgrounds/retro-x220-lock.png
)

say() { printf '\033[38;5;214m::\033[0m %s\n' "$*"; }

changed=0
while IFS= read -r -d '' file; do
  rel=${file#arch/home/}
  live="$src_home/${live_name[$rel]:-$rel}"
  if [[ ! -f $live ]]; then
    say "skip (missing): ${live/#$HOME/\~}"
  elif ! cmp -s "$live" "$repo/$file"; then
    cp "$live" "$repo/$file"
    say "updated: $file"
    changed=$((changed + 1))
  fi
done < <(git -C "$repo" ls-files -z arch/home)

if ((changed)); then
  say "$changed file(s) updated; review with: git -C '$repo' diff"
else
  say "arch/home is up to date"
fi
