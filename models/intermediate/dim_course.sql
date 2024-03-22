{{ config(
    materialized='table'
) }}

SELECT DISTINCT 
       CourseID,
       IF(RaceType IS NULL, 'Flat', RaceType) as RaceType
FROM {{ ref('stg_horses') }}
