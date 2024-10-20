#!/bin/bash

SCRIPT_DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

if [ ! -f "venv/bin/activate" ]; then
    python3.12 -m venv venv
fi

source venv/bin/activate

python3.12 -m pip install --upgrade pip

# Install the python packages

pip install -r requirements.txt

# Generate the duckdb database automatically from the csv files located in the data folder

python3.12 generate_duckdb.py

cd "$SCRIPT_DIR/data_warehouse"

# Run the dbt build command to build the data warehouse

dbt build
