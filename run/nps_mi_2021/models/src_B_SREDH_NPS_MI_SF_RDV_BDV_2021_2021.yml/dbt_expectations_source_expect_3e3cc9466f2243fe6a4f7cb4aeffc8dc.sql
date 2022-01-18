select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

with all_values as (

    select distinct
        SOURCE_SYSTEM as value_field

    from `nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_ALLERGY_OMOP`
    

),
set_values as (

    select
        'BP_PHC' as value_field
    union all
    select
        'BP' as value_field
    union all
    select
        'MD_PHC' as value_field
    union all
    select
        'MD' as value_field
    
    

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


      
    ) dbt_internal_test