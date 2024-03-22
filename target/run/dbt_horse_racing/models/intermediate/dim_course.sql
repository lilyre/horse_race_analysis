
  
    

    create or replace table `dt-pod-da2-sandbox-dev`.`dev_lily_horses_marts`.`dim_course`
    
    
    OPTIONS()
    as (
      

SELECT DISTINCT 
       CourseID,
       IF(RaceType IS NULL, 'Flat', RaceType) as RaceType
FROM `dt-pod-da2-sandbox-dev`.`dev_lily_horses_staging`.`stg_horses`
    );
  