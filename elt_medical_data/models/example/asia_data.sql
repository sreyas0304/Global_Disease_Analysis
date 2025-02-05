{{ config(materialized='table') }}
{{ config(
    schema='transform_dataset'
) }}


with asia_data as (

    select *,
        'Asia' AS region,
        -- Cost-Effectiveness Ratio Calculation
            SAFE_DIVIDE(`Average Treatment Cost USD`, `Recovery Rate`) AS Cost_Effectiveness_Ratio,
            
            -- Disease Severity Index Calculation
            (0.2 * `Prevalence Rate`) + 
            (0.2 * `Incidence Rate`) + 
            (0.6 * `Mortality Rate`) AS Disease_Severity_Index,

            -- Recovery Status Flag
            CASE 
                WHEN `Recovery Rate` < 0.50 THEN 'Poor'
                WHEN `Recovery Rate` BETWEEN 0.50 AND 0.75 THEN 'Fair'
                WHEN `Recovery Rate` > 0.75 THEN 'Good'
                ELSE 'Unknown'
            END AS Recovery_Status,

            -- Disease Trend Flag
            CASE 
                WHEN `Improvement in 5 Years` > 7 THEN 'Improving'
                WHEN `Improvement in 5 Years` BETWEEN 2 AND 7 THEN 'Stable'
                WHEN `Improvement in 5 Years` < 2 THEN 'Worsening'
                ELSE 'Unknown'
            END AS Disease_Trend
    from staging_dataset.global_data
    where country IN ('India', 'South Korea', 'Japan', 'China', 'Indonesia') AND `Availability of Vaccines Treatment` = False

)

select *
from asia_data
