

  create or replace view `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021_VIEWS_ONLY`.`src_reaction_phc_md`
  OPTIONS()
  as 

with allergy_phc_md as (
select
CAST(ssprpm.ITEM as STRING) as ALLERGY_ITEM_NAME,
CAST(ssprpm.TYPE as STRING) AS REACTION_TYPE,
CAST(lspa.HUB_SITE_PATIENT_SK AS STRING) AS PATIENT_NUMBER,
CAST(hspa.SITE_ID AS STRING) AS SITE_ID,
CAST(hspa.SOURCE_SYSTEM AS STRING) AS SOURCE_SYSTEM,
CAST('SAT_SITE_PATIENT_REACTION_PHC_MD_OMOP' AS STRING) AS SOURCE_TABLE,
CAST(CASE 
		WHEN ssprpm.SEVERITY = 1
		THEN 1
		WHEN ssprpm.SEVERITY = 2
		THEN 2
		WHEN ssprpm.SEVERITY = 3
		THEN 3
		WHEN ssprpm.SEVERITY = 4
		THEN 4
		ELSE
		0
		END as INT) as ALLERGY_STATUS_CODE,
CAST(CASE 
		WHEN ssprpm.SEVERITY = 1
		THEN 'Mild'
		WHEN ssprpm.SEVERITY = 2
		THEN 'Moderately Severe'
		WHEN ssprpm.SEVERITY = 3
		THEN 'Severe'
		WHEN ssprpm.SEVERITY = 4
		THEN 'Life threatening'
		ELSE
		'Not stated'
		END as string) as ALLERGY_STATUS_NAME,
CAST(hspa.RECORD_ID AS STRING) AS RECORD_ID,
CAST(NULL AS STRING) AS PROVIDER_ID,
CAST(ssprpm.STAMP_CREATED_DATETIME AS TIMESTAMP) AS CREATED_DATETIME, 
CAST(ssprpm.STAMP_DATETIME AS TIMESTAMP) AS UPDATED_DATETIME,
CAST(ssprpm.OMD_EFFECTIVE_DATETIME AS TIMESTAMP) AS OMD_EFFECTIVE_DATETIME,
CAST(ssprpm.OMD_SOURCE_ROW_ID AS INT) AS OMD_SOURCE_ROW_ID,
CAST(ssprpm.OMD_INSERT_MODULE_INSTANCE_ID AS INT) AS OMD_INSERT_MODULE_INSTANCE_ID,
CAST(ssprpm.OMD_EXPIRY_DATETIME AS TIMESTAMP) AS OMD_EXPIRY_DATETIME,
CAST(ssprpm.OMD_CURRENT_RECORD_INDICATOR AS STRING) AS OMD_CURRENT_RECORD_INDICATOR,
CAST(ssprpm.OMD_DELETED_RECORD_INDICATOR AS STRING) AS OMD_DELETED_RECORD_INDICATOR,
CAST(ssprpm.OMD_RECORD_SOURCE_ID AS INT) AS OMD_RECORD_SOURCE_ID,
CAST(ssprpm.OMD_HASH_FULL_RECORD AS STRING) AS OMD_HASH_FULL_RECORD
FROM 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_ALLERGY_OMOP` hspa
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_REACTION_PHC_MD_OMOP` ssprpm
ON hspa.HUB_SITE_PATIENT_ALLERGY_SK = ssprpm.HUB_SITE_PATIENT_ALLERGY_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_SITE_PATIENT_ALLERGY_OMOP` lspa
ON hspa.HUB_SITE_PATIENT_ALLERGY_SK = lspa.HUB_SITE_PATIENT_ALLERGY_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LSAT_SITE_PATIENT_ALLERGY_OMOP` lsspa
ON lspa.LNK_SITE_PATIENT_ALLERGY_SK = lsspa.LNK_SITE_PATIENT_ALLERGY_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` hsp
ON lspa.HUB_SITE_PATIENT_SK = hsp.HUB_SITE_PATIENT_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_PHC_MD_OMOP` ssp
ON hsp.HUB_SITE_PATIENT_SK = ssp.HUB_SITE_PATIENT_SK
WHERE
	ssprpm.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND ssprpm.OMD_DELETED_RECORD_INDICATOR = 'N'
	AND lsspa.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND lsspa.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND ssp.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND ssp.OMD_DELETED_RECORD_INDICATOR = 'N'
)

SELECT DISTINCT * FROM 
allergy_phc_md s1
where OMD_SOURCE_ROW_ID = (SELECT MAX(OMD_SOURCE_ROW_ID) 
FROM allergy_phc_md s2
WHERE s1.PATIENT_NUMBER = s2.PATIENT_NUMBER);

