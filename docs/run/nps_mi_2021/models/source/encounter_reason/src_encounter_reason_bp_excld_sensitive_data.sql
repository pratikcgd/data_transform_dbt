

  create or replace view `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021_VIEWS_ONLY`.`src_encounter_reason_bp_excld_sensitive_data`
  OPTIONS()
  as 

with encounter_reason_bp as (

select 
cast(leo.HUB_SITE_PATIENT_SK AS STRING) AS PATIENT_NUMBER,
cast(hero.SITE_ID AS STRING) AS SITE_ID,
NULL as PROVIDER_ID,
cast("BP" AS STRING) AS SOURCE_SYSTEM,
cast('SAT_ENCOUNTR_REASON_BP_EXCLD_SENSITIVE_DATA_OMOP' as STRING) AS SOURCE_TABLE,
cast(hero.ENCOUNTER_REASON_ID AS STRING) AS ENCOUNTER_ID,
cast(sebo.VISIT_DATE AS TIMESTAMP) AS VISIT_DATETIME,
cast(serb.ENCOUNTER_REASON as STRING) AS ENCOUNTER_REASONS,
cast(sebo.VISIT_TYPE AS STRING) AS ENCOUNTER_TYPE,
cast(serb.REASON_CODE as STRING) AS ENCOUNTER_REASON_CODE,
cast(serb.CREATED_DATETIME as TIMESTAMP) AS CREATED_DATETIME,
cast(serb.UPDATED_DATETIME AS TIMESTAMP) AS UPDATED_DATETIME,
CAST(serb.OMD_EFFECTIVE_DATETIME AS TIMESTAMP) AS OMD_EFFECTIVE_DATETIME,
CAST(serb.OMD_SOURCE_ROW_ID AS INT) AS OMD_SOURCE_ROW_ID,
CAST(serb.OMD_INSERT_MODULE_INSTANCE_ID AS INT) AS OMD_INSERT_MODULE_INSTANCE_ID,
CAST(serb.OMD_EXPIRY_DATETIME AS TIMESTAMP) AS OMD_EXPIRY_DATETIME,
CAST(serb.OMD_CURRENT_RECORD_INDICATOR AS STRING) AS OMD_CURRENT_RECORD_INDICATOR,
CAST(serb.OMD_DELETED_RECORD_INDICATOR AS STRING) AS OMD_DELETED_RECORD_INDICATOR,
CAST(serb.OMD_RECORD_SOURCE_ID AS INT) AS OMD_RECORD_SOURCE_ID,
CAST(serb.OMD_HASH_FULL_RECORD AS STRING) AS OMD_HASH_FULL_RECORD
from
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_ENCOUNTER_REASON_BP_OMOP` hero
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_ENCOUNTER_REASON_BP_OMOP` lerb 
on hero.HUB_ENCOUNTER_REASON_BP_SK=lerb.HUB_ENCOUNTER_REASON_BP_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_ENCOUNTER_OMOP` leo
on lerb.HUB_ENCOUNTER_SK = leo.HUB_ENCOUNTER_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LSAT_ENCOUNTER_OMOP` lseo
on leo.LNK_ENCOUNTER_SK = lseo.LNK_ENCOUNTER_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LSAT_ENCOUNTER_REASON_BP_OMOP` lserb 
on lerb.LNK_ENCOUNTER_REASON_BP_SK = lserb.LNK_ENCOUNTER_REASON_BP_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_ENCOUNTER_BP_OMOP` sebo
on lerb.HUB_ENCOUNTER_SK = sebo.HUB_ENCOUNTER_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_ENCOUNTR_REASON_BP_EXCLD_SENSITIVE_DATA_OMOP` serb
on lerb.HUB_ENCOUNTER_REASON_BP_SK = serb.HUB_ENCOUNTER_REASON_BP_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` hsp
ON leo.HUB_SITE_PATIENT_SK = hsp.HUB_SITE_PATIENT_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_BP_OMOP` ssp
ON hsp.HUB_SITE_PATIENT_SK = ssp.HUB_SITE_PATIENT_SK
WHERE
	sebo.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND sebo.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND serb.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND serb.OMD_DELETED_RECORD_INDICATOR = 'N'
	AND lserb.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND lserb.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND lseo.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND lseo.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND ssp.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND ssp.OMD_DELETED_RECORD_INDICATOR = 'N'
)

select * from encounter_reason_bp;

