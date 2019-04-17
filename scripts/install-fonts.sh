#!/usr/bin/env sh
# shellcheck disable=SC2059

# Downloads the latest patched 'M+ 1m' font from the Nerd Fonts repository,
# copies it to the user's local fonts directory and updates the font cache.
#
# Author: Benedikt Vollmerhaus
# License: MIT

set -e

NC='\033[0m'
GREEN='\033[32m'

LOCAL_FONT_DIR="$HOME/.local/share/fonts"
DL_URL='https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/MPlus/%s/complete/%s'

# The font variants to download. These correspond to the directories at:
# https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/MPlus
FONT_STYLES='Bold
Light
Medium
Regular
Thin'

# The filenames of the fonts to download. The placeholder is replaced
# with the font style name, or removed if the font style is 'Regular'.
FONT_FILENAMES='M+ 1m %sNerd Font Complete.ttf
M+ 1m %sNerd Font Complete Mono.ttf'

download_font() {
  font_style=$1
  font_filename=$2

  # All font styles except 'Regular' include the style in the filename
  if [ "$font_style" != 'Regular' ]; then
    font_style_lc=$(printf "$font_style" | tr '[:upper:]' '[:lower:]')
    font_filename=$(printf "$font_filename" "$font_style_lc ")
  else
    font_filename=$(printf "$font_filename" '')
  fi

  # Replace spaces in the font filename with '%20' for use in the URL
  font_url_filename=$(printf "$font_filename" | sed 's/ /%20/g')
  url=$(printf "$DL_URL" "$font_style" "$font_url_filename")

  printf " [ .. ] %s\\n" "$font_filename"
  curl -fLsS "$url" > "$font_filename"
  printf "\\b\\r [ ${GREEN}ok${NC} ] %s\\n" "$font_filename"
}

update_font_cache() {
  if command -v fc-cache >/dev/null 2>&1; then
    printf ":: Updating font cache...\\n"
    fc-cache -f "$LOCAL_FONT_DIR"
  fi
}

main() {
  mkdir -p "$LOCAL_FONT_DIR"
  cd "$LOCAL_FONT_DIR" || return

  printf ":: Retrieving fonts...\\n"

  IFS=$'\n'
  for font_style in ${FONT_STYLES}; do
    for font_filename in ${FONT_FILENAMES}; do
      download_font "$font_style" "$font_filename"
    done
  done

  update_font_cache
}

main

# kak:filetype=sh
