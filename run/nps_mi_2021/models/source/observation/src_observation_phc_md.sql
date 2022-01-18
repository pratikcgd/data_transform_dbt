

  create or replace view `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_observation_phc_md`
  OPTIONS()
  as 

with observation_phc_md as (
select
cast(lo.HUB_SITE_PATIENT_SK as STRING) AS PATIENT_NUMBER,
cast(hub.SITE_ID AS STRING) AS SITE_ID,
cast(hub.SOURCE_SYSTEM AS STRING) AS SOURCE_SYSTEM,
cast('SAT_OBSERVATION_PHC_MD_OMOP' AS STRING) AS SOURCE_TABLE,
cast(sobo.TYPE as STRING) as OBSERVATION_TYPE,
cast(hub.OBSERVATION_ID as STRING) as OBSERVATION_ID,
NULL as PROVIDER_ID,
cast(sobo.MEASUREMENT as STRING) as OBSERVATION_VALUE,
null as OBSERVATION_MODIFIER,
cast(sobo.MEASUREMENT_CODE as int) as OBSERVATION_CODE,
cast(NULL as string) as RECORD_STATUS,
cast(sobo.MEASUREMENT_DATETIME as TIMESTAMP) AS OBSERVATION_DATETIME,
cast(sobo.STAMP_CREATED_DATETIME as TIMESTAMP) as CREATED_DATETIME,
cast(NULL as timestamp) as UPDATED_DATETIME,
CAST(sobo.OMD_EFFECTIVE_DATETIME AS TIMESTAMP) AS OMD_EFFECTIVE_DATETIME,
CAST(sobo.OMD_SOURCE_ROW_ID AS INT) AS OMD_SOURCE_ROW_ID,
CAST(sobo.OMD_INSERT_MODULE_INSTANCE_ID AS INT) AS OMD_INSERT_MODULE_INSTANCE_ID,
CAST(sobo.OMD_EXPIRY_DATETIME AS TIMESTAMP) AS OMD_EXPIRY_DATETIME,
CAST(sobo.OMD_CURRENT_RECORD_INDICATOR AS STRING) AS OMD_CURRENT_RECORD_INDICATOR,
CAST(sobo.OMD_DELETED_RECORD_INDICATOR AS STRING) AS OMD_DELETED_RECORD_INDICATOR,
CAST(sobo.OMD_RECORD_SOURCE_ID AS INT) AS OMD_RECORD_SOURCE_ID,
CAST(sobo.OMD_HASH_FULL_RECORD AS STRING) AS OMD_HASH_FULL_RECORD 
FROM 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_OBSERVATION_OMOP` hub 
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_OBSERVATION_PHC_MD_OMOP` sobo  
on hub.HUB_OBSERVATION_SK = sobo.HUB_OBSERVATION_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_OBSERVATION_OMOP` lo
on hub.HUB_OBSERVATION_SK = lo.HUB_OBSERVATION_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LSAT_OBSERVATION_OMOP` ls
on lo.LNK_OBSERVATION_SK = ls.LNK_OBSERVATION_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` hsp
ON lo.HUB_SITE_PATIENT_SK = hsp.HUB_SITE_PATIENT_SK
INNER join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_PHC_MD_OMOP` ssp
ON hsp.HUB_SITE_PATIENT_SK = ssp.HUB_SITE_PATIENT_SK
WHERE
	sobo.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND sobo.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND ls.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND ls.OMD_DELETED_RECORD_INDICATOR = 'N'
	AND ssp.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND ssp.OMD_DELETED_RECORD_INDICATOR = 'N'
)

select * from observation_phc_md;

