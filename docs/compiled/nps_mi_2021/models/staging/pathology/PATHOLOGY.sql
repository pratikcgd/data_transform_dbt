

with source_pathology_status as
(
select * from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_pathology_bp`
UNION all
select * from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_pathology_phc_bp`
UNION all
select * from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_pathology_md`
UNION all
select * from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_pathology_phc_md`
)
select * from source_pathology_status