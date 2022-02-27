

  create or replace view `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021_VIEWS_ONLY`.`src_smoking_phc_md`
  OPTIONS()
  as 

with smoking_phc_md as (

select 
CAST(lssb.HUB_SITE_PATIENT_SK AS STRING) AS PATIENT_NUMBER,
CAST(hssb.SITE_ID AS STRING) AS SITE_ID,
cast("PHC_MD" as STRING) AS SOURCE_SYSTEM,
cast('SAT_SITE_PATIENT_CLINICAL_PHC_MD_OMOP' as STRING) as SOURCE_TABLE,
NULL AS PROVIDER_ID,
cast(hssb.RECORD_ID AS STRING) as RECORD_ID,
cast(NULL as STRING) as RECORD_STATUS,
cast(case 
		when sssb.SMOKER = 'N' or sssb.SMOKER = 'n'
		then 1
		when sssb.SMOKER = 'X'
		then 2
		when sssb.SMOKER = 'Y'
		then 3
		ELSE
		0
		END as int) as SMOKING_STATUS_CODE,
cast(case 
		when sssb.SMOKER = 'N' or sssb.SMOKER = 'n'
		then 'Non-Smoker'
		when sssb.SMOKER = 'X'
		then 'Ex-Smoker'
		when sssb.SMOKER = 'Y'
		then 'Smoker'
		ELSE
		'Not Recorded'
		END as STRING) as SMOKING_STATUS_NAME,
cast(null as int) AS PAST_SMOKING_CODE,
cast(null as int) as SMOKING_PRODUCT_TYPE,
cast(sssb.STARTED_SMOKING as STRING) as SMOKING_START_YEAR,
cast(null as INT) as PAST_SMOKING_START_YEAR,
cast(NULL as STRING) as SMOKING_FREQUENCY,
cast(sssb.SMOKES_PER_DAY as int) as SMOKES_PER_DAY,
cast(sssb.ceased_smoking as STRING) as SMOKING_CEASED_DATE,
cast(null as INT) as PAST_SMOKING_STOPPED_YEAR,
cast(NULL as STRING) AS SMOKING_ASSESSMENT_DATE, 
cast(NULL AS STRING) as SMOKING_CHANGE_STAGE_ASSESSMENT,
cast(NULL as STRING) AS SMOKING_LAST_QUIT_ATTEMPT_DATE, 
cast(NULL as STRING) as SMOKING_LONGEST_ABSTINENCE_DURATION,
cast(NULL as STRING) as SMOKING_ABSTINENCE_UNIT , 
cast(NULL as STRING) as SMOKING_COMMENT,  
CAST(sssb.STAMP_CREATED_DATETIME AS TIMESTAMP) AS CREATED_DATETIME, 
CAST(sssb.STAMP_DATETIME AS TIMESTAMP) AS UPDATED_DATETIME,
CAST(sssb.OMD_EFFECTIVE_DATETIME AS TIMESTAMP) AS OMD_EFFECTIVE_DATETIME,
CAST(sssb.OMD_SOURCE_ROW_ID AS INT) AS OMD_SOURCE_ROW_ID,
CAST(sssb.OMD_INSERT_MODULE_INSTANCE_ID AS INT) AS OMD_INSERT_MODULE_INSTANCE_ID,
CAST(sssb.OMD_EXPIRY_DATETIME AS TIMESTAMP) AS OMD_EXPIRY_DATETIME,
CAST(sssb.OMD_CURRENT_RECORD_INDICATOR AS STRING) AS OMD_CURRENT_RECORD_INDICATOR,
CAST(sssb.OMD_DELETED_RECORD_INDICATOR AS STRING) AS OMD_DELETED_RECORD_INDICATOR,
CAST(sssb.OMD_RECORD_SOURCE_ID AS INT) AS OMD_RECORD_SOURCE_ID,
CAST(sssb.OMD_HASH_FULL_RECORD AS STRING) AS OMD_HASH_FULL_RECORD 
from `nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_CLINICAL_MD_OMOP` hssb
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_CLINICAL_PHC_MD_OMOP` sssb
on hssb.HUB_SITE_PATIENT_CLINICAL_MD_SK = sssb.HUB_SITE_PATIENT_CLINICAL_MD_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_SITE_PATIENT_CLINICAL_MD_OMOP` lssb
on hssb.HUB_SITE_PATIENT_CLINICAL_MD_SK = lssb.HUB_SITE_PATIENT_CLINICAL_MD_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LSAT_SITE_PATIENT_CLINICAL_MD_OMOP` lsssb
on lssb.LNK_SITE_PATIENT_CLINICAL_MD_SK = lsssb.LNK_SITE_PATIENT_CLINICAL_MD_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` hsp
ON lssb.HUB_SITE_PATIENT_SK = hsp.HUB_SITE_PATIENT_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_PHC_MD_OMOP` ssp
ON hsp.HUB_SITE_PATIENT_SK = ssp.HUB_SITE_PATIENT_SK
WHERE
	sssb.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND sssb.OMD_DELETED_RECORD_INDICATOR = 'N'
	AND lsssb.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND lsssb.OMD_DELETED_RECORD_INDICATOR = 'N'
	AND ssp.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND ssp.OMD_DELETED_RECORD_INDICATOR = 'N'

)

SELECT DISTINCT * FROM 
smoking_phc_md s1
where OMD_SOURCE_ROW_ID = (SELECT MAX(OMD_SOURCE_ROW_ID) 
FROM smoking_phc_md s2
WHERE s1.PATIENT_NUMBER = s2.PATIENT_NUMBER);

