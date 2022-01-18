select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

with all_values as (

    select distinct
        SOURCE_SYSTEM as value_field

    from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`SCRIPT_ITEM`
    

),
set_values as (

    select
        BP_PHC as value_field
    union all
    select
        MD_PHC as value_field
    union all
    select
        BP as value_field
    union all
    select
        MD as value_field
    
    

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


      
    ) dbt_internal_test