







with validation_errors as (

    select
        PATIENT_NUMBER
    from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`PATIENT`
    where 1=1
    
    group by
        PATIENT_NUMBER
    having count(*) > 1

)
select * from validation_errors

