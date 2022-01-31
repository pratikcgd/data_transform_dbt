







with validation_errors as (

    select
        HUB_REQUESTED_TEST_SK
    from `nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_REQUESTED_TEST_OMOP`
    where 1=1
    
    group by
        HUB_REQUESTED_TEST_SK
    having count(*) > 1

)
select * from validation_errors

