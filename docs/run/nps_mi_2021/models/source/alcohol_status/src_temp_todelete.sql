

  create or replace view `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021_VIEWS_ONLY`.`src_temp_todelete`
  OPTIONS()
  as 

select *, 
CAST(CASE
    WHEN 
    PHN_CODE like '%,%' 
    THEN 'Multiple' 
    else PHN_CODE 
    end
    as string) as phns
from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021_VIEWS_ONLY`.`cancer`;

