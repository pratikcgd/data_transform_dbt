

  create or replace view `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_pathology_result_bp`
  OPTIONS()
  as 

with pathology_result_bp as (
select
cast(lpr.HUB_SITE_PATIENT_SK as string) as PATIENT_NUMBER,
cast(hpr.SITE_ID as string) as SITE_ID,
cast(hpr.SOURCE_SYSTEM as string) as SOURCE_SYSTEM,
cast('SAT_PATHOLOGY_RESULT_BP_OMOP' as string) as SOURCE_TABLE,
NULL as PROVIDER_ID,
NULL as PATHOLOGY_RESULT_ATOM_ID,
cast(hpr.PATHOLOGY_RESULT_ID as string) as PATHOLOGY_RESULT_ID,
cast(sprb.REPORT_DATE as TIMESTAMP) as RESULT_DATE,
cast(sprb.DATA_TYPE as string) as DATA_TYPE, 
cast(sprb.LOINC_CODE as string) as LOINC_CODE, 
cast(sprb.RESULT_NAME as string) as RESULT_NAME, 
cast(sprb.RESULT_VALUE as string) as RESULT_VALUE, 
cast(sprb.UNITS as string) as UNITS, 
cast('RANGE' as string) AS NORMAL_RANGE, 
cast(sprb.ABNORMAL_FLAG as string) as ABNORMAL_FLAG, 
cast(sprb.RECORD_STATUS as string) as RECORD_STATUS, 
cast(sprb.CREATED_DATETIME as TIMESTAMP) as CREATED_DATETIME, 
cast(sprb.UPDATED_DATETIME as TIMESTAMP) as UPDATED_DATETIME ,
CAST(sprb.OMD_EFFECTIVE_DATETIME AS TIMESTAMP) AS OMD_EFFECTIVE_DATETIME,
CAST(sprb.OMD_SOURCE_ROW_ID AS INT) AS OMD_SOURCE_ROW_ID,
CAST(sprb.OMD_INSERT_MODULE_INSTANCE_ID AS INT) AS OMD_INSERT_MODULE_INSTANCE_ID,
CAST(sprb.OMD_EXPIRY_DATETIME AS TIMESTAMP) AS OMD_EXPIRY_DATETIME,
CAST(sprb.OMD_CURRENT_RECORD_INDICATOR AS STRING) AS OMD_CURRENT_RECORD_INDICATOR,
CAST(sprb.OMD_DELETED_RECORD_INDICATOR AS STRING) AS OMD_DELETED_RECORD_INDICATOR,
CAST(sprb.OMD_RECORD_SOURCE_ID AS INT) AS OMD_RECORD_SOURCE_ID,
CAST(sprb.OMD_HASH_FULL_RECORD AS STRING) AS OMD_HASH_FULL_RECORD 
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_PATHOLOGY_RESULT_OMOP` hpr
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_PATHOLOGY_RESULT_BP_OMOP` sprb 
on hpr.HUB_PATHOLOGY_RESULT_SK = sprb.HUB_PATHOLOGY_RESULT_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_PATHOLOGY_RESULT_OMOP` lpr 
on hpr.HUB_PATHOLOGY_RESULT_SK = lpr.HUB_PATHOLOGY_RESULT_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LSAT_PATHOLOGY_RESULT_OMOP` lspr
on lpr.LNK_PATHOLOGY_RESULT_SK = lspr.LNK_PATHOLOGY_RESULT_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` hsp
ON lpr.HUB_SITE_PATIENT_SK = hsp.HUB_SITE_PATIENT_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_BP_OMOP` ssp
ON hsp.HUB_SITE_PATIENT_SK = ssp.HUB_SITE_PATIENT_SK
WHERE
	sprb.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND sprb.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND lspr.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND lspr.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND ssp.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND ssp.OMD_DELETED_RECORD_INDICATOR = 'N'
)

select * from pathology_result_bp;

