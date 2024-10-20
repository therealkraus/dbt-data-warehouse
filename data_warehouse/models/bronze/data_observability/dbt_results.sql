{{
  config(
    materialized = 'incremental',
    transient = False,
    unique_key = 'result_id'
  )
}}

with empty_table as (
    select
        cast(null as varchar) as result_id,
        cast(null as varchar) as invocation_id,
        cast(null as varchar) as unique_id,
        cast(null as varchar) as database_name,
        cast(null as varchar) as schema_name,
        cast(null as varchar) as name,
        cast(null as varchar) as resource_type,
        cast(null as varchar) as status,
        cast(null as float) as execution_time,
        cast(null as int) as rows_affected
)

select * from empty_table
-- This is a filter so we will never actually insert these values
where 1 = 0