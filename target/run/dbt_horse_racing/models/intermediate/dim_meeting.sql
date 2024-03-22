
  
    

    create or replace table `dt-pod-da2-sandbox-dev`.`dev_lily_horses_marts`.`dim_meeting`
    
    
    OPTIONS()
    as (
      

SELECT DISTINCT 
       MeetingID,
       MeetingDate
FROM `dt-pod-da2-sandbox-dev`.`dev_lily_horses_staging`.`stg_horses`
    );
  