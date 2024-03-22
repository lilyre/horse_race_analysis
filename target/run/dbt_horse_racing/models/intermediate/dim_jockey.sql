
  
    

    create or replace table `dt-pod-da2-sandbox-dev`.`dev_lily_horses_marts`.`dim_jockey`
    
    
    OPTIONS()
    as (
      

SELECT DISTINCT 
       JockeyID
FROM `dt-pod-da2-sandbox-dev`.`dev_lily_horses_staging`.`stg_horses`
    );
  