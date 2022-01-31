







with validation_errors as (

    select
        HUB_SITE_PATIENT_ALCOHOL_STATUS_BP_SK
    from `nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_BDV_PRESCRIPTION_SCRIPT_ITEM_OMOP`
    where 1=1
    
    group by
        HUB_SITE_PATIENT_ALCOHOL_STATUS_BP_SK
    having count(*) > 1

)
select * from validation_errors

