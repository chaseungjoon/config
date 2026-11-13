#!/usr/bin/env bash
set -euo pipefail

usage() {
  printf 'Usage: %s {nvim|tmux|arch|i3-amber|i3-horizon|hyprland-mocha} ABSOLUTE_DESTINATION\n' "$0" >&2
  exit 2
}

target=${1:-}
dest=${2:-}
[[ $# == 2 && $dest == /* ]] || usage

# A local checkout uses its own files. A curl-piped script downloads a snapshot.
script_path=${BASH_SOURCE[0]:-}
if [[ -n $script_path && -f $script_path ]]; then
  root=$(cd "$(dirname "$script_path")" && pwd)
else
  command -v curl >/dev/null && command -v tar >/dev/null || {
    printf 'curl and tar are required\n' >&2; exit 1;
  }
  root=$(mktemp -d)
  trap 'rm -rf "$root"' EXIT
  curl -fsSL "${CONFIG_ARCHIVE_URL:-https://codeload.github.com/chaseungjoon/config/tar.gz/refs/heads/main}" |
    tar -xz --strip-components=1 -C "$root"
fi

backup="$HOME/.local/state/config/$(date +%Y%m%d-%H%M%S)-$$"

copy_file() {
  local src=$1 dst=$2
  if [[ -e $dst || -L $dst ]]; then
    if cmp -s "$src" "$dst"; then return; fi
    mkdir -p "$(dirname "$backup/${dst#/}")"
    mv "$dst" "$backup/${dst#/}"
  fi
  mkdir -p "$(dirname "$dst")"
  cp -p "$src" "$dst"
  printf '%s\n' "$dst"
}

copy_tree() {
  local src=$1 dst=$2 skip=${3:-} file
  while IFS= read -r -d '' file; do
    [[ ${file##*/} == README.md ]] && continue
    [[ -n $skip && $file == "$src/$skip/"* ]] && continue
    copy_file "$file" "$dst/${file#"$src"/}"
  done < <(find "$src" -type f -print0)
}

case $target in
  nvim) copy_tree "$root/nvim" "$dest" coc-extensions ;;
  tmux) copy_file "$root/tmux/.tmux.conf" "$dest" ;;
  arch) copy_tree "$root/arch/home" "$dest" ;;
  i3-amber)
    copy_tree "$root/arch/home" "$dest"
    copy_tree "$root/i3/amber/i3" "$dest/.config/i3"
    copy_tree "$root/i3/amber/i3blocks" "$dest/.config/i3blocks"
    ;;
  i3-horizon) copy_tree "$root/i3/horizon/i3" "$dest/.config/i3" ;;
  hyprland-mocha)
    for app in hypr waybar rofi kitty swayosd waypaper; do
      copy_tree "$root/hyprland/mocha/$app" "$dest/.config/$app"
    done
    ;;
  *) usage ;;
esac

[[ ! -d $backup ]] || printf 'Previous files: %s\n' "$backup"
