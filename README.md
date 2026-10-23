# Agent Harness Starter

Copy-paste files that make AI coding agents (Claude Code, Codex, Cursor and others) more reliable in your repo. No framework, no dependencies, just a handful of files and two scripts.

The idea in one line: **the agent is only as reliable as the environment around it.** These files give it instructions, memory between sessions, a way to prove its work, and a boundary on scope.

## Quick start (5 minutes)

```bash
git clone <this-repo-url> agent-harness-starter
cd agent-harness-starter
./install.sh /path/to/your/project      # copies the files, never overwrites yours
```

Then, in your project:

1. Open `verify.sh` and put in your real lint, type and test commands. Delete the "not configured" lines.
2. Fill in the `TODO:` lines in `AGENTS.md` and `feature_list.json`.
3. Check your setup: `bash /path/to/agent-harness-starter/tools/audit.sh /path/to/your/project`
4. Start an agent session and paste [`prompts/session-start.md`](prompts/session-start.md).

## What is inside

| You want to... | Use this |
|---|---|
| Give the agent its instructions | [`templates/AGENTS.md`](templates/AGENTS.md) (and `CLAUDE.md`, which just imports it) |
| Start every session from a healthy state | [`templates/init.sh`](templates/init.sh) |
| Make "done" mean "proved" | [`templates/verify.sh`](templates/verify.sh) |
| Keep scope to one feature at a time | [`templates/feature_list.json`](templates/feature_list.json) |
| Carry memory between sessions | [`templates/progress.md`](templates/progress.md) |
| Start, end and review sessions | [`prompts/`](prompts/) |
| Check your setup | [`tools/audit.sh`](tools/audit.sh) and [`checklists/`](checklists/) |
| See a filled-in example | [`examples/python-data-science/`](examples/python-data-science/) |
| Understand why this works | [`LEARN.md`](LEARN.md) |

## Daily use

```
start   ->  paste prompts/session-start.md
work    ->  agent picks ONE feature, builds it, runs ./verify.sh
end     ->  paste prompts/session-end.md
merge   ->  go through checklists/before-you-merge.md
```

For a second opinion on important work, use [`prompts/maker-checker.md`](prompts/maker-checker.md) with two separate sessions.

## Something went wrong? Find the fix

| Symptom | Fix |
|---|---|
| Agent says "done" but it is broken | Make `verify.sh` stricter; keep the rule "paste the verify output" |
| Agent forgets what happened last time | Make sure it updates `progress.md`; use the session prompts |
| Agent changes too much at once | Smaller entries in `feature_list.json`; keep the one-feature rule |
| Agent ignores your instructions | `AGENTS.md` is too long; trim it and link to `docs/` |
| Agent repeats the same mistake | Use [`prompts/fix-the-harness.md`](prompts/fix-the-harness.md) to add a rule or a check |
| Agent edits the feature list to look finished | Keep the rule against it, and review the `feature_list.json` diff |

## Good to know

- `verify.sh` fails on purpose until you configure it, so an empty harness never reports a false pass.
- `CLAUDE.md` contains one line importing `AGENTS.md`, so Claude Code and agents that read `AGENTS.md` share one source of truth. If your agent does not support imports, copy the content instead.
- `init.sh` assumes a Python (`requirements.txt`) or Node (`package.json`) project. Edit the install section for anything else.
- Review agent output as you would any other contribution. A harness reduces mistakes; it does not remove the need for a human reviewer.

## Credits

Inspired by public work on harness engineering, listed in [`LEARN.md`](LEARN.md). The files in this repo are original templates, not copies of those sources.

## License

MIT, see [`LICENSE`](LICENSE).
