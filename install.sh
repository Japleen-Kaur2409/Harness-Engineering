#!/usr/bin/env bash
# Copy the starter files into your project. Never overwrites existing files.
# Usage: ./install.sh /path/to/your/repo
set -euo pipefail

TARGET="${1:-.}"
HERE="$(cd "$(dirname "$0")" && pwd)"

[ -d "$TARGET" ] || { echo "Not a directory: $TARGET"; exit 1; }

copy() {
  if [ -e "$TARGET/$2" ]; then
    echo "skip   $2 (already exists)"
  else
    mkdir -p "$(dirname "$TARGET/$2")"
    cp "$HERE/$1" "$TARGET/$2"
    echo "added  $2"
  fi
}

copy templates/AGENTS.md AGENTS.md
copy templates/CLAUDE.md CLAUDE.md
copy templates/init.sh init.sh
copy templates/verify.sh verify.sh
copy templates/feature_list.json feature_list.json
copy templates/progress.md progress.md

chmod +x "$TARGET/init.sh" "$TARGET/verify.sh" 2>/dev/null || true

echo
echo "Next:"
echo "  1. Replace every TODO: in the added files (start with verify.sh)."
echo "  2. Check your setup:  bash \"$HERE/tools/audit.sh\" \"$TARGET\""
