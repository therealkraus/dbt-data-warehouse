WITH sales_orders AS (
    SELECT * FROM {{ source('sales', 'orders') }}
)

SELECT
    CAST(NULLIF([OrderID], '[NULL]') AS VARCHAR) AS order_id,
    CAST(NULLIF([CustomerID], '[NULL]') AS VARCHAR) AS customer_id,
    CAST(NULLIF([SalespersonPersonID], '[NULL]') AS VARCHAR) AS salesperson_person_id,
    CAST(NULLIF([PickedByPersonID], '[NULL]') AS VARCHAR) AS picked_by_person_id,
    CAST(NULLIF([ContactPersonID], '[NULL]') AS VARCHAR) AS contact_person_id,
    CAST(NULLIF([BackorderOrderID], '[NULL]') AS VARCHAR) AS backorder_order_id,
    CAST(NULLIF([OrderDate], '[NULL]') AS VARCHAR) AS order_date,
    CAST(NULLIF([ExpectedDeliveryDate], '[NULL]') AS VARCHAR) AS expected_delivery_date,
    CAST(NULLIF([CustomerPurchaseOrderNumber], '[NULL]') AS VARCHAR) AS customer_purchase_order_number,
    CAST(NULLIF([IsUndersupplyBackordered], '[NULL]') AS VARCHAR) AS is_undersupply_backordered,
    CAST(NULLIF([PickingCompletedWhen], '[NULL]') AS VARCHAR) AS picking_completed_when,
    CURRENT_DATE() AS loaded_at
FROM sales_orders
