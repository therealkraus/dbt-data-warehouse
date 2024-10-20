WITH application_stateprovinces AS (
    SELECT * FROM {{ source('application', 'stateprovinces') }}
)

SELECT
    CAST(NULLIF([StateProvinceID], '[NULL]') AS VARCHAR) AS state_province_id,
    CAST(NULLIF([StateProvinceCode], '[NULL]') AS VARCHAR) AS state_province_code,
    CAST(NULLIF([StateProvinceName], '[NULL]') AS VARCHAR) AS state_province_name,
    CAST(NULLIF([CountryID], '[NULL]') AS VARCHAR) AS country_id,
    CAST(NULLIF([SalesTerritory], '[NULL]') AS VARCHAR) AS sales_territory,
    CAST(NULLIF([LatestRecordedPopulation], '[NULL]') AS VARCHAR) AS latest_recorded_population,
    CURRENT_DATE() AS loaded_at
FROM application_stateprovinces
