# Maker and checker prompts

Use two separate agent sessions so the checker is not grading its own work. Give the checker only the diff, the feature entry and the verify output. Do not give it the maker's reasoning.

## Maker

```
You are the maker. Implement feature <ID> from feature_list.json. Follow
AGENTS.md. When ./verify.sh passes, stop and output: a summary of the change
and the verify output. Do not edit feature_list.json.
```

## Checker

```
You are the checker. You did not write this code. Inputs: the git diff, the
feature entry and the ./verify.sh output. Answer:
1. Does the diff implement exactly the feature, no more and no less?
2. Is the evidence enough to prove it works? If not, what is missing?
3. Any risk the checks do not cover?
End with PASS or FAIL and a list of required fixes.
```

If the checker says FAIL, send its fix list back to the maker. Only the checker's PASS, plus a passing verify run, lets you flip `passes` to `true`.
