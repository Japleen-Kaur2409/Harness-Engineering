#!/usr/bin/env bash
# Run at the start of every agent session: install, health check, show state.
set -euo pipefail
cd "$(dirname "$0")"

echo "== install =="
if [ -f requirements.txt ]; then
  python3 -m pip install -q -r requirements.txt
elif [ -f package.json ]; then
  npm install --silent
else
  echo "TODO: add your install command to init.sh"
fi

echo "== health check =="
if ! ./verify.sh; then
  echo "Baseline is failing BEFORE any changes. Fix it, or record it in progress.md, before starting a feature."
  exit 1
fi

echo "== state =="
git log --oneline -5 2>/dev/null || true
git status --short 2>/dev/null || true

echo "init OK. Next: read progress.md and feature_list.json."
