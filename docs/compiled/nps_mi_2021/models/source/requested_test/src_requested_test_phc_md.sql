

with requested_phc_md as (

select
SAFE_CAST(lrt.HUB_SITE_PATIENT_SK as string) as PATIENT_NUMBER,
SAFE_CAST(hrt.SITE_ID as string) as SITE_ID,
SAFE_CAST(NULL as string) as PROVIDER_ID,
SAFE_CAST(hrt.SOURCE_SYSTEM as string) as SOURCE_SYSTEM,
SAFE_CAST('SAT_REQUESTED_TEST_PHC_MD_OMOP' as string) as SOURCE_TABLE,
SAFE_CAST(NULL as string) as REQUEST_ID,
SAFE_CAST(srtpm.REQUEST_NO as string) as REQUEST_NO,
CAST(srtpm.REQUEST_DATE as timestamp) as REQUEST_DATE,
SAFE_CAST(srtpm.STATUS_CODE as string) as REQUEST_STATUS_CODE,
SAFE_CAST(srtpm.LAB_NAME as string) as PROVIDER_LAB_NAME,
SAFE_CAST(srtpm.REASON as string) as TEST_REASON,
null as REQUESTED_TESTS,
SAFE_CAST(srtpm.EORDER_NO as string) as EORDER_NO,
SAFE_CAST(srtpm.REASON_DISCARD as string) as REASON_DISCARD,
SAFE_CAST(NULL as string) as LOCATION_ID,
SAFE_CAST(NULL as string) as RECORD_STATUS,
SAFE_CAST(NULL as string) as REQUEST_TYPE,
SAFE_CAST(NULL as int) as FASTING,
SAFE_CAST(NULL as int) as PREGNANT,
SAFE_CAST(NULL as timestamp) as LAST_MENSTRUAL_PERIOD_DATE,
SAFE_CAST(NULL as timestamp) as ESTIMATED_CONFINEMENT_DATE,
SAFE_CAST(NULL as int) as URGENT,
SAFE_CAST(NULL as int) as URGENT_BY,
SAFE_CAST(NULL as int) as URGENT_PHONE,
SAFE_CAST(NULL as int) as URGENT_FAX,
SAFE_CAST(NULL as int) as SMEAR_SITE,
SAFE_CAST(NULL as int) as CERVIX,
SAFE_CAST(NULL as int) as EROSION,
SAFE_CAST(NULL as int) as ECTROPION,
SAFE_CAST(NULL as int) as POST_NATAL,
SAFE_CAST(NULL as int) as POST_MENOPAUSAL,
SAFE_CAST(NULL as int) as ORAL_CONTRACEPTIVE_PILL,
SAFE_CAST(NULL as int) as HORMONE_REPLACEMENT_THERAPY,
SAFE_CAST(NULL as int) as HYSTERECTOMY,
SAFE_CAST(NULL as int) as RADIORX,
SAFE_CAST(NULL as int) as INTRAUTERINE_CONTRACEPTIVE_DEVICE,
SAFE_CAST(NULL as int) as BLEEDING,
SAFE_CAST(NULL as string) as COPIES,
SAFE_CAST(NULL as string) as BILLING,
SAFE_CAST(NULL as int) as PAP_REGISTER,
SAFE_CAST(srtpm.STAMP_CREATED_DATETIME as timestamp) as CREATED_DATETIME,
SAFE_CAST(srtpm.STAMP_USER_ID as int) as CREATED_BY, 
SAFE_CAST(srtpm.STAMP_DATETIME as timestamp) as UPDATED_DATETIME,
SAFE_CAST(srtpm.STAMP_USER_ID as int) as UPDATED_BY,
NULL as VISIT_ID,
SAFE_CAST(srtpm.OMD_EFFECTIVE_DATETIME AS TIMESTAMP) AS OMD_EFFECTIVE_DATETIME,
SAFE_CAST(srtpm.OMD_SOURCE_ROW_ID AS INT) AS OMD_SOURCE_ROW_ID,
SAFE_CAST(srtpm.OMD_INSERT_MODULE_INSTANCE_ID AS INT) AS OMD_INSERT_MODULE_INSTANCE_ID,
SAFE_CAST(srtpm.OMD_EXPIRY_DATETIME AS TIMESTAMP) AS OMD_EXPIRY_DATETIME,
SAFE_CAST(srtpm.OMD_CURRENT_RECORD_INDICATOR AS STRING) AS OMD_CURRENT_RECORD_INDICATOR,
SAFE_CAST(srtpm.OMD_DELETED_RECORD_INDICATOR AS STRING) AS OMD_DELETED_RECORD_INDICATOR,
SAFE_CAST(srtpm.OMD_RECORD_SOURCE_ID AS INT) AS OMD_RECORD_SOURCE_ID,
SAFE_CAST(srtpm.OMD_HASH_FULL_RECORD AS STRING) AS OMD_HASH_FULL_RECORD
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_REQUESTED_TEST_OMOP` hrt 
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_REQUESTED_TEST_PHC_MD_OMOP` srtpm
on hrt.HUB_REQUESTED_TEST_SK = srtpm.HUB_REQUESTED_TEST_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_REQUESTED_TEST_OMOP` lrt 
on hrt.HUB_REQUESTED_TEST_SK = lrt.HUB_REQUESTED_TEST_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LSAT_REQUESTED_TEST_OMOP` lsrt 
on lrt.LNK_REQUESTED_TEST_SK=lsrt.LNK_REQUESTED_TEST_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` hsp
ON lrt.HUB_SITE_PATIENT_SK = hsp.HUB_SITE_PATIENT_SK
inner join
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_PHC_MD_OMOP` ssp
ON hsp.HUB_SITE_PATIENT_SK = ssp.HUB_SITE_PATIENT_SK
WHERE
	srtpm.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND srtpm.OMD_DELETED_RECORD_INDICATOR = 'N'
	AND lsrt.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND lsrt.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND ssp.OMD_CURRENT_RECORD_INDICATOR = 'Y'
    AND ssp.OMD_DELETED_RECORD_INDICATOR = 'N'

) 

select * from requested_phc_md