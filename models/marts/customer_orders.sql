{{
    config(
        materialized='table'
    )
}}

SELECT
    c."ID" AS customer_id,
    c."FIRST_NAME" AS first_name,
    c."LAST_NAME" AS last_name,
    o."ID" AS order_id,
    o."ORDER_DATE" AS order_date,
    o."STATUS" AS order_status,
    p."ID" AS payment_id,
    p."PAYMENTMETHOD" AS payment_method,
    p."STATUS" AS payment_status,
    p."AMOUNT" AS payment_amount,
    p."CREATED" AS payment_date
FROM {{ source('jaffle_shop', 'customers') }} c
LEFT JOIN {{ source('jaffle_shop', 'orders') }} o
    ON c."ID" = o."USER_ID"
LEFT JOIN {{ source('jaffle_shop', 'stripe_payments') }} p
    ON o."ID" = p."ORDERID"