
  
    

    create or replace table `dt-pod-da2-sandbox-dev`.`dev_lily_horses_marts`.`dim_race_type`
    
    
    OPTIONS()
    as (
      

SELECT RaceType,
       Handicap,
       Eligibility,
       HorseCount
FROM `dt-pod-da2-sandbox-dev`.`dev_lily_horses_staging`.`stg_horses`
    );
  