{% test test_date_not_in_future(model, column_name) %}
    select *
    from {{ model }}
    where cast({{ column_name }} as date) >= current_date + 1
{% endtest %}