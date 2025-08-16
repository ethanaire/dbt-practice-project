{% snapshot fact_orders_incremental_snapshot %}
    {{
        config(
            target_schema='snapshots',
            unique_key='order_id',
            strategy='timestamp',
            updated_at='order_date'
        )
    }}

    SELECT
        order_id,
        customer_id,
        order_date,
        order_status,
        comment
    FROM {{ ref('fact_orders_incremental') }}

{% endsnapshot %}