

with all_values as (

    select distinct
        SOURCE_SYSTEM as value_field

    from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`CLINICAL_USER`
    

),
set_values as (

    select
        PHC_BP as value_field
    union all
    select
        BP as value_field
    union all
    select
        MD as value_field
    union all
    select
        PHC_MD as value_field
    
    

),
unique_set_values as (

    select distinct value_field
    from
        set_values

),
validation_errors as (
    -- values from the model that are not in the set
    select
        v.value_field
    from
        all_values v
        left join
        unique_set_values s on v.value_field = s.value_field
    where
        s.value_field is null

)

select *
from validation_errors

