


with immunization_phc_md as (

select 
SAFE_CAST(lisp.HUB_SITE_PATIENT_SK as string) as PATIENT_NUMBER,
SAFE_CAST(hio.IMMUNISATION_ID as string) as IMMUNISATION_ID,
SAFE_CAST(sib.GIVEN_HERE as int) as GIVEN_HERE,
SAFE_CAST(NULL as string) as PROVIDER_ID,
SAFE_CAST(null as int) as ADMINISTERED_BY,
SAFE_CAST(sib.GIVEN_DATETIME as timestamp) as GIVEN_DATE,
SAFE_CAST(sib.TYPE as string) as VACCINE_NAME,
SAFE_CAST(NULL as string) as VACCINE_ID,
SAFE_CAST(sib.BATCH as string) as BATCH_NUMBER,
SAFE_CAST(sib.SEQUENCE AS int) AS SEQUENCE_NUMBER, 
SAFE_CAST(sib.CONSENT as int) as CONSENT_CODE,
SAFE_CAST(sib.CONSENT_PROVIDER as string) as CONSENT_PROVIDER,
SAFE_CAST(sib.SITE_CODE as string) as SITE_CODE,
SAFE_CAST(NULL as string) AS ADMINISTERED_ROUTE,
SAFE_CAST(NULL as string) AS VIVAS_STATUS, 
SAFE_CAST(null as timestamp) AS VIVAS_PRINTED_DATE, 
SAFE_CAST(NULL as string) AS ACIR_STATUS, 
SAFE_CAST(null as int) as AGE,
SAFE_CAST(null as timestamp) AS ACIR_TRANSMITTED_DATE,
SAFE_CAST(sib.INTERNAL_AGE as string) as INTERNAL_AGE,
SAFE_CAST(sib.INTERNAL_IMM as string) as INTERNAL_IMM,
SAFE_CAST(sib.STAMP_CREATED_DATETIME AS TIMESTAMP) as CREATED_DATETIME, 
SAFE_CAST(null as int) as CREATED_BY, 
SAFE_CAST(sib.STAMP_DATETIME AS TIMESTAMP) AS UPDATED_DATETIME, 
SAFE_CAST(null as int) as UPDATED_BY, 
SAFE_CAST(NULL as string) as RECORD_STATUS,
SAFE_CAST(sib.PRINTED_DATETIME as timestamp) as PRINTED_DATETIME,
SAFE_CAST(sib.DRUG_NO as string) as DRUG_NO,
SAFE_CAST(NULL as string) as INFLUENZA, 
SAFE_CAST(NULL as string) AS INFLUENZA_SENT,
SAFE_CAST(hio.SITE_ID as string) as SITE_ID,
SAFE_CAST(hio.SOURCE_SYSTEM as string) as SOURCE_SYSTEM,
SAFE_CAST(sib.OMD_EFFECTIVE_DATETIME AS TIMESTAMP) AS OMD_EFFECTIVE_DATETIME,
SAFE_CAST(sib.OMD_SOURCE_ROW_ID AS INT) AS OMD_SOURCE_ROW_ID,
SAFE_CAST(sib.OMD_INSERT_MODULE_INSTANCE_ID AS INT) AS OMD_INSERT_MODULE_INSTANCE_ID,
SAFE_CAST(sib.OMD_EXPIRY_DATETIME AS TIMESTAMP) AS OMD_EXPIRY_DATETIME,
SAFE_CAST(sib.OMD_CURRENT_RECORD_INDICATOR AS STRING) AS OMD_CURRENT_RECORD_INDICATOR,
SAFE_CAST(sib.OMD_DELETED_RECORD_INDICATOR AS STRING) AS OMD_DELETED_RECORD_INDICATOR,
SAFE_CAST(sib.OMD_RECORD_SOURCE_ID AS INT) AS OMD_RECORD_SOURCE_ID,
SAFE_CAST(sib.OMD_HASH_FULL_RECORD AS STRING) AS OMD_HASH_FULL_RECORD

from `nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_IMMUNISATION_OMOP` hio 
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_IMMUNISATION_PHC_MD_OMOP` sib 
on hio.HUB_IMMUNISATION_SK = sib.HUB_IMMUNISATION_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_IMMUNISATION_SITE_PATIENT_OMOP` lisp 
on hio.HUB_IMMUNISATION_SK = lisp.HUB_IMMUNISATION_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LSAT_IMMUNISATION_SITE_PATIENT_OMOP` lsisp
on lisp.LNK_IMMUNISATION_SITE_PATIENT_SK = lsisp.LNK_IMMUNISATION_SITE_PATIENT_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` hsp
ON lisp.HUB_SITE_PATIENT_SK = hsp.HUB_SITE_PATIENT_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_PHC_MD_OMOP` ssp
ON hsp.HUB_SITE_PATIENT_SK = ssp.HUB_SITE_PATIENT_SK
WHERE
	sib.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND sib.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND lsisp.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND lsisp.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND ssp.OMD_CURRENT_RECORD_INDICATOR = 'Y'
    AND ssp.OMD_DELETED_RECORD_INDICATOR = 'N'
)

select * from immunization_phc_md