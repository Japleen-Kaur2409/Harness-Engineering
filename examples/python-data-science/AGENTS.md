# AGENTS.md

Example for a Python data science repo. Copy and adapt.

## Project

Churn model pipeline: ingest raw CSVs, build features, train, and report metrics on a fixed evaluation set.

## Commands

- Start of every session: `./init.sh`
- Prove the work is correct: `./verify.sh` (must pass before you claim anything is done)

## Session protocol

1. Run `./init.sh`.
2. Read `progress.md`, then `feature_list.json`, then `git log --oneline -5`.
3. Pick exactly ONE feature whose `passes` is `false`.
4. Implement it. Run `./verify.sh`. Fix and re-run until it passes.
5. Update `feature_list.json` and `progress.md`.
6. Commit only if `./verify.sh` passes.

## Rules

- One feature per session. No drive-by refactors.
- In `feature_list.json` change only `passes` and `notes`, and flip `passes` only after a passing `./verify.sh`.
- Never say "done" without pasting the `./verify.sh` output.
- Never modify `data/eval/`. The evaluation set is fixed. Report metrics on it; do not tune against it.
- Never commit raw data, credentials or files under `data/raw/`.
- Set random seeds. A result that changes between runs is not a result.
- If blocked, write the blocker in `progress.md` and stop.

## Where to look

- Data schema: `docs/data-schema.md`
- Metric definitions: `docs/metrics.md`

## Lessons

- Example: the agent re-split the data and scored on training rows. Rule: splits are created only in `src/split.py`, and a test asserts no id overlap.
