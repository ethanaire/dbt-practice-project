{% macro convert_timezone(column_name, from_tz, to_tz) %}
    ("{{ column_name }}" AT TIME ZONE '{{ from_tz }}') AT TIME ZONE '{{ to_tz }}'
{% endmacro %}