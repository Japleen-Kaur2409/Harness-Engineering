# Session end prompt

Paste this when the agent says it is finished.

```
Before you stop: run ./verify.sh and paste the full output. If it passes,
set "passes": true for the feature in feature_list.json and update
progress.md (what you did, verify result, what is left, anything broken or
unverified). If it fails, leave "passes" as false and record why in
progress.md. Commit only if verify passed.
```
