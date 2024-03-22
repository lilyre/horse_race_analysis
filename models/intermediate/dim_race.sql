{{ config(
    materialized='table'
) }}

SELECT DISTINCT RaceID,
       RaceType,
       CourseID,
       Weather,
       Going,
       TrackType,
       Handicap,
       Eligibility
FROM {{ ref('stg_horses') }}
