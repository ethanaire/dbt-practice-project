-- tests/fact_orders_no_future_order_date.sql
SELECT *
FROM {{ ref('fact_orders') }}
WHERE order_date >= current_date + 1