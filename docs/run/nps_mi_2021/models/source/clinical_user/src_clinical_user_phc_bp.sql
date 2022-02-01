

  create or replace view `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021_VIEWS_ONLY`.`src_clinical_user_phc_bp`
  OPTIONS()
  as 

with clinical_user_phc_bp as (
select 
cast(hpo.OMD_NPS_SITE_ID as string) as SITE_ID,
cast(NULL as string) as PROVIDER_ID,
cast(sspb.PRESCRIBER_NO as string) as PRESCRIBER_NUMBER,
cast(hpo.PROVIDER_NUMBER as string) as PROVIDER_NUMBER,
cast("PHC_BP" as string) as SOURCE_SYSTEM,
cast(null as int) as CLINICAL_USER_TYPE_CODE,
cast(NULL as string) as CLINICAL_USER_TYPE_NAME,
cast(NULL as string) as DOCTOR_INDICATOR,
cast(NULL as string) as NURSE_INDICATOR,
cast(NULL as string) as PROVIDER_CIS_STATUS,
cast(NULL as string) as PROVIDER_WORK_STATUS,
cast(sspb.INACTIVE_DATE as string) as PROVIDER_INACTIVE_DATE,
cast(sspb.CREATED as string) as CREATE_DATETTIME,
cast(NULL as string) as PROVIDER_UPDATED_USER_ID,
cast(sspb.UPDATED as string) as PROVIDER_UPDATED_DATETIME,
cast(NULL as string) as PRESCRIBER_NUMBER_VALID_FLAG,
cast(NULL as string) as PROVIDER_NUMBER_VALID_FLAG
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_PROVIDER_OMOP` hpo 
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_LOGIN_SITE_PROVIDER_BP_OMOP` llsp 
on hpo.HUB_PROVIDER_SK = llsp.HUB_PROVIDER_SK 
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PROVIDER_PHC_BP_OMOP` sspb 
on llsp.HUB_LOGIN_SK = sspb.HUB_LOGIN_SK 
where 
	sspb.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND sspb.OMD_DELETED_RECORD_INDICATOR = 'N'
)


select * from clinical_user_phc_bp;

