WITH application_cities AS (
    SELECT * FROM {{ source('application', 'cities') }}
)

SELECT
    CAST(NULLIF([CityID], '[NULL]') AS VARCHAR) AS city_id,
    CAST(NULLIF([CityName], '[NULL]') AS VARCHAR) AS city_name,
    CAST(NULLIF([StateProvinceID], '[NULL]') AS VARCHAR) AS state_province_id,
    CAST(NULLIF([Latitude], '[NULL]') AS VARCHAR) AS latitude,
    CAST(NULLIF([Longitude], '[NULL]') AS VARCHAR) AS longitude,
    CAST(NULLIF([LatestRecordedPopulation], '[NULL]') AS VARCHAR) AS latest_recorded_population,
    CURRENT_DATE() AS loaded_at
FROM application_cities