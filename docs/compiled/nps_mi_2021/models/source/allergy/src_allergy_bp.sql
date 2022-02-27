

with allergy_bp as (
select
CAST(sspab.ALLERGY_ITEM_NAME as STRING) as ALLERGY_ITEM_NAME,
CAST(sspab.REACTION_TYPE as STRING) AS REACTION_TYPE,
CAST(lspa.HUB_SITE_PATIENT_SK AS STRING) AS PATIENT_NUMBER,
CAST(hspa.SITE_ID AS STRING) AS SITE_ID,
CAST(hspa.SOURCE_SYSTEM AS STRING) AS SOURCE_SYSTEM,
CAST('SAT_SITE_PATIENT_ALLERGY_BP_OMOP' AS STRING) AS SOURCE_TABLE,
CAST(CASE 
		WHEN sspab.REACTION_SEVERITY = 1
		THEN 1
		WHEN sspab.REACTION_SEVERITY = 2
		THEN 2
		WHEN sspab.REACTION_SEVERITY = 3
		THEN 3
		WHEN sspab.REACTION_SEVERITY = 4
		THEN 4
		ELSE
		0
		END as INT) as ALLERGY_STATUS_CODE,
CAST(CASE 
		WHEN sspab.REACTION_SEVERITY = 1
		THEN 'Mild'
		WHEN sspab.REACTION_SEVERITY = 2
		THEN 'Moderately Severe'
		WHEN sspab.REACTION_SEVERITY = 3
		THEN 'Severe'
		WHEN sspab.REACTION_SEVERITY = 4
		THEN 'Life threatening'
		ELSE
		'Not stated'
		END as string) as ALLERGY_STATUS_NAME,
CAST(hspa.RECORD_ID AS STRING) AS RECORD_ID,
CAST(NULL AS STRING) AS PROVIDER_ID,
CAST(sspab.CREATED_DATETIME AS TIMESTAMP) AS CREATED_DATETIME, 
CAST(sspab.UPDATED_DATETIME AS TIMESTAMP) AS UPDATED_DATETIME,
CAST(sspab.OMD_EFFECTIVE_DATETIME AS TIMESTAMP) AS OMD_EFFECTIVE_DATETIME,
CAST(sspab.OMD_SOURCE_ROW_ID AS INT) AS OMD_SOURCE_ROW_ID,
CAST(sspab.OMD_INSERT_MODULE_INSTANCE_ID AS INT) AS OMD_INSERT_MODULE_INSTANCE_ID,
CAST(sspab.OMD_EXPIRY_DATETIME AS TIMESTAMP) AS OMD_EXPIRY_DATETIME,
CAST(sspab.OMD_CURRENT_RECORD_INDICATOR AS STRING) AS OMD_CURRENT_RECORD_INDICATOR,
CAST(sspab.OMD_DELETED_RECORD_INDICATOR AS STRING) AS OMD_DELETED_RECORD_INDICATOR,
CAST(sspab.OMD_RECORD_SOURCE_ID AS INT) AS OMD_RECORD_SOURCE_ID,
CAST(sspab.OMD_HASH_FULL_RECORD AS STRING) AS OMD_HASH_FULL_RECORD
FROM 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_ALLERGY_OMOP` hspa
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_ALLERGY_BP_OMOP` sspab
ON hspa.HUB_SITE_PATIENT_ALLERGY_SK = sspab.HUB_SITE_PATIENT_ALLERGY_SK
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
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_BP_OMOP` ssp
ON hsp.HUB_SITE_PATIENT_SK = ssp.HUB_SITE_PATIENT_SK
WHERE
	sspab.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND sspab.OMD_DELETED_RECORD_INDICATOR = 'N'
	AND lsspa.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND lsspa.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND ssp.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND ssp.OMD_DELETED_RECORD_INDICATOR = 'N'
)

SELECT DISTINCT * FROM 
allergy_bp s1
where OMD_SOURCE_ROW_ID = (SELECT MAX(OMD_SOURCE_ROW_ID) 
FROM allergy_bp s2
WHERE s1.PATIENT_NUMBER = s2.PATIENT_NUMBER)