

  create or replace view `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021_VIEWS_ONLY`.`src_requested_test_phc_bp`
  OPTIONS()
  as 

with requested_phc_bp as (

select
SAFE_CAST(lrt.HUB_SITE_PATIENT_SK as string) as PATIENT_NUMBER,
SAFE_CAST(hrt.SITE_ID as string) as SITE_ID,
SAFE_CAST(srtb.PROVIDER_ID as string) as PROVIDER_ID,
SAFE_CAST(hrt.SOURCE_SYSTEM as string) as SOURCE_SYSTEM,
SAFE_CAST('SAT_REQUESTED_TEST_PHC_BP_OMOP' as string) as SOURCE_TABLE,
SAFE_CAST(hrt.REQUEST_ID as string) as REQUEST_ID,
SAFE_CAST(NULL as string) as REQUEST_NO,
CAST(srtb.REQUEST_DATE as timestamp) as REQUEST_DATE,
SAFE_CAST(srtb.REQUEST_STATUS as string) as REQUEST_STATUS_CODE,
SAFE_CAST(srtb.PROVIDER_NAME as string) as PROVIDER_LAB_NAME,
SAFE_CAST(NULL as string) as TEST_REASON,
null as REQUESTED_TESTS,
SAFE_CAST(NULL as string) as EORDER_NO,
SAFE_CAST(NULL as string) as REASON_DISCARD,
SAFE_CAST(srtb.LOCATION_ID as string) as LOCATION_ID,
SAFE_CAST(srtb.RECORD_STATUS as string) as RECORD_STATUS,
SAFE_CAST(srtb.REQUEST_TYPE as string) as REQUEST_TYPE,
SAFE_CAST(srtb.FASTING as int) as FASTING,
SAFE_CAST(srtb.PREGNANT as int) as PREGNANT,
SAFE_CAST(srtb.LAST_MENSTRUAL_PERIOD_DATE as timestamp) as LAST_MENSTRUAL_PERIOD_DATE,
SAFE_CAST(srtb.ESTIMATED_CONFINEMENT_DATE as timestamp) as ESTIMATED_CONFINEMENT_DATE,
SAFE_CAST(srtb.URGENT as int) as URGENT,
SAFE_CAST(srtb.URGENT_BY as int) as URGENT_BY,
SAFE_CAST(srtb.URGENT_PHONE as int) as URGENT_PHONE,
SAFE_CAST(srtb.URGENT_FAX as int) as URGENT_FAX,
SAFE_CAST(srtb.SMEAR_SITE as int) as SMEAR_SITE,
SAFE_CAST(srtb.CERVIX as int) as CERVIX,
SAFE_CAST(srtb.EROSION as int) as EROSION,
SAFE_CAST(srtb.ECTROPION as int) as ECTROPION,
SAFE_CAST(srtb.POST_NATAL as int) as POST_NATAL,
SAFE_CAST(srtb.POST_MENOPAUSAL as int) as POST_MENOPAUSAL,
SAFE_CAST(srtb.ORAL_CONTRACEPTIVE_PILL as int) as ORAL_CONTRACEPTIVE_PILL,
SAFE_CAST(srtb.HORMONE_REPLACEMENT_THERAPY as int) as HORMONE_REPLACEMENT_THERAPY,
SAFE_CAST(srtb.HYSTERECTOMY as int) as HYSTERECTOMY,
SAFE_CAST(srtb.RADIORX as int) as RADIORX,
SAFE_CAST(srtb.INTRAUTERINE_CONTRACEPTIVE_DEVICE as int) as INTRAUTERINE_CONTRACEPTIVE_DEVICE,
SAFE_CAST(srtb.BLEEDING as int) as BLEEDING,
SAFE_CAST(NULL as string) as COPIES,
SAFE_CAST(NULL as string) as BILLING,
SAFE_CAST(srtb.PAP_REGISTER as int) as PAP_REGISTER,
SAFE_CAST(srtb.CREATED_DATETIME as timestamp) as CREATED_DATETIME,
SAFE_CAST(srtb.CREATED_BY as int) as CREATED_BY, 
SAFE_CAST(srtb.UPDATED_DATETIME as timestamp) as UPDATED_DATETIME,
SAFE_CAST(srtb.UPDATED_BY as int) as UPDATED_BY,
SAFE_CAST(srtb.VISIT_ID as int) as VISIT_ID,
SAFE_CAST(srtb.OMD_EFFECTIVE_DATETIME AS TIMESTAMP) AS OMD_EFFECTIVE_DATETIME,
SAFE_CAST(srtb.OMD_SOURCE_ROW_ID AS INT) AS OMD_SOURCE_ROW_ID,
SAFE_CAST(srtb.OMD_INSERT_MODULE_INSTANCE_ID AS INT) AS OMD_INSERT_MODULE_INSTANCE_ID,
SAFE_CAST(srtb.OMD_EXPIRY_DATETIME AS TIMESTAMP) AS OMD_EXPIRY_DATETIME,
SAFE_CAST(srtb.OMD_CURRENT_RECORD_INDICATOR AS STRING) AS OMD_CURRENT_RECORD_INDICATOR,
SAFE_CAST(srtb.OMD_DELETED_RECORD_INDICATOR AS STRING) AS OMD_DELETED_RECORD_INDICATOR,
SAFE_CAST(srtb.OMD_RECORD_SOURCE_ID AS INT) AS OMD_RECORD_SOURCE_ID,
SAFE_CAST(srtb.OMD_HASH_FULL_RECORD AS STRING) AS OMD_HASH_FULL_RECORD
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_REQUESTED_TEST_OMOP` hrt 
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_REQUESTED_TEST_PHC_BP_OMOP` srtb
on hrt.HUB_REQUESTED_TEST_SK = srtb.HUB_REQUESTED_TEST_SK
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
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_PHC_BP_OMOP` ssp
ON hsp.HUB_SITE_PATIENT_SK = ssp.HUB_SITE_PATIENT_SK
WHERE
	srtb.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND srtb.OMD_DELETED_RECORD_INDICATOR = 'N'
	AND lsrt.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND lsrt.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND ssp.OMD_CURRENT_RECORD_INDICATOR = 'Y'
    AND ssp.OMD_DELETED_RECORD_INDICATOR = 'N'

) 

select * from requested_phc_bp;

