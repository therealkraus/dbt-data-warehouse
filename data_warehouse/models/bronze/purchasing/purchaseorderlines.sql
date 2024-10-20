WITH purchasing_purchaseorderlines AS (
    SELECT * FROM {{ source('purchasing', 'purchaseorderlines') }}
)

SELECT
    CAST(NULLIF([PurchaseOrderLineID], '[NULL]') AS VARCHAR) AS purchase_order_line_id,
    CAST(NULLIF([PurchaseOrderID], '[NULL]') AS VARCHAR) AS purchase_order_id,
    CAST(NULLIF([StockItemID], '[NULL]') AS VARCHAR) AS stock_item_id,
    CAST(NULLIF([OrderedOuters], '[NULL]') AS VARCHAR) AS ordered_outers,
    CAST(NULLIF([Description], '[NULL]') AS VARCHAR) AS description,
    CAST(NULLIF([ReceivedOuters], '[NULL]') AS VARCHAR) AS received_outers,
    CAST(NULLIF([PackageTypeID], '[NULL]') AS VARCHAR) AS package_type_id,
    CAST(NULLIF([ExpectedUnitPricePerOuter], '[NULL]') AS VARCHAR) AS expected_unit_price_per_outer,
    CAST(NULLIF([LastReceiptDate], '[NULL]') AS VARCHAR) AS last_receipt_date,
    CAST(NULLIF([IsOrderLineFinalized], '[NULL]') AS VARCHAR) AS is_order_line_finalized,
    CURRENT_DATE() AS loaded_at
FROM purchasing_purchaseorderlines
