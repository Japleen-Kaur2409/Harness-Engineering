# Harness checklist

Tick each box, or run `tools/audit.sh` to check the basics automatically.

## Instructions
- [ ] `AGENTS.md` exists, is under about 150 lines, and has no `TODO:` left
- [ ] It links to detail in `docs/` instead of holding it all

## State
- [ ] `progress.md` exists and was updated in the last session
- [ ] `feature_list.json` is valid JSON with at least one `"passes": false`

## Verification
- [ ] `verify.sh` is configured and runs lint, types and tests
- [ ] It fails loudly when something is wrong (non-zero exit)
- [ ] The agent is told to paste its output before saying "done"

## Scope
- [ ] Each feature is small enough to finish in one session
- [ ] Each feature has a `check` command that proves it
- [ ] The rules forbid editing the feature list to hide unfinished work

## Session lifecycle
- [ ] `init.sh` installs, health-checks and shows recent git history
- [ ] Sessions end with the session-end prompt and a commit only on a passing verify
