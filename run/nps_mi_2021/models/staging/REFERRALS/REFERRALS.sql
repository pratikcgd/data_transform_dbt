

  create or replace table `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`REFERRALS`
  
  
  OPTIONS()
  as (
    

WITH referrals as (

select
SAFE_CAST(hub.SITE_ID as string) as SITE_ID,
SAFE_CAST(hub.HUB_SITE_PATIENT_SK as string) as PATIENT_NUMBER,
NULL as RECORD_ID,
NULL as PRACTITIONER_ID,
NULL as CATEGORY_NAME,
NULL as CREATED_BY,
SAFE_CAST(satt.PATIENT_CREATED_DATETIME as timestamp) as CREATED_DATETIME,
NULL as UPDATED_BY,
SAFE_CAST(satt.PATIENT_UPDATED_DATETIME as timestamp) as UPDATED_DATETIME,
SAFE_CAST(satt.RECORDSTATUS as int) AS RECORD_STATUS,
SAFE_CAST("BP" AS STRING) AS SOURCE_SYSTEM
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` hub
INNER join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_BP_OMOP` satt
on hub.HUB_SITE_PATIENT_SK = satt.HUB_SITE_PATIENT_SK
where
    satt.OMD_CURRENT_RECORD_INDICATOR = 'Y'

UNION ALL

select
SAFE_CAST(hub.SITE_ID as string) as SITE_ID,
SAFE_CAST(hub.HUB_SITE_PATIENT_SK as string) as PATIENT_NUMBER,
NULL as RECORD_ID,
NULL as PRACTITIONER_ID,
NULL as CATEGORY_NAME,
NULL as CREATED_BY,
SAFE_CAST(satt.PATIENT_CREATED_DATETIME as timestamp) as CREATED_DATETIME,
NULL as UPDATED_BY,
SAFE_CAST(satt.PATIENT_UPDATED_DATETIME as timestamp) as UPDATED_DATETIME,
NULL AS RECORD_STATUS,
SAFE_CAST("MD" as string) AS SOURCE_SYSTEM
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` hub
INNER join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_MD_OMOP` satt
on hub.HUB_SITE_PATIENT_SK = satt.HUB_SITE_PATIENT_SK
where
    satt.OMD_CURRENT_RECORD_INDICATOR = 'Y'

UNION ALL

select
SAFE_CAST(hub.SITE_ID as string) as SITE_ID,
SAFE_CAST(hub.HUB_SITE_PATIENT_SK as string) as PATIENT_NUMBER,
SAFE_CAST(satt.RECORD_NO as string) as RECORD_ID,
NULL as PRACTITIONER_ID,
NULL as CATEGORY_NAME,
SAFE_CAST(satt.CREATEDBY as string) as CREATED_BY,
SAFE_CAST(satt.CREATED as timestamp) as CREATED_DATETIME,
SAFE_CAST(satt.UPDATEDBY as string) as UPDATED_BY,
SAFE_CAST(satt.UPDATED as timestamp) as UPDATED_DATETIME,
SAFE_CAST(satt.RECORD_STATUS as int) AS RECORD_STATUS,
SAFE_CAST("PHC_BP" as string) AS SOURCE_SYSTEM
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` hub
INNER join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_PHC_BP_OMOP` satt
on hub.HUB_SITE_PATIENT_SK = satt.HUB_SITE_PATIENT_SK
where
    satt.OMD_CURRENT_RECORD_INDICATOR = 'Y'

UNION ALL

select
SAFE_CAST(hub.SITE_ID as string) as SITE_ID,
SAFE_CAST(hub.HUB_SITE_PATIENT_SK as string) as PATIENT_NUMBER,
NULL as RECORD_ID,
NULL as PRACTITIONER_ID,
NULL as CATEGORY_NAME,
NULL as CREATED_BY,
SAFE_CAST(satt.STAMP_CREATED_DATETIME as timestamp) as CREATED_DATETIME,
NULL as UPDATED_BY,
NULL as UPDATED_DATETIME,
NULL AS RECORD_STATUS,
SAFE_CAST("PHC_MD" as string) AS SOURCE_SYSTEM
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` hub
INNER join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_PHC_MD_OMOP` satt
on hub.HUB_SITE_PATIENT_SK = satt.HUB_SITE_PATIENT_SK
where
    satt.OMD_CURRENT_RECORD_INDICATOR = 'Y'
)

SELECT * FROM referrals
  );
  