{{ config(
    materialized='table',
) }}

SELECT HorseID,
       HorseAge,
       CountryWhereBred,
       Sex,
       Colour,
       DamID,
       SireID,
       DamSireID
FROM {{ ref('stg_horses') }}
