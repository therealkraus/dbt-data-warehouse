#!/bin/bash

SCRIPT_DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

if [ ! -f "venv/bin/activate" ]; then
    python3.12 -m venv venv
fi

source venv/bin/activate

python3.12 -m pip install --upgrade pip

pip install -r requirements.txt

python3.12 generate_duckdb.py

