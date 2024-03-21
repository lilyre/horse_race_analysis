WITH horses AS (
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
            Age,
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
            Bred,
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
    from {{ source("horse_raw_data", "races") }}
)

select * from horses