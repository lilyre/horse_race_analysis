
  
    

    create or replace table `dt-pod-da2-sandbox-dev`.`dev_lily_horses_marts`.`fct_race_events`
    
    
    OPTIONS()
    as (
      

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
    FROM `dt-pod-da2-sandbox-dev`.`dev_lily_horses_staging`.`stg_horses`
)

SELECT *
FROM horses_data
    );
  