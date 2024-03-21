{{ config(
    materialized='table',
) }}

SELECT Weather,
       Going
FROM {{ ref('stg_horses') }}
