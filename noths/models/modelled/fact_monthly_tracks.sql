{{ config(
    enabled=true,
    materialized='table',    
    unique_key='monthly_track_pk',
    cluster_by=['activity_month'],    
    schema='mdl',
    tags=["modelled"],
) }}

with all_tracks as (
  select 
    TrackId
    , Name
  from {{ ref('cln_tracks') }}
  union 
  select distinct 
    TrackId
    , 'Unknown' as Name
  from {{ ref('cln_invoice_items') }}
  where TrackId not in (select TrackId from {{ ref('cln_tracks') }}) 
  )

, monthy_tracks as (
  select distinct 
    c.month as activity_month
    , t.TrackId
    , t.Name
  from 
    all_tracks as t,
    {{ ref('dim_calendar') }} as c 
  where c.calendar_date <= sysdate()
  )

, monthly_track_sales as (
  select
    date_trunc('month', i.InvoiceDate) as sale_month
    , ii.TrackId
    , count(distinct i.InvoiceId) as NumSales
    , sum(ii.Quantity) as Quantity
    , sum(ii.TotalCost) as TotalCost 
  from 
    {{ ref('cln_invoices') }} as i
  inner join {{ ref('cln_invoice_items') }} as ii on 
    i.InvoiceId = ii.InvoiceId
  group by 
    date_trunc('month', i.InvoiceDate)
    , ii.TrackId
  )

select
  {{ dbt_utils.surrogate_key(['mt.activity_month', 'mt.TrackId']) }} as monthly_track_pk
  , mt.activity_month
  , mt.TrackId
  , mt.Name as TrackName
  
  , coalesce(mts.NumSales, 0) as NumSales
  , coalesce(mts.Quantity, 0) as Quantity
  , coalesce(mts.TotalCost, 0) as TotalCost

  , sysdate() as ins_ts
from 
  monthy_tracks as mt
left join monthly_track_sales as mts on 
  mt.activity_month = mts.sale_month
  and mt.TrackId = mts.TrackId
