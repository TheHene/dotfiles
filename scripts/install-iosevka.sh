#!/usr/bin/env sh
# shellcheck disable=SC2059

# Download and install the Iosevka font for the current user.
#
# Author: Benedikt Vollmerhaus <benedikt@vollmerhaus.org>
# License: MIT

set -eu

readonly FONT_VERSION='2.3.3'
readonly FONT_NAME='iosevka-term-ss04'
readonly USER_FONT_DIR="${HOME}/.local/share/fonts"

readonly DL_URL=$(printf '%s' \
  "https://github.com/be5invis/Iosevka/releases/download/" \
  "v${FONT_VERSION}/${FONT_NAME}-${FONT_VERSION}.zip")

readonly NC='\033[0m'
readonly IT='\033[3m'
readonly RED='\033[1;31m'
readonly BLUE='\033[1;34m'

main() {
  if ! command -v unzip >/dev/null 2>&1; then
    printf '%b' \
      "${RED}error:${NC} ${IT}unzip${NC} is required " \
      "for archive extraction but not installed.\n" >&2
    exit 1
  fi

  readonly temp_dir=$(mktemp -d)

  printf "${BLUE}::${NC} Downloading ${IT}%s${NC} font...\n" "${FONT_NAME}"
  curl -fLsS -o "${temp_dir}/${FONT_NAME}.zip" "${DL_URL}"

  printf "${BLUE}::${NC} Extracting to ${IT}~/.local/share/fonts${NC}...\n"
  unzip-q -jo "${temp_dir}/${FONT_NAME}.zip" 'ttf/*' \
    -d "${USER_FONT_DIR}/${FONT_NAME}"

  printf "${BLUE}::${NC} Rebuilding font cache...\n"
  fc-cache -f "${USER_FONT_DIR}"

  rm -r "${temp_dir}"
}

main

# kak:filetype=sh
