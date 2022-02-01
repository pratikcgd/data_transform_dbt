

  create or replace table `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`PRIMARY_HEALTH_NETWORK`
  
  
  OPTIONS()
  as (
    

select *
from `nps-omop-project`.`B_SREDH_UNSW_NPS_MI_SF_RDV_BDV_2021_SEEDS_ONLY`.`PHNCODE_DATA`
  );
  