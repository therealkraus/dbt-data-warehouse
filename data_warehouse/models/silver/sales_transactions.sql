WITH customers AS (
    SELECT * FROM {{ ref('customers') }}
),

customertransactions AS (
    SELECT * FROM {{ ref('customertransactions') }}
),

invoices AS (
    SELECT * FROM {{ ref('invoices') }}
)

SELECT
    c.customer_id,
    c.customer_name,
    ct.customer_transaction_id,
    ct.invoice_id,
    ct.transaction_amount,
    ct.outstanding_balance,
    CASE
        WHEN ct.is_finalized = '[1]' THEN 'Yes'
        ELSE 'No'
    END AS is_finalized,
    i.invoice_date,
    CURRENT_DATE() AS created_at
FROM customers AS c
INNER JOIN customertransactions AS ct
    ON c.customer_id = ct.customer_id
INNER JOIN invoices AS i
    ON ct.invoice_id = i.invoice_id
WHERE CAST(TRIM(i.invoice_date, '[]') AS Date) >= '2014-01-01'
