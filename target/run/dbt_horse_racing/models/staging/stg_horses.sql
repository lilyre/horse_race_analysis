

  create or replace view `dt-pod-da2-sandbox-dev`.`dev_lily_horses_staging`.`stg_horses`
  OPTIONS()
  as WITH horses AS (
    SELECT RaceID,
           HorseID,
           Cloth,
            Stall,
            WeightValue,
            JockeyID,
            AllowanceValue,
            OverweightValue,
            TrainerID,
            OwnerID,
            LastRunDaysFlat,
            Age as HorseAge,
            -- Blinkers,
            -- Hood,
            -- Visor,
            -- EyeShield,
            -- Eyecover,
            -- TongueStrap,
            -- CheekPieces,
            -- ForecastPrice,
            -- StatCourse,
            -- StatDistance,
            -- StatCourseDistance,
            -- StartingPrice,
            Bred as CountryWhereBred,
            DamID,
            SireID,
            DamSireID,
            Sex,
            Colour,
            -- YearBorn,
            MeetingID,
            RaceNumber,
            -- ScheduledTime,
            HorseCount,
            Runners,
            Going,
            Weather,
            Course_Distance AS CourseDistance, -- Reformatting the name for consitency
            RaceType,
            TrackType,
            Handicap,
            eligibility AS Eligibility, -- Reformatting the name for consitency
            CourseID,
            MeetingDate,
            Won
    from `dt-pod-da2-sandbox-dev`.`lily_dbt_source`.`races`
)

select * from horses;

