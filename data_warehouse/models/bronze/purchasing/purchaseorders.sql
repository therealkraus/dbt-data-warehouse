WITH purchasing_purchaseorders AS (
    SELECT * FROM {{ source('purchasing', 'purchaseorders') }}
)

SELECT
    CAST(NULLIF([PurchaseOrderID], '[NULL]') AS VARCHAR) AS purchase_order_id,
    CAST(NULLIF([SupplierID], '[NULL]') AS VARCHAR) AS supplier_id,
    CAST(NULLIF([OrderDate], '[NULL]') AS VARCHAR) AS order_date,
    CAST(NULLIF([DeliveryMethodID], '[NULL]') AS VARCHAR) AS delivery_method_id,
    CAST(NULLIF([ContactPersonID], '[NULL]') AS VARCHAR) AS contact_person_id,
    CAST(NULLIF([ExpectedDeliveryDate], '[NULL]') AS VARCHAR) AS expected_delivery_date,
    CAST(NULLIF([SupplierReference], '[NULL]') AS VARCHAR) AS supplier_reference,
    CAST(NULLIF([IsOrderFinalized], '[NULL]') AS VARCHAR) AS is_order_finalized,
    CURRENT_DATE() AS loaded_at
FROM purchasing_purchaseorders
