

  create or replace view `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021_VIEWS_ONLY`.`src_alcohol_phc_md`
  OPTIONS()
  as 

with alcohol_phc_md as (
select
CAST(lasb.HUB_SITE_PATIENT_SK AS STRING) AS PATIENT_NUMBER,
CAST(hasb.SITE_ID AS STRING) AS SITE_ID,
NULL AS PROVIDER_ID,
CAST("MD_PHC" AS STRING) AS SOURCE_SYSTEM,
CAST("SAT_SITE_PATIENT_CLINICAL_PHC_MD_OMOP" AS STRING) AS SOURCE_TABLE,
CAST(null AS STRING) AS RECORD_ID,
CAST(null AS STRING) AS RECORD_STATUS,
CAST(CASE 
		WHEN sspasb.ALCOHOL_EX = '1'
		THEN 1
		WHEN sspasb.ALCOHOL_EX = '2' OR sspasb.ALCOHOL_EX = '3'
		THEN 2
		WHEN sspasb.ALCOHOL_EX = '4' OR sspasb.ALCOHOL_EX = '5'
		THEN 3
		WHEN sspasb.ALCOHOL_EX = '6' OR sspasb.ALCOHOL_EX = '7'
		THEN 4
		ELSE
		null
		END AS STRING) AS ALCOHOL_CODE,
CAST(CASE 
		WHEN sspasb.ALCOHOL_EX = '1'
		THEN 'Nil'
		WHEN sspasb.ALCOHOL_EX = '2' OR sspasb.ALCOHOL_EX = '3'
		THEN 'Ocassional'
		WHEN sspasb.ALCOHOL_EX = '4' OR sspasb.ALCOHOL_EX = '5'
		THEN 'Moderate'
		WHEN sspasb.ALCOHOL_EX = '6' OR sspasb.ALCOHOL_EX = '7'
		THEN 'Heavy'
		ELSE
		null
		END AS STRING) AS ALCOHOL_STATUS_NAME,
CAST(null AS STRING) AS PAST_ALCOHOL_CODE,
CAST(null AS INT) AS DRINKS_PER_DAY,
CAST(null AS INT) AS DAYS_PER_WEEK,
CAST(null AS STRING) AS ALCOHOL_ASSESSMENT_DATE,
CAST(null AS STRING) AS YEAR_STARTED,
CAST(null AS STRING) AS YEAR_STOPPED,
CAST(null AS STRING) AS PAST_DRINKS_PER_DAY,
CAST(null AS STRING) AS PAST_DAYS_PER_WEEK,
CAST(sspasb.STAMP_CREATED_DATETIME AS TIMESTAMP) AS CREATED_DATETIME, 
CAST(sspasb.STAMP_DATETIME AS TIMESTAMP) AS UPDATED_DATETIME,
CAST(sspasb.OMD_EFFECTIVE_DATETIME AS TIMESTAMP) AS OMD_EFFECTIVE_DATETIME,
CAST(sspasb.OMD_SOURCE_ROW_ID AS INT) AS OMD_SOURCE_ROW_ID,
CAST(sspasb.OMD_INSERT_MODULE_INSTANCE_ID AS INT) AS OMD_INSERT_MODULE_INSTANCE_ID,
CAST(sspasb.OMD_EXPIRY_DATETIME AS TIMESTAMP) AS OMD_EXPIRY_DATETIME,
CAST(sspasb.OMD_CURRENT_RECORD_INDICATOR AS STRING) AS OMD_CURRENT_RECORD_INDICATOR,
CAST(sspasb.OMD_DELETED_RECORD_INDICATOR AS STRING) AS OMD_DELETED_RECORD_INDICATOR,
CAST(sspasb.OMD_RECORD_SOURCE_ID AS INT) AS OMD_RECORD_SOURCE_ID,
CAST(sspasb.OMD_HASH_FULL_RECORD AS STRING) AS OMD_HASH_FULL_RECORD
from `nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_CLINICAL_MD_OMOP` hasb
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_CLINICAL_PHC_MD_OMOP` sspasb
on hasb.HUB_SITE_PATIENT_CLINICAL_MD_SK = sspasb.HUB_SITE_PATIENT_CLINICAL_MD_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_SITE_PATIENT_CLINICAL_MD_OMOP` lasb
on hasb.HUB_SITE_PATIENT_CLINICAL_MD_SK = lasb.HUB_SITE_PATIENT_CLINICAL_MD_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LSAT_SITE_PATIENT_CLINICAL_MD_OMOP` lsasb
on lasb.LNK_SITE_PATIENT_CLINICAL_MD_SK = lsasb.LNK_SITE_PATIENT_CLINICAL_MD_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` hsp
ON lasb.HUB_SITE_PATIENT_SK = hsp.HUB_SITE_PATIENT_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_PHC_MD_OMOP` ssp
ON hsp.HUB_SITE_PATIENT_SK = ssp.HUB_SITE_PATIENT_SK
WHERE
	sspasb.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND sspasb.OMD_DELETED_RECORD_INDICATOR = 'N'
	AND lsasb.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND lsasb.OMD_DELETED_RECORD_INDICATOR = 'N'
	AND ssp.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND ssp.OMD_DELETED_RECORD_INDICATOR = 'N'
)

SELECT DISTINCT * FROM 
alcohol_phc_md s1
where OMD_SOURCE_ROW_ID = (SELECT MAX(OMD_SOURCE_ROW_ID) 
FROM alcohol_phc_md s2
WHERE s1.PATIENT_NUMBER = s2.PATIENT_NUMBER);

