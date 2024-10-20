WITH sales_customer_transactions AS (
    SELECT * FROM {{ source('sales', 'customertransactions') }}
)

SELECT
    CAST(NULLIF([CustomerTransactionID], '[NULL]') AS VARCHAR) AS customer_transaction_id,
    CAST(NULLIF([CustomerID], '[NULL]') AS VARCHAR) AS customer_id,
    CAST(NULLIF([TransactionTypeID], '[NULL]') AS VARCHAR) AS transaction_type_id,
    CAST(NULLIF([InvoiceID], '[NULL]') AS VARCHAR) AS invoice_id,
    CAST(NULLIF([PaymentMethodID], '[NULL]') AS VARCHAR) AS payment_method_id,
    CAST(NULLIF([TransactionDate], '[NULL]') AS VARCHAR) AS transaction_date,
    CAST(NULLIF([AmountExcludingTax], '[NULL]') AS VARCHAR) AS amount_excluding_tax,
    CAST(NULLIF([TaxAmount], '[NULL]') AS VARCHAR) AS tax_amount,
    CAST(NULLIF([TransactionAmount], '[NULL]') AS VARCHAR) AS transaction_amount,
    CAST(NULLIF([OutstandingBalance], '[NULL]') AS VARCHAR) AS outstanding_balance,
    CAST(NULLIF([FinalizationDate], '[NULL]') AS VARCHAR) AS finalization_date,
    CAST(NULLIF([IsFinalized], '[NULL]') AS VARCHAR) AS is_finalized,
    CURRENT_DATE() AS loaded_at
FROM sales_customer_transactions
