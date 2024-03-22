{{ config(
    materialized='table'
) }}

WITH distinct_horses as (
    SELECT DISTINCT 
       HorseID,
       HorseAge,
       CountryWhereBred,
       Sex,
       Colour,
       DamID,
       SireID,
       DamSireID
FROM {{ ref('stg_horses') }}
),

SELECT
    HorseID,
    ROW_NUMBER() OVER (PARTITION BY HorseID ORDER BY HorseAge) as VersionID, --inserted a versionID for the scd2 table, where the table keeps a record of change in age of the horse
    HorseAge,
    CountryWhereBred,
    Sex,
    Colour,
    DamID,
    SireID,
    DamSireID
FROM distinct_horses
