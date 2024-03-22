
  
    

    create or replace table `dt-pod-da2-sandbox-dev`.`dev_lily_horses_reporting`.`age_vs_won`
    
    
    OPTIONS()
    as (
      with horse_distribution AS (
    SELECT 
    h.HorseAge,
    COUNT(*) AS HorseCount
FROM 
    `dt-pod-da2-sandbox-dev`.`dev_lily_horses_marts`.`fct_race_events` r
LEFT JOIN 
    `dt-pod-da2-sandbox-dev`.`dev_lily_horses_marts`.`dim_horses` h ON r.HorseID = r.HorseID
GROUP BY 
    h.HorseAge
ORDER BY 
    h.HorseAge
),

percentage_won AS (
    SELECT 
        HorseAge,
        COUNT(Won) AS Number_of_won_races, 
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS win_percentage
    FROM `dt-pod-da2-sandbox-dev`.`dev_lily_horses_marts`.`fct_race_events` r
    WHERE won = 1
    GROUP BY HorseAge
    ORDER BY HorseAge
)

SELECT 
    hd.HorseAge,
    hd.HorseCount,
    pw.Number_of_won_races, 
    pw.win_percentage
FROM horse_distribution hd
LEFT JOIN percentage_won pw ON hd.HorseAge = pw.HorseAge
ORDER BY hd.HorseAge
    );
  