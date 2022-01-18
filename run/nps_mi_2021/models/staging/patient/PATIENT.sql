

  create or replace table `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`PATIENT`
  
  
  OPTIONS()
  as (
    

with source_patient as
(
select * from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_patients_bp`
UNION all
select * from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_patients_md`
UNION all
select * from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_patients_phc_bp`
UNION all
select * from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_patients_phc_md`
)
select * from source_patient
  );
  