with source_script_item as
(
select * from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021_VIEWS_ONLY`.`src_script_item_grh_md`
union all 
select * from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021_VIEWS_ONLY`.`src_script_item_grh_bp`
union all
select * from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021_VIEWS_ONLY`.`src_script_item_phc_md`
union all
select * from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021_VIEWS_ONLY`.`src_script_item_phc_bp`
)
select * from source_script_item