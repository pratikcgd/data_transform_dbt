select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      




    with grouped_expression as (
    select
        
        
    
  LNK_SITE_PATIENT_CLINICAL_MD_SK is not null as expression


    from `nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_SITE_PATIENT_CLINICAL_MD_OMOP`
    

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