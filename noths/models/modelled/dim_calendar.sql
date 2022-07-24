{{ config (
    enabled=true,
    materialized='table', 
    unique_key='calendar_id', 
    schema='mdl',
    tags=["modelled"],
)}}

with t_days AS (
    select 
        to_date(dateadd(day, SEQ4(), '{{ var('noths_epoch') }}')) as calendar_date
    from table(generator(rowcount=>12694))  
  )
 
select 
    to_number(to_varchar(calendar_date, 'yyyymmdd')) calendar_id
    , calendar_date
    , date_trunc('week', calendar_date) as week
    , DATEADD(day, 6, week) AS week_last_day
    , date_trunc('month', calendar_date) as month
    , DATEADD(day, -1, DATEADD(month, 1, month)) AS month_last_day
    , date_trunc('quarter', calendar_date) as quarter
    , DATEADD(day, -1, DATEADD(quarter, 1, quarter)) AS quarter_last_day
    , date_trunc('year', calendar_date) as year
    , DATEADD(day, -1, DATEADD(year, 1, year)) AS year_last_day
    
    , DAY(calendar_date) as day_of_month
    , DAYOFWEEK(calendar_date) as day_of_week
    , DAYOFYEAR(calendar_date) as day_of_year
    , WEEKOFYEAR(calendar_date) as week_of_year
    , MONTH(calendar_date) as month_of_year
    , MONTHNAME(calendar_date) as month_name
    , QUARTER(calendar_date) as quarter_of_year
    , YEAR(calendar_date) as year_num
    , day_of_week IN (6,0) AS is_weekend
from t_days 
