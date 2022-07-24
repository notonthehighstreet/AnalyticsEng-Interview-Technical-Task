{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}
    {%- set environment = target.name -%}

    {%- if environment == 'dev' -%}
        {{ custom_schema_name | trim }}
    {%- elif environment == 'continuous_integration' -%}
        {{ default_schema }}
    {%- else -%}
        {{ custom_schema_name | trim }}
    {%- endif -%}
{%- endmacro %}
