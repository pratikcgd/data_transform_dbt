





    with grouped_expression as (
    select
        
        
    
  
( 1=1 and length(
        BILLING_ID
    ) >= 1 and length(
        BILLING_ID
    ) <= 6
)
 as expression


    from `nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_BILLING_OMOP`
    

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






