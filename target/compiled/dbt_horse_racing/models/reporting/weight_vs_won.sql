with horse_distribution AS (
    SELECT 
    r.WeightValue,
    COUNT(*) AS HorseCount
FROM 
    `dt-pod-da2-sandbox-dev`.`dev_lily_horses_marts`.`fct_race_events` r
LEFT JOIN 
    `dt-pod-da2-sandbox-dev`.`dev_lily_horses_marts`.`dim_horses` h ON h.HorseID = r.HorseID
GROUP BY 
    r.WeightValue
ORDER BY 
    r.WeightValue
),

percentage_won AS (
    SELECT 
        WeightValue,
        COUNT(Won) AS Number_of_won_races, 
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS win_percentage
    FROM `dt-pod-da2-sandbox-dev`.`dev_lily_horses_marts`.`fct_race_events` r
    WHERE won = 1
    GROUP BY WeightValue
    ORDER BY WeightValue
)

SELECT 
    hd.WeightValue,
    hd.HorseCount,
    pw.Number_of_won_races, 
    pw.win_percentage
FROM horse_distribution hd
LEFT JOIN percentage_won pw ON hd.WeightValue = pw.WeightValue
ORDER BY hd.WeightValue