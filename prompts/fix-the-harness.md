# When the agent gets something wrong

Do not just re-prompt. Fix the harness so it cannot happen again.

```
That was wrong: <describe the mistake in one sentence>.
Do not just fix the output. Decide which of these would have prevented it,
and make that change:
- a rule or lesson line in AGENTS.md
- a stricter check in verify.sh
- a clearer or smaller entry in feature_list.json
- a note in progress.md
Show me the change before applying it.
```

Keep AGENTS.md short. If it passes about 150 lines, move detail into `docs/` and link to it.
