

  create or replace table `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`ENCOUNTER_REASON`
  
  
  OPTIONS()
  as (
    

with source_encounter_reason as
(
select * from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_encounter_reason_bp_excld_sensitive_data`
union all
select * from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_encounter_reason_md_excld_sensitive_data`
union all
select * from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_encounter_reason_phc_md_excld_sensitive_data`
union all
select * from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_encounter_reason_phc_bp_excld_sensitive_data`
)
select * from source_encounter_reason
  );
  