{{ config(
    materialized='table'
) }}

SELECT DISTINCT 
       JockeyID
FROM {{ ref('stg_horses') }}