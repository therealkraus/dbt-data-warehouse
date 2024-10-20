# Standard library imports
from pathlib import Path

# Related third party imports
import duckdb

# Local application/library specific imports


def main():
    curr_dir = Path(__file__).resolve(strict=True).parent
    db_path = curr_dir / "data" / "example.db"
    # Remove the database if it already exists
    db_path.unlink(missing_ok=True)

    with duckdb.connect(str(db_path)) as con:
        con.sql("CREATE SCHEMA IF NOT EXISTS example.bronze;")
        con.sql("CREATE SCHEMA IF NOT EXISTS example.silver;")
        con.sql("CREATE SCHEMA IF NOT EXISTS example.gold;")

        con.sql(
            f"CREATE TABLE example.bronze.cities AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'application' / 'cities.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.bronze.countries AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'application' / 'countries.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.bronze.stateprovinces AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'application' / 'stateprovinces.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.bronze.purchaseorderlines AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'purchasing' / 'purchaseorderlines.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.bronze.purchaseorders AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'purchasing' / 'purchaseorders.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.bronze.suppliercategories AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'purchasing' / 'suppliercategories.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.bronze.suppliers AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'purchasing' / 'suppliers.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.bronze.suppliertransactions AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'purchasing' / 'suppliertransactions.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.bronze.customers AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'sales' / 'customers.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.bronze.invoices AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'sales' / 'invoices.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.bronze.orders AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'sales' / 'orders.csv'}', nullstr=['NULL', '']);"
        )


if __name__ == "__main__":
    main()
