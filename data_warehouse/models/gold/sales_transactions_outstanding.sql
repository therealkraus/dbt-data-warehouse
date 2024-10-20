WITH sales_transactions AS (
    SELECT * FROM {{ ref('sales_transactions') }}
)

SELECT
    st.customer_id,
    st.customer_name,
    st.customer_transaction_id,
    st.invoice_id,
    st.transaction_amount,
    st.outstanding_balance,
    st.is_finalized,
    st.invoice_date,
FROM sales_transactions AS st
WHERE TRIM(st.outstanding_balance, '[]') > '0.0'
