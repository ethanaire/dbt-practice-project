{{
    config(
        materialized='view'
    )
}}

WITH dim_customers AS
(
    SELECT  "ID" AS customer_id,
            "FIRST_NAME" AS first_name,
            "LAST_NAME" AS last_name
    FROM    {{ source('jaffle_shop', 'customers')}}
)
SELECT  *
FROM    dim_customers