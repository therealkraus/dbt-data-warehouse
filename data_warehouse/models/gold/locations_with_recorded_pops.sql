WITH locations AS (
    SELECT * FROM {{ ref('location') }}
)

SELECT
    l.city_id,
    l.city_name,
    l.state_province_id,
    l.state_province_name,
    l.country_id,
    l.country_name,
    l.latitude,
    l.longitude,
    l.latest_recorded_population,
FROM locations AS l
WHERE l.latest_recorded_population IS NOT NULL