{{ config(
    materialized='table'
) }}

SELECT DISTINCT 
       MeetingID,
       MeetingDate
FROM {{ ref('stg_horses') }}