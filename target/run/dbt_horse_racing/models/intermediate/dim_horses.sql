
  
    

    create or replace table `dt-pod-da2-sandbox-dev`.`dev_lily_horses_marts`.`dim_horses`
    
    
    OPTIONS()
    as (
      

WITH distinct_horses as (
    SELECT DISTINCT 
       HorseID, --inserted a versionID for the scd2 table, where the table keeps a record of change in age of the horse
       HorseAge,
       CountryWhereBred,
       Sex,
       Colour,
       DamID,
       SireID,
       DamSireID
FROM `dt-pod-da2-sandbox-dev`.`dev_lily_horses_staging`.`stg_horses`
),

rank_age as (
    SELECT
    HorseID,
    ROW_NUMBER() OVER (PARTITION BY HorseID ORDER BY HorseAge) as VersionID, --inserted a versionID for the scd2 table, where the table keeps a record of change in age of the horse
    HorseAge,
    CountryWhereBred,
    Sex,
    Colour,
    DamID,
    SireID,
    DamSireID
    FROM distinct_horses
)

SELECT
    to_hex(md5(cast(coalesce(cast(HorseID as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(VersionID as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) AS SurrogateHorseID,
    HorseID,
    VersionID, --inserted a versionID for the scd2 table, where the table keeps a record of change in age of the horse
    HorseAge,
    CountryWhereBred,
    Sex,
    Colour,
    DamID,
    SireID,
    DamSireID
FROM rank_age
    );
  