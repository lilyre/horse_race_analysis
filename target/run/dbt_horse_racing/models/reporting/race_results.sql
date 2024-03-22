
  
    

    create or replace table `dt-pod-da2-sandbox-dev`.`dev_lily_horses_reporting`.`race_results`
    
    
    OPTIONS()
    as (
      

SELECT 
    m.MeetingDate,
    r.RaceID,
    r.HorseID,
    r.RaceNumber,
    r.Won
FROM 
    `dt-pod-da2-sandbox-dev`.`dev_lily_horses_marts`.`fct_race_events` r
LEFT JOIN 
    `dt-pod-da2-sandbox-dev`.`dev_lily_horses_marts`.`dim_meeting` m ON r.MeetingID = m.MeetingID
ORDER BY
m.MeetingDate
    );
  