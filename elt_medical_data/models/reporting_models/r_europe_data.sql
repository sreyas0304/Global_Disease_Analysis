{{ config(materialized='view') }}
{{ config(schema='reporting_layer') }}

with eu_data as (
    select
        Country AS country,
        Year AS year,
        `Disease Name` as diseae_name,
        `Disease Category` as disease_cat,
        `Age Group` AS age_group,
        Gender AS gender,
        region,
        `Mortality Rate` AS mortality_rate,
        `Incidence Rate` AS incidence_rate,
        `Population Affected` AS pop_affected,
        `Treatment Type` AS treatment_type,
        `Average Treatment Cost USD` AS average_cost,
        Cost_Effectiveness_Ratio,
        Disease_Severity_Index,
        Recovery_Status,
        Disease_Trend
    from {{ref("europe_data")}}
)

select *
from eu_data