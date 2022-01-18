select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      





    with grouped_expression as (
    select
        
        
    
  
( 1=1 and length(
        IMMUNISATION_ID
    ) >= 1 and length(
        IMMUNISATION_ID
    ) <= 8
)
 as expression


    from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`IMMUNISATION`
    

),
validation_errors as (

    select
        *
    from
        grouped_expression
    where
        not(expression = true)

)

select *
from validation_errors







      
    ) dbt_internal_test