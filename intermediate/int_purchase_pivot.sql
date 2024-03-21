{% set purchases_types = dbt_utils.get_column_values(table=ref('stg_purchases'), column='purchasetype') %}

WITH purchases AS (
    select *
    from {{ ref("stg_purchases") }}
),

pivoted AS (
    SELECT 
        skypassid,
        {% for purchasetype in purchases_types %}
            sum(case when purchasetype = '{{purchasetype}}' then quantity else 0 end) as {{purchasetype}}_quantity,
        {% endfor %}
    FROM
        purchases
    GROUP BY 1
)

SELECT * FROM pivoted