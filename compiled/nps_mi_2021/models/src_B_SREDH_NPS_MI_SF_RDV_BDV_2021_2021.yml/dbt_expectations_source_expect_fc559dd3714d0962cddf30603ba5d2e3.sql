







with validation_errors as (

    select
        HUB_PATHOLOGY_RESULT_SK
    from `nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_PATHOLOGY_RESULT_OMOP`
    where 1=1
    
    group by
        HUB_PATHOLOGY_RESULT_SK
    having count(*) > 1

)
select * from validation_errors

