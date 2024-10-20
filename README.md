# Data Warehouse dbt Project

## Introduction

This is an example of a dbt project that uses a data warehouse as a target. The data warehouse is a duckdb database.

The project will automatically build the duckdb database by using the data in the `data` folder.

It will place the database in the `data_warehouse` folder called `example.db`. Use DBeaver or any other SQL client to connect to the database.

After which it will run a `dbt build` command to run the dbt models, snapshots and data tests.

## How to use

1. Run the `run_data_warehouse.sh` script to build the data warehouse and run dbt.

## Example

```bash
bash run_data_warehouse.sh
```
