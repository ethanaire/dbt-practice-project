{{
    config(
        materialized='incremental'
    )
}}

SELECT
    order_id,
    customer_id,
    order_date,
    order_status,
    'New Value' AS comment
FROM {{ ref("stg_orders") }}

{% if is_incremental() %}
  WHERE "order_id" > (SELECT MAX("order_id") FROM {{ this }})
{% endif %}