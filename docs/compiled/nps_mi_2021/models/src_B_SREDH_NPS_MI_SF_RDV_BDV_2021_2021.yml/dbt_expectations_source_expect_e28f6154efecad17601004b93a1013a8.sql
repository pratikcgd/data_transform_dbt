

with all_values as (

    select distinct
        TEST_NAME as value_field

    from `nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_BDV_PATHOLOGY_OMOP`
    

),
set_values as (

    select
        'GFR' as value_field
    union all
    select
        'HBA1C' as value_field
    union all
    select
        'LIPIDS' as value_field
    union all
    select
        'ALBUMIN' as value_field
    
    

),
unique_set_values as (

    select distinct value_field
    from
        set_values

),
validation_errors as (
    -- values in set that are not in the list of values from the model
    select
        s.value_field
    from
        unique_set_values s
        left join
        all_values v on s.value_field = v.value_field
    where
        v.value_field is null

)

select *
from validation_errors

