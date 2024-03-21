{{ config(
    materialized='table',
    partition_by={
      "field": "ExtractDate",
      "data_type": "date",
      "granularity": "day"
    },
    cluster_by = ["Division"]
) }}

WITH horses_data AS (
    SELECT
        ROW_NUMBER() OVER() AS RaceID, --This ID can change at any materialization, not to be used as a way to uniquely identify a record through time.
        RaceID,
        Cloth,
        Stall,
        WeightValue,
        JockeyID,
        AllowanceValue,
        OverweightValue,
        TrainerID,
        OwnerID,
        LastRunDaysFlat,
        Age,
        Bred,
        DamID,
        SireID,
        DamSireID,
        Sex,
        Colour,
        MeetingID,
        RaceNumber,
        HorseCount,
        Runners,
        Going,
        Weather,
        CourseDistance,
        RaceType,
        TrackType,
        Handicap,
        Eligibility, 
        CourseID,
        MeetingDate,
        Won
    FROM {{ ref('stg_horses') }}
),

winning horses AS (
    SELECT RaceID,
           HorseID
    FROM  ref('stg_horses')
    WHERE Won = 1
)

SELECT *
FROM horses_data

