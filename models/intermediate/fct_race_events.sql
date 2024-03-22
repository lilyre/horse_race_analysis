{{ config(
    materialized='table'
) }}

WITH horses_data AS (
    SELECT        
        RaceID,
        HorseID,
        JockeyID,
        TrainerID,
        OwnerID,
        CourseID,
        Weather,
        RaceType,
        Handicap,
        Eligibility,
        Cloth,
        Stall,
        HorseAge,
        CourseDistance,
        HorseCount,
        Runners
        RaceNumber,
        WeightValue,
        AllowanceValue,
        OverweightValue,
        LastRunDaysFlat,
        MeetingID,
        Won
    FROM {{ ref('stg_horses') }}
)

SELECT *
FROM horses_data

