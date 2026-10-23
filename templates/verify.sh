#!/usr/bin/env bash
# One command that proves the work is correct.
# The agent must run this and show the output before saying "done".
set -euo pipefail
cd "$(dirname "$0")"

# TODO: configure, then delete the next two lines. Until then this fails on purpose,
# so an unconfigured harness can never report a false pass.
echo "verify.sh is not configured yet"
exit 1

echo "== lint =="
# TODO: e.g. ruff check .      or   npm run lint

echo "== types =="
# TODO: e.g. mypy src          or   npx tsc --noEmit

echo "== tests =="
# TODO: e.g. pytest -q         or   npm test

echo "VERIFY OK"
