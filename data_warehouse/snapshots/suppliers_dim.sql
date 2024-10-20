{% snapshot suppliers_dim %}

  {{
      config(
        target_schema = 'main_silver',
        unique_key='dbt_surrogate_key_id',
        strategy='check',
        check_cols=['supplier_id', 'supplier_name', 'supplier_category_id', 'primary', 'alternate', 'delivery_method_id', 'delivery_city_id', 'postal_city_id', 'supplier_reference', 'payment_days', 'phone_number', 'website_url', 'delivery_address_line', 'delivery_location_lat', 'delivery_location_long'],
        invalidate_hard_deletes=True
      )
  }}

  SELECT
    supplier_id,
    supplier_name,
    supplier_category_id,
    primary_contact_person_id,
    alternate_contact_person_id,
    delivery_method_id,
    delivery_city_id,
    postal_city_id,
    supplier_reference,
    payment_days,
    phone_number,
    website_url,
    delivery_address_line,
    delivery_location_lat,
    delivery_location_long,
    loaded_at,
    {{ dbt_utils.generate_surrogate_key([
        'supplier_id',
        'supplier_category_id',
        'primary_contact_person_id',
        'alternate_contact_person_id',
        'delivery_method_id',
        'delivery_city_id',
        'postal_city_id',
    ]) }} AS dbt_surrogate_key_id
  FROM {{ ref('suppliers') }}

{% endsnapshot %}
