#!/usr/bin/env bash
# Quick check of a repo against the five harness parts.
# Usage: bash tools/audit.sh /path/to/your/repo
# Exit code: 0 if nothing FAILED (warnings are allowed), 1 otherwise.

TARGET="${1:-.}"
fails=0
warns=0

pass() { echo "  PASS  $1"; }
fail() { echo "  FAIL  $1"; fails=$((fails + 1)); }
warn() { echo "  WARN  $1"; warns=$((warns + 1)); }

echo "Auditing: $TARGET"

echo
echo "Instructions"
INSTR="$TARGET/AGENTS.md"
[ -f "$INSTR" ] || INSTR="$TARGET/CLAUDE.md"
if [ -f "$INSTR" ]; then
  pass "instruction file found ($(basename "$INSTR"))"
  lines=$(wc -l < "$INSTR" | tr -d ' ')
  if [ "$lines" -le 150 ]; then pass "$lines lines (150 or fewer)"; else warn "$lines lines; move detail into docs/"; fi
  if grep -q "TODO:" "$INSTR"; then warn "TODO: markers remain in $(basename "$INSTR")"; else pass "no TODO: markers left"; fi
else
  fail "no AGENTS.md or CLAUDE.md"
fi

echo
echo "State"
if [ -f "$TARGET/progress.md" ]; then pass "progress.md found"; else fail "progress.md missing"; fi
FL="$TARGET/feature_list.json"
if [ -f "$FL" ]; then
  if command -v python3 >/dev/null 2>&1; then
    if python3 - "$FL" 2>/dev/null <<'PY'
import json, sys
d = json.load(open(sys.argv[1]))
feats = d.get("features", [])
assert isinstance(feats, list) and feats, "no features"
for f in feats:
    assert "id" in f and "passes" in f, "feature missing id or passes"
PY
    then pass "feature_list.json is valid and has features"; else fail "feature_list.json is invalid or empty"; fi
  else
    warn "python3 not found; skipped feature_list.json validation"
  fi
  if grep -q "TODO:" "$FL"; then warn "TODO: markers remain in feature_list.json"; fi
else
  fail "feature_list.json missing"
fi

echo
echo "Verification"
V="$TARGET/verify.sh"
if [ -f "$V" ]; then
  pass "verify.sh found"
  if [ -x "$V" ]; then pass "verify.sh is executable"; else fail "verify.sh is not executable (chmod +x)"; fi
  if grep -q "TODO:" "$V"; then fail "verify.sh is not configured (TODO: remains)"; else pass "verify.sh configured"; fi
else
  fail "verify.sh missing"
fi

echo
echo "Scope"
if [ -f "$INSTR" ] && grep -qi "one feature" "$INSTR"; then pass "one-feature rule present"; else warn "no 'one feature' rule in the instruction file"; fi
if [ -f "$INSTR" ] && grep -q "feature_list.json" "$INSTR"; then pass "instructions reference feature_list.json"; else warn "instructions do not mention feature_list.json"; fi

echo
echo "Session lifecycle"
I="$TARGET/init.sh"
if [ -f "$I" ]; then
  pass "init.sh found"
  if [ -x "$I" ]; then pass "init.sh is executable"; else fail "init.sh is not executable (chmod +x)"; fi
  if grep -q "TODO:" "$I"; then warn "TODO: markers remain in init.sh"; fi
else
  fail "init.sh missing"
fi
if [ -d "$TARGET/.git" ]; then pass "git repository"; else warn "not a git repository"; fi

echo
echo "Result: $fails failed, $warns warnings"
[ "$fails" -eq 0 ]
