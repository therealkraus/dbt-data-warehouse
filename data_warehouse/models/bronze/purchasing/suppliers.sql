WITH purchasing_suppliers AS (
    SELECT * FROM {{ source('purchasing', 'suppliers') }}
)

SELECT
    CAST(NULLIF([SupplierID], '[NULL]') AS VARCHAR) AS supplier_id,
    CAST(NULLIF([SupplierName], '[NULL]') AS VARCHAR) AS supplier_name,
    CAST(NULLIF([SupplierCategoryID], '[NULL]') AS VARCHAR) AS supplier_category_id,
    CAST(NULLIF([PrimaryContactPersonID], '[NULL]') AS VARCHAR) AS primary_contact_person_id,
    CAST(NULLIF([AlternateContactPersonID], '[NULL]') AS VARCHAR) AS alternate_contact_person_id,
    CAST(NULLIF([DeliveryMethodID], '[NULL]') AS VARCHAR) AS delivery_method_id,
    CAST(NULLIF([DeliveryCityID], '[NULL]') AS VARCHAR) AS delivery_city_id,
    CAST(NULLIF([PostalCityID], '[NULL]') AS VARCHAR) AS postal_city_id,
    CAST(NULLIF([SupplierReference], '[NULL]') AS VARCHAR) AS supplier_reference,
    CAST(NULLIF([PaymentDays], '[NULL]') AS VARCHAR) AS payment_days,
    CAST(NULLIF([PhoneNumber], '[NULL]') AS VARCHAR) AS phone_number,
    CAST(NULLIF([WebsiteURL], '[NULL]') AS VARCHAR) AS website_url,
    CAST(NULLIF([DeliveryAddressLine], '[NULL]') AS VARCHAR) AS delivery_address_line,
    CAST(NULLIF([DeliveryLocationLat], '[NULL]') AS VARCHAR) AS delivery_location_lat,
    CAST(NULLIF([DeliveryLocationLong], '[NULL]') AS VARCHAR) AS delivery_location_long,
    CURRENT_DATE() AS loaded_at
FROM purchasing_suppliers
