WITH customers as (
    SELECT 
    *
    FROM {{ ref("stg_customers") }}
),

usernames AS (
    SELECT
    *
    FROM {{ ref("sky_usernames") }}
),

final AS (
    SELECT
    *
    FROM customers
    LEFT JOIN usernames USING (customerid)
)

SELECT * FROM final