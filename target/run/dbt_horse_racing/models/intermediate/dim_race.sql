
  
    

    create or replace table `dt-pod-da2-sandbox-dev`.`dev_lily_horses_marts`.`dim_race`
    
    
    OPTIONS()
    as (
      

SELECT DISTINCT RaceID,
       RaceType,
       CourseID,
       Weather,
       TrackType,
       Handicap,
       Eligibility
FROM `dt-pod-da2-sandbox-dev`.`dev_lily_horses_staging`.`stg_horses`
    );
  