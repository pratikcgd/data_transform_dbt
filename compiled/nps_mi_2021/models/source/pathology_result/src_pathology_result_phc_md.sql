

with pathology_result_phc_md as (
select
cast(NULL as string) as PATIENT_NUMBER,
cast(hpr.SITE_ID as string) as SITE_ID,
cast(hpr.SOURCE_SYSTEM as string) as SOURCE_SYSTEM,
cast('SAT_PATHOLOGY_RESULT_MD_OMOP' as string) as SOURCE_TABLE,
NULL as PROVIDER_ID,
NULL as PATHOLOGY_RESULT_ATOM_ID,
cast(hpr.PATHOLOGY_RESULT_ID as string) as PATHOLOGY_RESULT_ID,
cast(sprm.RESULT_DATE as TIMESTAMP) as RESULT_DATE,
cast(sprm.PATH_CODE as string) as DATA_TYPE, 
cast(sprm.LOINC as string) as LOINC_CODE, 
cast(sprm.TEST_NAME as string) as RESULT_NAME, 
cast(sprm.RESULT as string) as RESULT_VALUE, 
cast(sprm.UNITS as string) as UNITS, 
cast(sprm.NORMAL_RANGE as string) AS NORMAL_RANGE, 
cast(sprm.ABNORMAL_FLAGS as string) as ABNORMAL_FLAG, 
cast(NULL as string) as RECORD_STATUS, 
cast(sprm.STAMP_CREATED_DATETIME as TIMESTAMP) as CREATED_DATETIME, 
cast(sprm.STAMP_DATETIME as timestamp) as UPDATED_DATETIME ,
CAST(sprm.OMD_EFFECTIVE_DATETIME AS TIMESTAMP) AS OMD_EFFECTIVE_DATETIME,
CAST(sprm.OMD_SOURCE_ROW_ID AS INT) AS OMD_SOURCE_ROW_ID,
CAST(sprm.OMD_INSERT_MODULE_INSTANCE_ID AS INT) AS OMD_INSERT_MODULE_INSTANCE_ID,
CAST(sprm.OMD_EXPIRY_DATETIME AS TIMESTAMP) AS OMD_EXPIRY_DATETIME,
CAST(sprm.OMD_CURRENT_RECORD_INDICATOR AS STRING) AS OMD_CURRENT_RECORD_INDICATOR,
CAST(sprm.OMD_DELETED_RECORD_INDICATOR AS STRING) AS OMD_DELETED_RECORD_INDICATOR,
CAST(sprm.OMD_RECORD_SOURCE_ID AS INT) AS OMD_RECORD_SOURCE_ID,
CAST(sprm.OMD_HASH_FULL_RECORD AS STRING) AS OMD_HASH_FULL_RECORD 
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_PATHOLOGY_RESULT_OMOP` hpr
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_PATHOLOGY_RESULT_PHC_MD_OMOP` sprm 
on hpr.HUB_PATHOLOGY_RESULT_SK = sprm.HUB_PATHOLOGY_RESULT_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_PATHOLOGY_SITE_RESULT_OMOP` lpr 
on hpr.HUB_PATHOLOGY_RESULT_SK = lpr.HUB_PATHOLOGY_RESULT_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LSAT_PATHOLOGY_SITE_RESULT_OMOP` lspr
on lpr.LNK_PATHOLOGY_SITE_RESULT_SK = lspr.LNK_PATHOLOGY_SITE_RESULT_SK
WHERE
	sprm.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND sprm.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND lspr.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND lspr.OMD_DELETED_RECORD_INDICATOR = 'N'
)

select * from pathology_result_phc_md