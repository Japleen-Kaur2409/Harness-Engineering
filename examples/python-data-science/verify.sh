#!/usr/bin/env bash
# Example verify.sh for a Python data science repo.
set -euo pipefail
cd "$(dirname "$0")"

echo "== lint =="
ruff check .

echo "== types =="
mypy src

echo "== unit tests =="
pytest -q tests

echo "== data validation =="
# Fails if the schema, nulls or id overlap between train and eval are wrong.
python -m src.validate_data

echo "== smoke train on a small sample =="
python -m src.train --sample 500 --seed 0

echo "VERIFY OK"
