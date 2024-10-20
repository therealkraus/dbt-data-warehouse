WITH purchasing_suppliertransactions AS (
    SELECT * FROM {{ source('purchasing', 'suppliertransactions') }}
)

SELECT
    CAST(NULLIF([SupplierTransactionID], '[NULL]') AS VARCHAR) AS supplier_transaction_id,
    CAST(NULLIF([SupplierID], '[NULL]') AS VARCHAR) AS supplier_id,
    CAST(NULLIF([TransactionTypeID], '[NULL]') AS VARCHAR) AS transaction_type_id,
    CAST(NULLIF([PurchaseOrderID], '[NULL]') AS VARCHAR) AS purchase_order_id,
    CAST(NULLIF([PaymentMethodID], '[NULL]') AS VARCHAR) AS payment_method_id,
    CAST(NULLIF([SupplierInvoiceNumber], '[NULL]') AS VARCHAR) AS supplier_invoice_number,
    CAST(NULLIF([TransactionDate], '[NULL]') AS VARCHAR) AS transaction_date,
    CAST(NULLIF([AmountExcludingTax], '[NULL]') AS VARCHAR) AS amount_excluding_tax,
    CAST(NULLIF([TaxAmount], '[NULL]') AS VARCHAR) AS tax_amount,
    CAST(NULLIF([TransactionAmount], '[NULL]') AS VARCHAR) AS transaction_amount,
    CAST(NULLIF([OutstandingBalance], '[NULL]') AS VARCHAR) AS outstanding_balance,
    CAST(NULLIF([FinalizationDate], '[NULL]') AS VARCHAR) AS finalization_date,
    CAST(NULLIF([IsFinalized], '[NULL]') AS VARCHAR) AS is_finalized,
    CURRENT_DATE() AS loaded_at
FROM purchasing_suppliertransactions
