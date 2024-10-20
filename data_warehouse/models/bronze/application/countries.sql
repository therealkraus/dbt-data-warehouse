WITH application_countries AS (
    SELECT * FROM {{ source('application', 'countries') }}
)

SELECT
    CAST(NULLIF([CountryID], '[NULL]') AS VARCHAR) AS country_id,
    CAST(NULLIF([CountryName], '[NULL]') AS VARCHAR) AS country_name,
    CAST(NULLIF([FormalName], '[NULL]') AS VARCHAR) AS formal_name,
    CAST(NULLIF([LatestRecordedPopulation], '[NULL]') AS VARCHAR) AS latest_recorded_population,
    CAST(NULLIF([Continent], '[NULL]') AS VARCHAR) AS continent,
    CAST(NULLIF([Region], '[NULL]') AS VARCHAR) AS region,
    CAST(NULLIF([Subregion], '[NULL]') AS VARCHAR) AS subregion,
    CURRENT_DATE() AS loaded_at
FROM application_countries

