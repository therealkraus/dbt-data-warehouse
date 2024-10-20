WITH cities AS (
    SELECT * FROM {{ ref('cities') }}
),

states AS (
    SELECT * FROM {{ ref('stateprovinces') }}
),

countries AS (
    SELECT * FROM {{ ref('countries') }}
)

SELECT
    c.city_id,
    c.city_name,
    s.state_province_id,
    s.state_province_name,
    co.country_id,
    co.country_name,
    c.latitude,
    c.longitude,
    NULLIF(c.latest_recorded_population, '[NULL]') AS 'latest_recorded_population',
    CURRENT_DATE() AS created_at
FROM cities AS c
INNER JOIN states AS s
    ON c.state_province_id = s.state_province_id
INNER JOIN countries AS co
    ON s.country_id = co.country_id
WHERE TRIM(co.country_id, '[]') == '230'
