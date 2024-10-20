WITH sales_invoices AS (
    SELECT * FROM {{ source('sales', 'invoices') }}
)

SELECT
    CAST(NULLIF([InvoiceID], '[NULL]') AS VARCHAR) AS invoice_id,
    CAST(NULLIF([CustomerID], '[NULL]') AS VARCHAR) AS customer_id,
    CAST(NULLIF([BillToCustomerID], '[NULL]') AS VARCHAR) AS bill_to_customer_id,
    CAST(NULLIF([OrderID], '[NULL]') AS VARCHAR) AS order_id,
    CAST(NULLIF([DeliveryMethodID], '[NULL]') AS VARCHAR) AS delivery_method_id,
    CAST(NULLIF([ContactPersonID], '[NULL]') AS VARCHAR) AS contact_person_id,
    CAST(NULLIF([AccountsPersonID], '[NULL]') AS VARCHAR) AS accounts_person_id,
    CAST(NULLIF([SalespersonPersonID], '[NULL]') AS VARCHAR) AS salesperson_person_id,
    CAST(NULLIF([PackedByPersonID], '[NULL]') AS VARCHAR) AS packed_by_person_id,
    CAST(NULLIF([InvoiceDate], '[NULL]') AS VARCHAR) AS invoice_date,
    CAST(NULLIF([CustomerPurchaseOrderNumber], '[NULL]') AS VARCHAR) AS customer_purchase_order_number,
    CAST(NULLIF([DeliveryInstructions], '[NULL]') AS VARCHAR) AS delivery_instructions,
    CAST(NULLIF([TotalDryItems], '[NULL]') AS VARCHAR) AS total_dry_items,
    CAST(NULLIF([TotalChillerItems], '[NULL]') AS VARCHAR) AS total_chiller_items,
    CAST(NULLIF([ConfirmedDeliveryTime], '[NULL]') AS VARCHAR) AS confirmed_delivery_time,
    CAST(NULLIF([ConfirmedReceivedBy], '[NULL]') AS VARCHAR) AS confirmed_received_by,
    CURRENT_DATE() AS loaded_at
FROM sales_invoices
