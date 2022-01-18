

  create or replace view `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_pathology_bp`
  OPTIONS()
  as 

with pathology_bp as (
select 
cast(spbo.COLLECTION_DATE as TIMESTAMP) AS COLLECTION_DATE,
CAST(spbo.COMPLETION_FLAG AS STRING) AS COMPLETION_FLAG,
CAST(spbo.CONFIDENTIAL_FLAG AS STRING) AS CONFIDENTIAL_FLAG,
CAST(spbo.CREATED_DATETIME as TIMESTAMP) AS CREATED_DATETIME,
CAST(spbo.IMPORT_DATE AS TIMESTAMP) AS IMPORT_DATE,
CAST(null AS STRING) as LAB_NAME,
CAST(null AS STRING) as LAB_REFERENCE_ID,
CAST(spbo.NORMAL_FLAG AS STRING) AS NORMAL_FLAG,
CAST(spbo.OMD_EFFECTIVE_DATETIME AS TIMESTAMP) AS OMD_EFFECTIVE_DATETIME,
CAST(spbo.OMD_SOURCE_ROW_ID AS INT) AS OMD_SOURCE_ROW_ID,
CAST(spbo.OMD_INSERT_MODULE_INSTANCE_ID AS INT) AS OMD_INSERT_MODULE_INSTANCE_ID,
CAST(spbo.OMD_EXPIRY_DATETIME AS TIMESTAMP) AS OMD_EXPIRY_DATETIME,
CAST(spbo.OMD_CURRENT_RECORD_INDICATOR AS STRING) AS OMD_CURRENT_RECORD_INDICATOR,
CAST(spbo.OMD_DELETED_RECORD_INDICATOR AS STRING) AS OMD_DELETED_RECORD_INDICATOR,
CAST(spbo.OMD_RECORD_SOURCE_ID AS INT) AS OMD_RECORD_SOURCE_ID,
CAST(spbo.OMD_HASH_FULL_RECORD AS STRING) AS OMD_HASH_FULL_RECORD,
CAST(hpo.PATHOLOGY_ID as STRING) AS PATHOLOGY_ID,
CAST(lpo.HUB_SITE_PATIENT_SK as STRING) AS PATIENT_NUMBER,
CAST(spbo.PROVIDER_ID AS STRING) AS PROVIDER_ID,
CAST(spbo.RECORD_STATUS AS STRING) AS RECORD_STATUS,
CAST(spbo.REPORT_DATE as TIMESTAMP) AS REPORT_DATE,
CAST(spbo.REQUEST_DATE AS TIMESTAMP) AS REQUEST_DATE,
CAST(spbo.TEST_NAME AS STRING) AS RESULT_NAME,
CAST(hpo.SITE_ID AS STRING) AS SITE_ID,
CAST(hpo.SOURCE_SYSTEM AS STRING) AS SOURCE_SYSTEM,
CAST("SAT_PATHOLOGY_BP_OMOP" AS STRING) AS SOURCE_TABLE,
CAST(spbo.UPDATED_DATETIME as TIMESTAMP) AS UPDATED_DATETIME
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_PATHOLOGY_OMOP` hpo 
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_PATHOLOGY_BP_OMOP` spbo 
on hpo.HUB_PATHOLOGY_SK=spbo.HUB_PATHOLOGY_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_PATHOLOGY_OMOP` lpo
on hpo.HUB_PATHOLOGY_SK = lpo.HUB_PATHOLOGY_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LSAT_PATHOLOGY_OMOP` lspo 
on lpo.LNK_PATHOLOGY_SK = lspo.LNK_PATHOLOGY_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` hsp
ON lpo.HUB_SITE_PATIENT_SK = hsp.HUB_SITE_PATIENT_SK
INNER join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_BP_OMOP` ssp
ON hsp.HUB_SITE_PATIENT_SK = ssp.HUB_SITE_PATIENT_SK
WHERE
	spbo.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND spbo.OMD_DELETED_RECORD_INDICATOR = 'N'
	AND lspo.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND lspo.OMD_DELETED_RECORD_INDICATOR = 'N'
	AND ssp.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND ssp.OMD_DELETED_RECORD_INDICATOR = 'N'
)

select * from pathology_bp;

