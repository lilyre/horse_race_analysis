with sky_passes as (
    select skypassid,
            skypasstype,
            description,
            cost as amountGBP,
            {{ convert_GBP_to('cost', 'USD') }} AS amountUSD,
            {{ convert_GBP_to('cost', 'EUR') }} AS amountEUR,
            {{ convert_GBP_to('cost', 'JPY') }} AS amountJPY
    FROM {{ ref("stg_sky_passes") }}
)

select * from sky_passes