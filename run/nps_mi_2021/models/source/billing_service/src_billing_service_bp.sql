

  create or replace view `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_billing_service_bp`
  OPTIONS()
  as 
with billing_service_bp as (
select
CAST(lbdvbs.HUB_SITE_PATIENT_SK AS STRING) AS PATIENT_NUMBER,
CAST(hbs.SITE_ID AS STRING) AS SITE_ID , 
CAST(hbs.SOURCE_SYSTEM AS STRING) AS SOURCE_SYSTEM, 
'SAT_BILLING_SERVICE_BP_OMOP' AS SOURCE_TABLE,
CAST(null AS STRING) AS PROVIDER_ID, 
CAST(hbs.BILLING_SERVICE_ID AS STRING) as SERVICE_ID,
CAST(sbdvbs.BILLING_SERVICE_DATE AS TIMESTAMP) AS SERVICE_DATETIME,
CAST(sbsb.SERVICES_MBS_ITEM AS STRING) AS ITEM_NUMBER,
CAST(sbsb.SERVICES_PATIENTS AS INT) AS SERVICE_PATIENT_COUNT,
CAST(sbsb.SERVICES_RECORD_STATUS AS STRING) as SERVICE_RECORD_STATUS,
CAST(sbdvbs.BILLING_SERVICE_VISIT_DATE AS TIMESTAMP) as VISIT_DATETIME,
CAST(sbsb.SERVICES_CREATED AS TIMESTAMP) AS CREATED_DATETIME,
CAST(sbsb.SERVICES_UPDATED AS TIMESTAMP) AS UPDATED_DATETIME,
CAST(sbsb.OMD_EFFECTIVE_DATETIME AS TIMESTAMP) AS OMD_EFFECTIVE_DATETIME,
CAST(sbsb.OMD_SOURCE_ROW_ID AS INT) AS OMD_SOURCE_ROW_ID,
CAST(sbsb.OMD_INSERT_MODULE_INSTANCE_ID AS INT) AS OMD_INSERT_MODULE_INSTANCE_ID,
CAST(sbsb.OMD_EXPIRY_DATETIME AS TIMESTAMP) AS OMD_EXPIRY_DATETIME,
CAST(sbsb.OMD_CURRENT_RECORD_INDICATOR AS STRING) AS OMD_CURRENT_RECORD_INDICATOR,
CAST(sbsb.OMD_DELETED_RECORD_INDICATOR AS STRING) AS OMD_DELETED_RECORD_INDICATOR,
CAST(sbsb.OMD_RECORD_SOURCE_ID AS INT) AS OMD_RECORD_SOURCE_ID,
CAST(sbsb.OMD_HASH_FULL_RECORD AS STRING) AS OMD_HASH_FULL_RECORD
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_BILLING_SERVICE_OMOP` hbs
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_BILLING_SERVICE_BP_OMOP` sbsb
on hbs.HUB_BILLING_SERVICE_SK = sbsb.HUB_BILLING_SERVICE_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_BDV_BILLING_SERVICE_OMOP` sbdvbs
on hbs.HUB_BILLING_SERVICE_SK = sbdvbs.HUB_BILLING_SERVICE_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_BDV_BILLING_SERVICE_OMOP` lbdvbs
on hbs.HUB_BILLING_SERVICE_SK = lbdvbs.HUB_BILLING_SERVICE_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LSAT_BDV_BILLING_SERVICE_OMOP` lsbdvbs
ON lbdvbs.LNK_BDV_BILLING_SERVICE_SK = lsbdvbs.LNK_BDV_BILLING_SERVICE_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` hsp
ON lbdvbs.HUB_SITE_PATIENT_SK = hsp.HUB_SITE_PATIENT_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_BP_OMOP` ssp
ON hsp.HUB_SITE_PATIENT_SK = ssp.HUB_SITE_PATIENT_SK
WHERE
	sbsb.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND sbsb.OMD_DELETED_RECORD_INDICATOR = 'N'
	AND sbdvbs.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND sbdvbs.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND lsbdvbs.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND lsbdvbs.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND ssp.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND ssp.OMD_DELETED_RECORD_INDICATOR = 'N'
)

select * from billing_service_bp;

