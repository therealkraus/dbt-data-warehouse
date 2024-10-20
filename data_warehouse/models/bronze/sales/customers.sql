WITH sales_customers AS (
    SELECT * FROM {{ source('sales', 'customers') }}
)

SELECT
    CAST(NULLIF([CustomerID], '[NULL]') AS VARCHAR) AS customer_id,
    CAST(NULLIF([CustomerName], '[NULL]') AS VARCHAR) AS customer_name,
    CAST(NULLIF([BillToCustomerID], '[NULL]') AS VARCHAR) AS bill_to_customer_id,
    CAST(NULLIF([CustomerCategoryID], '[NULL]') AS VARCHAR) AS customer_category_id,
    CAST(NULLIF([BuyingGroupID], '[NULL]') AS VARCHAR) AS buying_group_id,
    CAST(NULLIF([PrimaryContactPersonID], '[NULL]') AS VARCHAR) AS primary_contact_person_id,
    CAST(NULLIF([AlternateContactPersonID], '[NULL]') AS VARCHAR) AS alternate_contact_person_id,
    CAST(NULLIF([DeliveryMethodID], '[NULL]') AS VARCHAR) AS delivery_method_id,
    CAST(NULLIF([DeliveryCityID], '[NULL]') AS VARCHAR) AS delivery_city_id,
    CAST(NULLIF([CreditLimit], '[NULL]') AS VARCHAR) AS credit_limit,
    CAST(NULLIF([AccountOpenedDate], '[NULL]') AS VARCHAR) AS account_opened_date,
    CAST(NULLIF([StandardDiscountPercentage], '[NULL]') AS VARCHAR) AS standard_discount_percentage,
    CAST(NULLIF([IsStatementSent], '[NULL]') AS VARCHAR) AS is_statement_sent,
    CAST(NULLIF([IsOnCreditHold], '[NULL]') AS VARCHAR) AS is_on_credit_hold,
    CAST(NULLIF([PaymentDays], '[NULL]') AS VARCHAR) AS payment_days,
    CAST(NULLIF([PhoneNumber], '[NULL]') AS VARCHAR) AS phone_number,
    CAST(NULLIF([WebsiteURL], '[NULL]') AS VARCHAR) AS website_url,
    CAST(NULLIF([DeliveryAddressLine], '[NULL]') AS VARCHAR) AS delivery_address_line,
    CAST(NULLIF([DeliveryLocationLat], '[NULL]') AS VARCHAR) AS delivery_location_lat,
    CAST(NULLIF([DeliveryLocationLong], '[NULL]') AS VARCHAR) AS delivery_location_long,
    CURRENT_DATE() AS loaded_at
FROM sales_customers
