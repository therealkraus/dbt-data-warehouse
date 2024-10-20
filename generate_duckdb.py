# Standard library imports
from pathlib import Path

# Related third party imports
import duckdb

# Local application/library specific imports


def main():
    curr_dir = Path(__file__).resolve(strict=True).parent
    db_path = curr_dir / "data_warehouse" / "example.db"
    # Remove the database if it already exists
    db_path.unlink(missing_ok=True)

    with duckdb.connect(str(db_path)) as con:
        con.sql("CREATE SCHEMA IF NOT EXISTS example.loading;")

        con.sql(
            f"CREATE TABLE example.loading.cities AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'application' / 'cities.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.loading.countries AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'application' / 'countries.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.loading.stateprovinces AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'application' / 'stateprovinces.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.loading.purchaseorderlines AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'purchasing' / 'purchaseorderlines.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.loading.purchaseorders AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'purchasing' / 'purchaseorders.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.loading.suppliercategories AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'purchasing' / 'suppliercategories.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.loading.suppliers AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'purchasing' / 'suppliers.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.loading.suppliertransactions AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'purchasing' / 'suppliertransactions.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.loading.customers AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'sales' / 'customers.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.loading.customertransactions AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'sales' / 'customertransactions.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.loading.invoices AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'sales' / 'invoices.csv'}', nullstr=['NULL', '']);"
        )

        con.sql(
            f"CREATE TABLE example.loading.orders AS SELECT * FROM read_csv_auto('{curr_dir / 'data' / 'sales' / 'orders.csv'}', nullstr=['NULL', '']);"
        )


if __name__ == "__main__":
    main()
