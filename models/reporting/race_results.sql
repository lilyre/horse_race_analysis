{{ config(
    materialized='table'
) }}

SELECT 
    m.MeetingDate,
    r.RaceID,
    r.HorseID,
    r.RaceNumber,
    r.Won
FROM 
    {{ ref('fct_race_events') }} r
LEFT JOIN 
    {{ ref('dim_meeting') }} m ON r.MeetingID = m.MeetingID
ORDER BY
m.MeetingDate