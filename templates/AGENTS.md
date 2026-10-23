# AGENTS.md

Read this first. Keep it short. Detail belongs in `docs/`, linked from here.

## Project

TODO: one paragraph. What does this repo do, and who uses it?

## Commands

- Start of every session: `./init.sh`
- Prove the work is correct: `./verify.sh` (must pass before you claim anything is done)

## Session protocol

1. Run `./init.sh`.
2. Read `progress.md`, then `feature_list.json`, then `git log --oneline -5`.
3. Pick exactly ONE feature whose `passes` is `false`.
4. Implement it. Run `./verify.sh`. Fix and re-run until it passes.
5. Update `feature_list.json` (see rules) and `progress.md`.
6. Commit only if `./verify.sh` passes.

## Rules

- One feature per session. No drive-by refactors.
- In `feature_list.json` you may only change a feature's `passes` and `notes`, and only flip `passes` to `true` after a passing `./verify.sh` run. Never delete, reword or add features to make progress look better.
- Never say "done" without pasting the `./verify.sh` output.
- If you are blocked, write the blocker in `progress.md` and stop. Do not guess.
- Leave the repo in a state where the next session can run `./init.sh` and continue.

## Where to look

- TODO: architecture notes, e.g. `docs/architecture.md`
- TODO: coding conventions, e.g. `docs/conventions.md`

## Lessons

Add one line every time the agent gets something wrong. Each line should name a real mistake.

- TODO: YYYY-MM-DD, what went wrong, then the rule that prevents it
