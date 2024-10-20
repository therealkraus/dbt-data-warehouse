WITH purchasing_suppliercategories AS (
    SELECT * FROM {{ source('purchasing', 'suppliercategories') }}
)

SELECT
    CAST(NULLIF([SupplierCategoryID], '[NULL]') AS VARCHAR) AS supplier_category_id,
    CAST(NULLIF([SupplierCategoryName], '[NULL]') AS VARCHAR) AS supplier_category_name,
    CURRENT_DATE() AS loaded_at
FROM purchasing_suppliercategories
